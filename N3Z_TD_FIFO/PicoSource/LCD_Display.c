/*****************************************************************************
** File Name : LCD_Display.c
** Overview : Handles the LCD and menu system
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	May 2016	PA		Original Version

** All Rights Reserved(c) Association Nicola, Graham Naylor, Pete Allwright



*****************************************************************************/


/* Standard includes. */
#include <stdio.h>
#include <limits.h>

#include "ps7_init.h"

/* Xilinx includes. */
#include "platform.h"
#include "xparameters.h"
#include "xscutimer.h"
#include "xscugic.h"
#include "xil_exception.h"

#include "xuartps_hw.h"


/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "timers.h"
#include "xgpiops.h"

#include "NicolaTypes.h"




extern QueueHandle_t	consoleTransmitQueue ;			// in ConsoleManager.c
extern QueueHandle_t	PLTransmitQueue ;				// in PSPLComms.c

extern void BluetoothBeginInquiry( int selected ) ;		// in Bluetooth.c

extern void SetMicrophoneVolume(int selected );		/* in RadioInterface.c		*/
extern void SetAerialType(int selected );			/* in RadioInterface.c		*/
extern void SetAerialFrequency(int selected );		/* in RadioInterface.c		*/
extern void SendWatchdogMessage( void ) ;			/* in RadioInterface.c		*/

void SetConfidenceBeepTime(int selected );			/* in this module			*/
void SetBeaconBeepTime(int selected );				/* in this module			*/
extern void SendPresetMessage(int selected);		/* in RadioInterface.c		*/
void EffectTurnRadioOff(int selected );				/* in this module			*/
void SetDebuggingState(int selected );				/* in this module			*/


extern QueueHandle_t	DebugControlQueue; 	/* in DebugInterface.c */



/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */

#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID


/* debug enables */

// enable TEST_CLEAR_FLASH to clear flash at start up

// enable TEST_DEFAULT_MENU if using default test menu.
// if enabled then the download from host PC will not work

#define TEST_CLEAR_FLASH

#define TEST_DEFAULT_MENU

// enable debug message from the KEYPAD test code

#define KEY_DEBUG_MESSAGES


/*  GPIO definitions */

#define GPIO0DIR  ((unsigned int *) 0xE000A204)
#define GPIO0OEN  ((unsigned int *) 0xE000A208)
#define GPIO0dataMasked ((unsigned int *) 0xE000A000)
#define GPIO0InputData ((unsigned int *) 0xE000A060)
#define GPIO0InputDataX ((unsigned int *) 0xE000A068)   /* inputs appear in this register ! */

#define GPIO2DIR  ((unsigned int *) 0xE000A284)
#define GPIO2OEN  ((unsigned int *) 0xE000A288)
#define GPIO2dataMasked ((unsigned int *) 0xE000A010)
#define GPIO2data ((unsigned int *) 0xE000A048)
#define GPIO2dataX ((unsigned int *) 0xE000A048)



/* LCD defines */

#define FIRST_LINE	0
#define SECOND_LINE	1


#define LCD_RS		0x0100	/* command (1) or data (0) */
#define LCD_RW		0x0200	/* read (1) or write (0)   */
#define ENABLE_BIT	0x0400	/* enable if 1 */
#define BACKLIGHT	0x0800


#define		LCD_DataMask	(0xFF000000)
#define		LCD_CommandMask	(0xFEFF0000)
#define		LCD_WriteMask	(0xFDFF0000)
#define		LCD_EnableMask	(0xFBFF0000)

#define		LCD_BackLightMask	(0xF7FF0000)


#define LCD_RegisterSelect	(0x100)
#define LCD_ReadWrite		(0x200)
#define LCD_Enable			(0x400)

#define CONTROL_SIGNAL_HIGH (*GPIO2dataMasked = LCD_CommandMask + LCD_RS)
#define CONTROL_SIGNAL_LOW  (*GPIO2dataMasked = LCD_CommandMask + (~LCD_RS))

#define WRITE_SIGNAL_HIGH (*GPIO2dataMasked = LCD_WriteMask + LCD_RW)
#define WRITE_SIGNAL_LOW  (*GPIO2dataMasked = LCD_WriteMask + (~LCD_RW))

#define ENABLE_SIGNAL_HIGH (*GPIO2dataMasked = LCD_EnableMask + LCD_Enable)
#define ENABLE_SIGNAL_LOW  (*GPIO2dataMasked = LCD_EnableMask + (~LCD_Enable))

/* Menu scrolling constants */

#define TOP_LEVEL  (-1)
#define PENDING_CONFIRM  (-2)


/* these definitions are local to this source; the PC programme	*/
/* recognises the MENU_ITEM_TYPE below and we here catagorise	*/
/* accordingly.													*/

#define SUB_MENU_TEXT			1
#define SUB_MENU_SCROLL_TEXT	2
#define SUB_MENU_INTEGER		3



/* these definitions will be downloaded from the PC Manager		*/
/*  when the menu system is configured 							*/

typedef enum
{
	MENU_ITEM_TYPE_NONE,
	MENU_ITEM_TYPE_MICROPHONE_VOLUME = 'A',	/*    0 */
	MENU_ITEM_TYPE_AERIAL_TYPE,				/* B  1 */
	MENU_ITEM_TYPE_FREQUENCY,				/* C  2 */
	MENU_ITEM_TYPE_CONFIDENCE_BEEP,			/* D  3 */
	MENU_ITEM_TYPE_BEACON_BEEP,				/* E  4 */
	MENU_ITEM_TYPE_BLUETOOTH_PAIRING,		/* F  5 */
	MENU_ITEM_TYPE_PRESET_TEXT_MSGS,		/* G  6 */
	MENU_ITEM_TYPE_RECVD_TEXT_MSGS,			/* H  7 */
	MENU_ITEM_TYPE_DEBUGGING,				/* I  8 */
	MENU_ITEM_TYPE_VERSION_NUMBER,			/* J  9 */

	MENU_ITEM_TYPE_TURN_OFF = 'Z'

} MENU_ITEM_TYPE;



/* Menu structures */

typedef struct sub_menu_item_struct
{
	struct sub_menu_item_struct *nextSubMenu;
	struct sub_menu_item_struct *previousSubMenu;

	int		 	value;
	char		subMenuHeading[18];

} SUB_MENU_ITEM;

typedef struct sub_menu_scroll_item_struct
{
	struct sub_menu_scroll_item_struct *nextSubMenu;
	struct sub_menu_scroll_item_struct *previousSubMenu;

	int		 	value;
	char		*subMenuHeading ;
	char		*currentPosition ;

} SUB_MENU_SCROLL_ITEM;


typedef struct main_menu_item_struct
{
	struct main_menu_item_struct *nextMainMenu;
	struct main_menu_item_struct *previousMainMenu;

	char			heading[18];
	SUB_MENU_ITEM 	*firstSubMenu;		/* initial sub menu pointer */
	void			(*menuItemChanged)(int);	/* called when change is confirmed	*/
	int				SubMenuClass;				/* text, scrolling text, integer ... */
	int				SubMenuType;
	SUB_MENU_ITEM	*currentSubMenu;	/* pointer during editing process */
	SUB_MENU_ITEM	*lastSubMenu;		/* pointer during editing process */
	int 			currentValue;		/* current setting		*/
	int 			lastValue;			/* last setting		*/

} MAIN_MENU_ITEM;


/* size of the menu items in the flash block - allows for future changes		*/
/* so any additional fields must be at the end of the structure(s)				*/

#define SETTINGS_IN_FLASH			256			/* allow plenty for futures */
#define MAIN_MENU_ITEM_IN_FLASH		128			/* allow for futures */
#define SUB_MENU_ITEM_IN_FLASH		64			/* allow for futures */
#define SUB_MENU_SCROLL_TEXT_IN_FLASH 128		/* allow for futures */
#define SUB_MENU_SCROLL_TEXT_STRLEN 128			/* allow for futures */

extern void SetMicrophoneVolume(int  );

int 	MicrophoneVolume = DEFAULT_VOLUME ;
int		DisplayVolumeCounter = 0 ;

#ifdef TEST_DEFAULT_MENU


/* test harness for the menu system - September 2016 */



#if 0

// now uses LEFT and DOWN or RIGHT and DOWN to decrease or increase volume

SUB_MENU_ITEM	microphoneVolume1;
SUB_MENU_ITEM	microphoneVolume2;
SUB_MENU_ITEM	microphoneVolume3;
SUB_MENU_ITEM	microphoneVolume4;
SUB_MENU_ITEM	microphoneVolume5;


SUB_MENU_ITEM	microphoneVolume1 =
		{ &microphoneVolume2, &microphoneVolume5, 4, "HIGH" };

SUB_MENU_ITEM	microphoneVolume2 =
		{ &microphoneVolume3, &microphoneVolume1, 3,  "3/4 " };

SUB_MENU_ITEM	microphoneVolume3 =
		{ &microphoneVolume4, &microphoneVolume2, 2 , "1/2 "};

SUB_MENU_ITEM	microphoneVolume4 =
		{ &microphoneVolume5, &microphoneVolume3, 1, "1/4 " };

SUB_MENU_ITEM	microphoneVolume5 =
		{ NULL, &microphoneVolume4, 0, "OFF " };
#endif


SUB_MENU_ITEM	aerialTypeSetting;
SUB_MENU_ITEM	aerialTypeSetting1;

SUB_MENU_ITEM	aerialTypeSetting =
		{ &aerialTypeSetting1, NULL, 2, "EARTHED" };

SUB_MENU_ITEM	aerialTypeSetting1 =
		{ NULL, &aerialTypeSetting1, 1 , "LOOP   "};



SUB_MENU_ITEM	frequencySetting;
SUB_MENU_ITEM	frequencySetting2;
SUB_MENU_ITEM	frequencySetting3;

SUB_MENU_ITEM	frequencySetting =
		{ &frequencySetting2, NULL, 3 , "HEYPhone"};

SUB_MENU_ITEM	frequencySetting2 =
		{ &frequencySetting3, &frequencySetting, 2 , "Nicola 2"};

SUB_MENU_ITEM	frequencySetting3 =
		{ NULL, &frequencySetting2, 1, "31 kh   " };


SUB_MENU_ITEM	confidenceBeepSetting[] = {

		{ NULL, NULL, 0 , "MIN"}, 		/* min is 0 	*/
		{ NULL, NULL, 500, "MAX" }, 	/* max is 10 minutes	*/

		{0}
};

SUB_MENU_ITEM	BluetoothPairingSetting;
SUB_MENU_ITEM	BluetoothPairingSetting1;

SUB_MENU_ITEM	BluetoothPairingSetting =
		{ &BluetoothPairingSetting1, NULL, 1, "Disabled" };

SUB_MENU_ITEM	BluetoothPairingSetting1 =
		{ NULL, &BluetoothPairingSetting, 0, "Enabled" };


SUB_MENU_SCROLL_ITEM	TextMessageReceived;
SUB_MENU_SCROLL_ITEM	TextMessageReceived2;
SUB_MENU_SCROLL_ITEM	TextMessageReceived3;
SUB_MENU_SCROLL_ITEM	TextMessageReceived4;

SUB_MENU_SCROLL_ITEM	TextMessageReceived =
		{ &TextMessageReceived2, NULL, 1, NULL, NULL };

SUB_MENU_SCROLL_ITEM	TextMessageReceived2 =
		{ &TextMessageReceived3, &TextMessageReceived,  2, NULL, NULL };

SUB_MENU_SCROLL_ITEM	TextMessageReceived3 =
		{ &TextMessageReceived4, &TextMessageReceived2,  3, NULL, NULL };

SUB_MENU_SCROLL_ITEM	TextMessageReceived4 =
		{ &TextMessageReceived, &TextMessageReceived3, 4, NULL, NULL };



SUB_MENU_SCROLL_ITEM	TextMessageTestSetting;
SUB_MENU_SCROLL_ITEM	TextMessageTestSetting2;
SUB_MENU_SCROLL_ITEM	TextMessageTestSetting3;
SUB_MENU_SCROLL_ITEM	TextMessageTestSetting4;

SUB_MENU_SCROLL_ITEM	TextMessageTestSetting =
		{ &TextMessageTestSetting2, NULL, 1, "Closing; moving to next location", NULL };

SUB_MENU_SCROLL_ITEM	TextMessageTestSetting2 =
		{ &TextMessageTestSetting3, &TextMessageTestSetting,  1, "Closing and surfacing", NULL };

SUB_MENU_SCROLL_ITEM	TextMessageTestSetting3 =
		{ &TextMessageTestSetting4, &TextMessageTestSetting2,  1, "Party Found and well",NULL };

SUB_MENU_SCROLL_ITEM	TextMessageTestSetting4 =
		{ NULL, &TextMessageTestSetting3, 0, "Party Found; assistance needed", NULL };


SUB_MENU_ITEM	debugOn;
SUB_MENU_ITEM	debugOff;

SUB_MENU_ITEM	debugOn =
		{ &debugOff, NULL, 2 , "Trigger"};

SUB_MENU_ITEM	debugOff =
		{ &debugOn, NULL, 1, "OFF" };


SUB_MENU_ITEM VersionNumberSubMenu =
		{ NULL, NULL, 0, "1234567890123456" } ;

SUB_MENU_ITEM	turnRadioOffSetting;
SUB_MENU_ITEM	turnRadioOffSetting1;

SUB_MENU_ITEM	turnRadioOffSetting =
		{ &turnRadioOffSetting1, NULL, 0, "Keep on"};

SUB_MENU_ITEM	turnRadioOffSetting1 =
		{ NULL, &turnRadioOffSetting, 1, "TURN OFF" };

MAIN_MENU_ITEM	theMenu_99;
MAIN_MENU_ITEM	theMenu_9;
MAIN_MENU_ITEM	theMenu_8;
MAIN_MENU_ITEM	theMenu_7a;
MAIN_MENU_ITEM	theMenu_7;
MAIN_MENU_ITEM	theMenu_6;
MAIN_MENU_ITEM	theMenu_5a;
MAIN_MENU_ITEM	theMenu_5;
MAIN_MENU_ITEM	theMenu_4;
MAIN_MENU_ITEM	theMenu_3;
//MAIN_MENU_ITEM	theMenu_2;
//MAIN_MENU_ITEM	theMenu_1;



/*  TITLE                   SUB MENU POINTER       		          TYPE           CURRENT      WORKING  */
/*                                                                                     ITEM INDEX  ITEM INDEX */


MAIN_MENU_ITEM	theMenu_99 =
{ NULL, &theMenu_8, "TURN RADIO OFF", 		(void *) &turnRadioOffSetting, 	EffectTurnRadioOff, SUB_MENU_TEXT, MENU_ITEM_TYPE_TURN_OFF,	  	0, 	0, 0, 0 };


MAIN_MENU_ITEM	theMenu_9 =
{ &theMenu_99, &theMenu_8, "VERSION No.", 	(void *) &VersionNumberSubMenu,		NULL, SUB_MENU_TEXT, MENU_ITEM_TYPE_VERSION_NUMBER,	  	0, 	0, 0, 0 };

MAIN_MENU_ITEM	theMenu_8 =
{ &theMenu_99, &theMenu_9, "DEBUGGING", 	(void *) &debugOff, 			SetDebuggingState, SUB_MENU_TEXT, MENU_ITEM_TYPE_DEBUGGING,	  	0, 	0, 0, 0 };


MAIN_MENU_ITEM	theMenu_7a =
{ &theMenu_8, &theMenu_7, "RECVD TEXT MSGS", 	(void *) &TextMessageReceived,  NULL, 	SUB_MENU_SCROLL_TEXT, MENU_ITEM_TYPE_RECVD_TEXT_MSGS,	  	0, 0, 0, 0 };


MAIN_MENU_ITEM	theMenu_7 =
{ &theMenu_7a, &theMenu_6, "TXT MESSAGE TEST", 	(void *) &TextMessageTestSetting,  NULL, 	SUB_MENU_SCROLL_TEXT, MENU_ITEM_TYPE_PRESET_TEXT_MSGS,	  	0, 0, 0, 0 };


MAIN_MENU_ITEM	theMenu_6 =
{ &theMenu_7, &theMenu_5a, "BLUETOOTH PAIRG", 	(void *) &BluetoothPairingSetting, NULL, SUB_MENU_TEXT, MENU_ITEM_TYPE_BLUETOOTH_PAIRING,  	0, 0, 0, 0 };


MAIN_MENU_ITEM	theMenu_5a =
{ &theMenu_6, &theMenu_5, "BEACON BEEP", 	(void *) &confidenceBeepSetting, SetBeaconBeepTime, 	SUB_MENU_INTEGER, MENU_ITEM_TYPE_BEACON_BEEP, 0, 0, 15, 15 };	/* 5 seconds */


MAIN_MENU_ITEM	theMenu_5 =
{ &theMenu_5a, &theMenu_4, "CONFIDENCE BEEP", 	(void *) &confidenceBeepSetting, SetConfidenceBeepTime, 	SUB_MENU_INTEGER, MENU_ITEM_TYPE_CONFIDENCE_BEEP, 0, 0, 15, 15 };	/* 5 minutes */


MAIN_MENU_ITEM	theMenu_4 =
{ &theMenu_5, &theMenu_3, "FREQUENCY", 			(void *) &frequencySetting, 	SetAerialFrequency,  	SUB_MENU_TEXT, MENU_ITEM_TYPE_FREQUENCY,		0, 0, 0, 0 };


MAIN_MENU_ITEM	theMenu_3 =
{ &theMenu_4, &theMenu_99, "AERIAL TYPE",			(void *) &aerialTypeSetting, 	SetAerialType, 	SUB_MENU_TEXT, MENU_ITEM_TYPE_AERIAL_TYPE,		0, 0, 0, 0 };


//MAIN_MENU_ITEM	theMenu_2 =
//{ &theMenu_3, &theMenu_1, "BLOCKED", 			(void *) &frequencySetting, 	NULL, 	SUB_MENU_TEXT, MENU_ITEM_TYPE_AERIAL_TYPE,		0, 0, 0, 0 };	/* to test the mechanism only */


#if 0
MAIN_MENU_ITEM	theMenu_1 =
{ &theMenu_3, &theMenu_99, "M-PHONE VOLUME", 		(void *) &microphoneVolume1, 	SetMicrophoneVolume, 	SUB_MENU_TEXT, MENU_ITEM_TYPE_MICROPHONE_VOLUME,		0, 0, 0, 0 };
#endif

#else

/* if not the test harness then provide a basic and minimal menu	*/
/* to be decided - do we provide any menu at all ?					*/

SUB_MENU_ITEM	turnRadioOffSetting;
SUB_MENU_ITEM	turnRadioOffSetting1;

SUB_MENU_ITEM	turnRadioOffSetting =
		{ &turnRadioOffSetting1, NULL, 0, "Keep on"};

SUB_MENU_ITEM	turnRadioOffSetting1 =
		{ NULL, &turnRadioOffSetting, 0, "turn off" };


MAIN_MENU_ITEM	theMenu_1 =
{ NULL, NULL, "TURN RADIO OFF", 		(void *) &turnRadioOffSetting, 	NULL, SUB_MENU_TEXT, MENU_ITEM_TYPE_TURN_OFF,	  	0, 	0, 0, 0 };

#endif


/* external references			*/
char *Nicola3Name = "Nicola 3";		// temporary


/* global references for other source modules */

QueueHandle_t	KeysReceivedQueue ;


/* current menu scrolling positions and state		*/

int	CurrentMenuPosition = TOP_LEVEL;
int	CurrentSubMenuPosition = TOP_LEVEL;
int DisplayAerialEarthing = TRUE;			// assume legacy mode at start up until a tone detect is received

MAIN_MENU_ITEM *firstMenuItem = NULL;



/* internal routines and variables */


static void LCD_Main( void *pvParameters );
static void LED_Temp( void *pvParameters );
static void KEYPAD_Temp( void *pvParameters );

static void DisplaySubmenuItem( MAIN_MENU_ITEM *thisMenuItem );
static void DisplayVolume() ;

static void writeMenuToFlash();
static int ReadMenuFromFlash( void );

static MAIN_MENU_ITEM *FindMainMenuItem( int ) ;

static void LCD_Home();
static void LCD_Clear();
void LCD_Write_String( int, int, char *);
static void LCD_Write_Char( char DisplayCharacter);

static void LCD_ControlWriteStart( int );
static void LCD_ControlWrite( int );
static void LCD_BackLight( char );
#if 0
static void LCD_EnablePulse( int enable );
#endif
static void LCD_FirstLine( int position );
static void LCD_SecondLine( int position );
static void LCD_ClearLine( int whichLine );

static void LCDTimer1Callback( TimerHandle_t theHandle);
static void LCDTimer2Callback( TimerHandle_t theHandle);
static void LCDTimer3Callback( TimerHandle_t theHandle);

static void LCDTimer4Callback( TimerHandle_t theHandle);

static void LCDTimer5Callback( TimerHandle_t theHandle);		// watchdog timer to user and keypad picos

static char *ConvertToMinutes( int value, char *buffer );
static char *ConvertToSeconds( int value, char *buffer );

static void LCD_LoadHandlerRoutine( MAIN_MENU_ITEM *mainMenuItem );

static void ApplyDefaultSettings();

static TimerHandle_t LCDTimer1 ;		/* Start backlight timer */
static TimerHandle_t LCDTimer2 ;		/* LCD message scrolling timer */
static TimerHandle_t LCDTimer3 ;		/* confidence beep timer */

static TimerHandle_t LCDTimer4 ;		/* Bluetooth Transmit timer */

static TimerHandle_t LCDTimer5 ;		/* watchdog timer */

int		WatchdogCounter = 0;
int		WatchdogReplyUser = TRUE;		// TRUE = make sure we do not get a false fail at start up
int		WatchdogReplyKeypad = TRUE;

/*
 * The following are declared globally so they are zeroed and can be
 * easily accessible from a debugger.
 */

XGpioPs Gpio;	/* The driver instance for GPIO Device. */

int CDCardRunning = 0;

static int ConfidenceBeepTimer = 0;
static int BluetoothTimer = (30 * 1000) ;		// temp - set to 30 seconds

#define NO_TRANSMIT				(0)
#define RECEIVING               (1)

#define RADIO_RECEIVING			(11)
#define HANDSET_TRANSMITTING	(12)
#define BLUETOOTH_TRANSMITTING	(13)

#define DATA_TRANSMITTING       (20)

#define RECEIVE_LEGACY			(100)
#define RECEIVE_TONE_DETECT_OFF (101)
#define RECEIVE_TONE_DETECT_ON	(102)


static int TransmitReceiveStatus = NO_TRANSMIT ;
static int ToneDetectStatus = RECEIVE_LEGACY ;


#define NO_BEEP_MODE	0
#define CONFIDENCE_MODE 1
#define BEACON_MODE     2

static int ConfidenceBeaconMode = NO_BEEP_MODE;



void LCD_Startup()
{
	KeysReceivedQueue = xQueueCreate( 8,					// max item count
									  4 ) ;					// size of each item (max) ) ;

	/* Start the tasks as described in the comments at the top of this file. */
						/* The task handle is not required, so NULL is passed. */

#if 1

	xTaskCreate( LCD_Main,							/* The function that implements the task. */
				"LCD Main", 						/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */
#endif

#if 1
	xTaskCreate( LED_Temp,							/* The function that implements the task. */
				"LED Temp", 						/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */
#endif

#if 0
	xTaskCreate( KEYPAD_Temp,						/* The function that implements the task. */
				"KEYPAD Temp", 						/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */
#endif


}


static void LED_Temp( void *pvParameters )
{
	//vTaskDelay( pdMS_TO_TICKS(2000));

#if 0

	while ( 1 )
	{
		XGpioPs_WritePin(&Gpio, LED_BLUE, 0x1);	// blue
    	vTaskDelay( pdMS_TO_TICKS(2500));
		XGpioPs_WritePin(&Gpio, LED_BLUE, 0x0);	// blue


		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x1);	// green
    	vTaskDelay( pdMS_TO_TICKS(1000));
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x0);	// green


		XGpioPs_WritePin(&Gpio, LED_RED, 0x1);	// blue
    	vTaskDelay( pdMS_TO_TICKS(2500));
		XGpioPs_WritePin(&Gpio, LED_RED, 0x0);	// blue


		XGpioPs_WritePin(&Gpio, LED_RED, 0x1);		// red and blue = purple
		XGpioPs_WritePin(&Gpio, LED_BLUE, 0x1);		// red and blue = purple
    	vTaskDelay( pdMS_TO_TICKS(1000));
		XGpioPs_WritePin(&Gpio, LED_RED, 0x0);
		XGpioPs_WritePin(&Gpio, LED_BLUE, 0x0);


		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x1);	// blue and green = greeny yellow
		XGpioPs_WritePin(&Gpio, LED_BLUE, 0x1);		// blue and green = greeny yellow
    	vTaskDelay( pdMS_TO_TICKS(2500));
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x0);
		XGpioPs_WritePin(&Gpio, LED_BLUE, 0x0);


		XGpioPs_WritePin(&Gpio, LED_RED, 0x1);		// red and green = light blue
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x1);	// red and green = light blue
    	vTaskDelay( pdMS_TO_TICKS(1000));
		XGpioPs_WritePin(&Gpio, LED_RED, 0x0);
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x0);


		XGpioPs_WritePin(&Gpio, LED_RED, 0x1);		// all on = white
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x1);	// all on = white
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x1);	// all on = white
    	vTaskDelay( pdMS_TO_TICKS(2500));


		XGpioPs_WritePin(&Gpio, LED_RED, 0x0);		// all off = off (black...)
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x0);	// all off = off (black...)
		XGpioPs_WritePin(&Gpio, LED_GREEN, 0x0);	// all off = off (black...)
    	vTaskDelay( pdMS_TO_TICKS(1000));

	}

#else

	*GPIO2DIR = 0xFFFF;
	*GPIO2OEN = 0xFFFF;

	//*GPIO2dataX = 0xF000;
	

	while (1)
	{
		//*GPIO2data = 0x1F00 ;
		//*GPIO2dataX = 0x1000 ;			/* CTS signal for swapping data and control on Bluetooth */

		*GPIO2dataMasked = 0xEFFF1000 ;

		vTaskDelay( pdMS_TO_TICKS(5000));

		//*GPIO2dataX = 0x0 ;

		*GPIO2dataMasked = 0xEFFF0000 ;

    	vTaskDelay( pdMS_TO_TICKS(1000));


	}


    while ( 1 )
	{

		*GPIO2dataMasked = LED_BLUE;		// blue
    	vTaskDelay( pdMS_TO_TICKS(2500));

		*GPIO2dataMasked = LED_GREEN;		// green
    	vTaskDelay( pdMS_TO_TICKS(1000));

		*GPIO2dataMasked = LED_RED;
    	vTaskDelay( pdMS_TO_TICKS(2500));	// red


		*GPIO2dataMasked = LED_PURPLE;		// red and blue = purple
    	vTaskDelay( pdMS_TO_TICKS(1000));

		*GPIO2dataMasked = LED_YELLOW;		// blue and green = greeny yellow
    	vTaskDelay( pdMS_TO_TICKS(2500));

		*GPIO2dataMasked = LED_LIGHTBLUE;	// red and green = light blue
    	vTaskDelay( pdMS_TO_TICKS(1000));


    	*GPIO2dataMasked = 0x8FFF8FFF;		// all on = white
    	vTaskDelay( pdMS_TO_TICKS(2500));

    	*GPIO2dataMasked = 0x8FFFFFFF;		// all = black = off
    	vTaskDelay( pdMS_TO_TICKS(1000));
	}
#endif


}


#if 0
/* KEYPAD_Temp() will be replaced when the KEYPAD pico is updated for this system */

static void KEYPAD_Temp( void *pvParameters )
{
	unsigned int KeyInData;
	unsigned int PreviousKeyInData;
	char	KeyMessage[2];
	int		lastPTTSent = 0;


	*GPIO0DIR = 0x0000;

	PreviousKeyInData = *GPIO0InputDataX;

    while ( 1 )
	{
    	//data1 = *GPIO0InputData;
    	KeyInData = *GPIO0InputDataX;


    	if ( KeyInData != PreviousKeyInData )
    	{
    		PreviousKeyInData = KeyInData ;
    		// look for multiple presses first

			if ( (KeyInData & (unsigned int ) 0x000C ) == 0 )	// left and up
			{
#ifdef KEY_DEBUG_MESSAGES
				while ( xQueueSendToBack( consoleTransmitQueue, "UP+LEFT\n\r", 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
#endif

				KeyMessage[0] = KEY_UPLEFT;
				while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
				{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
			}
			else
			{
				if ( (KeyInData & (unsigned int ) 0x0001 ) == 0 )	// down
				{
#ifdef KEY_DEBUG_MESSAGES
					while ( xQueueSendToBack( consoleTransmitQueue, "DOWN\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

					KeyMessage[0] = KEY_DOWN;
					while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}

				}

				if ( (KeyInData & (unsigned int ) 0x0002 ) == 0 )	// right
				{
#ifdef KEY_DEBUG_MESSAGES
					while ( xQueueSendToBack( consoleTransmitQueue, "RIGHT\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

					KeyMessage[0] = KEY_RIGHT;
					while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
				}

				if ( (KeyInData & (unsigned int ) 0x0004 ) == 0 )	// left
				{
#ifdef KEY_DEBUG_MESSAGES
					while ( xQueueSendToBack( consoleTransmitQueue, "LEFT\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

					KeyMessage[0] = KEY_LEFT;
					while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
				}

				if ( (KeyInData & (unsigned int ) 0x0008 ) == 0 )	// up
				{
#ifdef KEY_DEBUG_MESSAGES
					while ( xQueueSendToBack( consoleTransmitQueue, "UP\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

					KeyMessage[0] = KEY_UP;
					while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
				}
			}

			if ( (KeyInData & (unsigned int ) 0x0010 ) == 0 )	// PTT
			{
				if ( lastPTTSent == 0 )
				{
#ifdef KEY_DEBUG_MESSAGES
					while ( xQueueSendToBack( consoleTransmitQueue, "PTT on\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

					KeyMessage[0] = KEY_PTT_ON;
					//KeyMessage[1] = TRUE;
					while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
				}
				lastPTTSent = 1;
			}
			else
			{
				if ( lastPTTSent == 1 )
				{
#ifdef KEY_DEBUG_MESSAGES
					while ( xQueueSendToBack( consoleTransmitQueue, "PTT off\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

					KeyMessage[0] = KEY_PTT_OFF;
					//KeyMessage[1] = FALSE;
					while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
				}
				lastPTTSent = 0;
			}
    	}

    	vTaskDelay( pdMS_TO_TICKS(250));
	}

}

#endif


#if 0
/* LCD_Main() provides the output to the LCD screen							*/

/* It also supplies the Keyboard management receiving incoming KEY events	*/
/* from the KEYPAD pico (or test harness) and the supporting timers.		*/

void debugWait() {
	vTaskDelay( pdMS_TO_TICKS(2));
}
#endif


/*
 * Convert 2 ASCII characters to an integer value
 */

int  hexToInt( char *inChars )
{
	int upperValue, lowerValue;

	upperValue = (*inChars > '9') ? (*inChars - 'A' + 10) : (*inChars - '0') ;
	inChars++;
	lowerValue = (*inChars > '9') ? (*inChars - 'A' + 10) : (*inChars - '0') ;

	return ((upperValue*16) + lowerValue);

}


static void LCD_Main( void *pvParameters )
{
	int		i;
	char 	theMessage[20];
	char	PLMessage[4];
	char	blockCharacter ;
	static MAIN_MENU_ITEM		*thisMenuItem;
	static SUB_MENU_ITEM		*subMenuItem;
	static SUB_MENU_SCROLL_ITEM *subScrollMenuItem ;
	int		earthingValue;

#if 0
	XGpioPs_Config *ConfigPtr;
	int Status;

	/* Initialize the GPIO driver. */
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
	Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr,
					ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		xil_printf( "GPIO Not initialised\r\n");
		while( 1 ) vTaskDelay( pdMS_TO_TICKS(250));
	}

	for ( i=0; i<15; i++)

	{
		XGpioPs_SetDirectionPin(&Gpio, GPIO_BANK2 + i, 1);
		XGpioPs_SetOutputEnablePin(&Gpio, GPIO_BANK2 + i, 1);

		/* Set the GPIO output to be low. */
		XGpioPs_WritePin(&Gpio, GPIO_BANK2 + i, 0x0);
	}



#else


	*GPIO2DIR = 0xFFFF;
	*GPIO2OEN = 0xFFFF;

	*GPIO2dataX = 0xF000;


	CONTROL_SIGNAL_LOW;
	WRITE_SIGNAL_LOW;
	ENABLE_SIGNAL_LOW;

#endif

	ReadMenuFromFlash();

#if 1
	//vTaskDelay( pdMS_TO_TICKS(2000));			/* wait  */

	LCD_ControlWriteStart( 0x38 );				/* set 8 bit 2 line 5x8 format	*/

	vTaskDelay( pdMS_TO_TICKS(10));			/* wait  */

	LCD_ControlWriteStart( 0x38 );				/* repeat set 8 bit 2 line 5x7 format	*/

	vTaskDelay( pdMS_TO_TICKS(10));			/* wait  */

	LCD_ControlWriteStart( 0x38 );				/* repeat set 8 bit 2 line 5x7 format	*/

	vTaskDelay( pdMS_TO_TICKS(10));			/* wait  */

	//LCD_ControlWrite( 0xF );				/* Display, on, cursor on, blink cursor	*/
	LCD_ControlWriteStart( 0xE );				/* Display, on, cursor off, no blink cursor	*/
	vTaskDelay( pdMS_TO_TICKS(3));			/* wait  */

	LCD_ControlWriteStart( 0x6 );				/* Entry mode, increment by 1, no shift	*/
	vTaskDelay( pdMS_TO_TICKS(3));			/* wait  */

#else


	LCD_ControlWrite( 0x38 );				/* set 8 bit 2 line 5x8 format	*/

	vTaskDelay( pdMS_TO_TICKS(1000));			/* wait  */

	LCD_ControlWrite( 0x38 );				/* repeat set 8 bit 2 line 5x7 format	*/

	vTaskDelay( pdMS_TO_TICKS(20));			/* wait  */

	LCD_ControlWrite( 0x38 );				/* repeat set 8 bit 2 line 5x7 format	*/

	vTaskDelay( pdMS_TO_TICKS(20));			/* wait  */


	LCD_ControlWrite( 0x6 );				/* Entry mode, increment by 1, no shift	*/
	vTaskDelay( pdMS_TO_TICKS(3));			/* wait  */

#endif


	//LCD_ControlWrite( 0xF );				/* Display, on, cursor on, blink cursor	*/
	LCD_ControlWriteStart( 0xD );				/* Display, on, cursor off, no blink cursor	*/
	vTaskDelay( pdMS_TO_TICKS(20));			/* wait  */

	//LCD_ControlWrite( 0x12 );				/* Entry mode, increment by 1, no shift	*/
	//TaskDelay( pdMS_TO_TICKS(10));			/* wait  */


	LCD_Clear();

	LCD_Home();

	//xil_printf( "First line %s\r\n", thisNicolaSettings.thisNicolaName);

	LCD_Write_String( FIRST_LINE, 0, thisNicolaSettings.thisNicolaName);			// Nicola3Name);

	LCD_Write_String( SECOND_LINE, 0, GetVersionString());

	memcpy( VersionNumberSubMenu.subMenuHeading, GetVersionString(), 16 ) ;

	//xil_printf( "Second line %s\r\n", GetVersionString() );



	/* Start backlight timer */
	if ( (LCDTimer1 = xTimerCreate( "T1",
								30 * pdMS_TO_TICKS(1000),
								pdFALSE,
								(void *) 1,
								LCDTimer1Callback) ) )

	{
		xTimerStart( LCDTimer1, portMAX_DELAY );
	}

	/* LCD message scrolling timer */
	if ( (LCDTimer2 = xTimerCreate( "T2",
								pdMS_TO_TICKS(500),
								pdFALSE,		// not auto restart
								(void *) 1,
								LCDTimer2Callback) ) )

	{

	}

	/* confidence beep timer */
	if ( (LCDTimer3 = xTimerCreate( "T3",
								pdMS_TO_TICKS(500),
								pdFALSE,		// not auto restart
								(void *) 1,
								LCDTimer3Callback) ) )

	{

	}

	/* Bluetooth transmit timer */
	if ( (LCDTimer4 = xTimerCreate( "T4",
								pdMS_TO_TICKS(500),
								pdFALSE,		// not auto restart
								(void *) 1,
								LCDTimer4Callback) ) )

	{

	}

	/* Start watchdog timer */
	if ( (LCDTimer5 = xTimerCreate( "T5",
								5 * pdMS_TO_TICKS(1000),
								pdTRUE,			// auto restart
								(void *) 1,
								LCDTimer5Callback) ) )

	{
		xTimerStart( LCDTimer5, portMAX_DELAY );
	}

	// loop but for some reason only one seems to get to the user pico

	for ( i=0; i<2; i++ )
	{

		vTaskDelay( pdMS_TO_TICKS(1000));			/* wait  */

		PLMessage[0] = '*' ;
		PLMessage[1] = SEND_CONFIDENCE_BEEP ;
		PLMessage[2]  = (u32) '\r' ;		// c/r
		PLMessage[3]  = (u32) '\n' ;		// load  pico

		while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
		{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
		}
	}

    while ( 1 )
    {
    	if ( xQueueReceive( KeysReceivedQueue, &theMessage, portMAX_DELAY ) == pdPASS )
    	{

			if ( theMessage[0] == KEY_TIMEOUT1 )		/* if turn off backlight	*/
			{

				LCD_Write_String( FIRST_LINE, 0, thisNicolaSettings.thisNicolaName);			// Nicola3Name);
				LCD_Write_String( SECOND_LINE, 0, GetVersionString());

				LCD_BackLight( SEND_LCD_BACKLIGHT_OFF );		/* extinguish the LCD */
				CurrentMenuPosition = TOP_LEVEL;
				CurrentSubMenuPosition = TOP_LEVEL;

			}
			else
			if ( theMessage[0] == KEY_TIMEOUT2 )		/* if scroll through text message etc */
			{
				// if there is a scrolling text item then do it
				if ( ( thisMenuItem != NULL ) && ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) )
				{
					subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) thisMenuItem->currentSubMenu ;

					if ( subScrollMenuItem && ( subScrollMenuItem->currentPosition != NULL ))
					{
						// scroll to next character - if less than 8 chars on screen start again

						subScrollMenuItem->currentPosition++;

						if ( *(subScrollMenuItem->currentPosition+8) == 0 )
						{
							subScrollMenuItem->currentPosition = subScrollMenuItem->subMenuHeading ;
						}

						LCD_ClearLine( SECOND_LINE );
						LCD_Write_String( SECOND_LINE, 0, subScrollMenuItem->currentPosition );

					}
				}

			}
			else
			if ( theMessage[0] == KEY_TIMEOUT3 )		/* confidence beep running */
			{
				PLMessage[0] = '*' ;

				if ( ConfidenceBeaconMode == CONFIDENCE_MODE )
				{
					PLMessage[1] = SEND_CONFIDENCE_BEEP ;
				}
				else
				if ( ConfidenceBeaconMode == BEACON_MODE )
				{
					PLMessage[1] = SEND_BEACON_BEEP ;
				}
				else
				{
					PLMessage[1] = ' ' ;		// should never send a dummy
				}

				PLMessage[2]  = (u32) '\r' ;		// c/r
				PLMessage[3]  = (u32) '\n' ;		// load  pico

				while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
				{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
				}

				if ( ConfidenceBeepTimer != 0 )
				{
					xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	//
				}
			}
			else
			if ( theMessage[0] == KEY_TIMEOUT4 )		/* Bluetooth Transmit timeout */
			{
				if ( TransmitReceiveStatus == BLUETOOTH_TRANSMITTING )
				{
					/* Bluetooth transmit period exceeded so 				*/
					/* stop transmitting in case user forgot				*/

					TransmitReceiveStatus = NO_TRANSMIT ;

					//DisplayAerialEarthing = FALSE;

					PLMessage[0] = '*' ;
					PLMessage[1] = SEND_RECEIVE_STATE;
					PLMessage[2]  = (u32) '\r' ;		// c/r
					PLMessage[3]  = (u32) '\n' ;		// load  pico

					while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
					{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
					}

					LCD_BackLight( SEND_LCD_BACKLIGHT_OFF );		/* extinguish the LCD */

					if ( ConfidenceBeepTimer != 0 )
					{
						xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	// and start the confidence beep timer
					}

					xTimerStart( LCDTimer1, portMAX_DELAY );	// and start the backlight timer
				}
			}

			else
			if ( theMessage[0] == KEY_TIMEOUT5 )		/* watchdog timeout */
			{
				if ( WatchdogReplyUser == FALSE )
				{
					/* User pico failed to reply      0123456789012345 */
					LCD_Write_String( FIRST_LINE, 0, "USER WDOG      ");			// User watchdog failed
					xil_printf( "\r\n\nUSER WATCHDOG FAIL\r\n\n");
				}
				else
				if ( WatchdogReplyKeypad == FALSE )
				{
					/* User pico failed to reply      0123456789012345*/
					LCD_Write_String( FIRST_LINE, 0, "KEYPAD WDOG    ");			// User watchdog failed
					xil_printf( "\r\n\nKEYPAD WATCHDOG FAIL\r\n\n");
				}

				WatchdogCounter += 1 ;

				if ( WatchdogCounter > 9 )
				{
					WatchdogCounter = 0 ;
				}

				xil_printf( "wdog %d\r\n", WatchdogCounter) ;

				LCD_FirstLine( 15 ) ;
				LCD_Write_Char( '0' + WatchdogCounter ) ;

				SendWatchdogMessage(  ) ;

				WatchdogReplyUser = FALSE;
				WatchdogReplyKeypad = FALSE;

				//xTimerStart( LCDTimer5, pdMS_TO_TICKS(1)* 1000 );
			}

			// Tone Detect Messages

			else
			if ( theMessage[0] == '+' )		/* Tone detect pico messages */
			{
				if ( theMessage[1] == '0' )		/* tone detect off */
				{
					xil_printf( "Implement Tone Detect off\n\r" );

					DisplayAerialEarthing = TRUE;

				}
				else
				if ( theMessage[1] == '1' )		/* tone detect on */
				{
					xil_printf( "Implement Tone Detect on\n\r" );

					DisplayAerialEarthing = FALSE;
				}
			}

			// Keyboard Messages

			else
			if ( theMessage[0] == KEY_DOWNLEFT )		/* special to reduce volume */
			{
				SetMicrophoneVolume( DECREMENT_VOLUME ) ;

				xil_printf( "VOLUME DOWN = %d\r\n", MicrophoneVolume );

				DisplayVolume();

			}
			else
			if ( theMessage[0] == KEY_DOWNRIGHT )		/* special to increase volume */
			{
				SetMicrophoneVolume( INCREMENT_VOLUME ) ;

				xil_printf( "VOLUME UP = %d\r\n", MicrophoneVolume );

				DisplayVolume();
			}
			else
			if ( theMessage[0] == KEY_USER_WDOG_REPLY )		/* special user pico watchdog reply */
			{
				WatchdogReplyUser = TRUE;

				//xil_printf( "LCDDisplay User Watchdog Reply\r\n" );

			}

			else
			if ( theMessage[0] == KEY_KEYP_WDOG_REPLY )		/* special user pico watchdog reply */
			{
				WatchdogReplyKeypad = TRUE;

				//xil_printf( "LCDDisplayKeypad Watchdog\r\n" );

			}


			else
			if ( ( CurrentMenuPosition == TOP_LEVEL ) && ( theMessage[0] != KEY_UPLEFT ) && ( theMessage[0] != KEY_LEFTRIGHT ) )
			{

				/* look for PTT pressed when the LCD is not enabled - so we will light LCD and 	*/
				/* show the aerial performance bar whilst handset PTT is pressed				*/

				if ( ( theMessage[0] == KEY_AERIAL_EARTHING ) && ( DisplayAerialEarthing ))
				{
					/* earth quality message from the DSP pico to display */

					/* a measurement of 128 is the max we will allow for - with 16 characters in width	*/
					/* is 8 points on the scale for each LCD block
					 *
					 * 									*/

					if ( DisplayVolumeCounter >  0 )
					{
						DisplayVolumeCounter -= 1 ;
					}
					else
					{
						earthingValue = hexToInt( &theMessage[1] );

						xil_printf( "Earthing = %d\r\n", earthingValue );

						if ( earthingValue < 50 ) blockCharacter = 'x' ;		//0xAA;
						else
						if ( earthingValue < 80 ) blockCharacter = 'X' ;		// 0xD0;
						else blockCharacter = 0xFF;

						LCD_SecondLine( 0 ) ;

						for ( i=0; i< (int) earthingValue/8; i++ )
						{
							LCD_Write_Char( blockCharacter ) ;
						}

						for ( ; i<16; i++ )
						{
							LCD_Write_Char( ' ' ) ;
						}
					}

				}
				else
				if ( theMessage[0] == KEY_PTT_ON )
				{
					if ( TransmitReceiveStatus == NO_TRANSMIT )
					{
						/* PTT is pressed as detected by KEYPAD pico 				*/
						/* trigger or stop display									*/

						TransmitReceiveStatus = HANDSET_TRANSMITTING ;

						//DisplayAerialEarthing = TRUE;
						LCD_Clear();
						LCD_Write_String( FIRST_LINE, 0, thisNicolaSettings.thisNicolaName );

						PLMessage[0] = '*' ;
						PLMessage[1] = SEND_TRANSMIT_STATE;
						PLMessage[2]  = (u32) '\r' ;		// c/r
						PLMessage[3]  = (u32) '\n' ;		// load  pico

						while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
						{
								vTaskDelay( pdMS_TO_TICKS( 5 ));
						}

						LCD_BackLight( SEND_LCD_BACKLIGHT_ON );		/* light the LCD */

						xTimerStop( LCDTimer3, pdMS_TO_TICKS(1 * 1000)  );		// stop the confidence beep timer
					}

				}
				else
				if ( theMessage[0] == KEY_PTT_OFF )
				{
					if ( TransmitReceiveStatus == HANDSET_TRANSMITTING )
					{
						/* PTT is released as detected by KEYPAD pico 				*/
						/* trigger or stop display									*/

						TransmitReceiveStatus = NO_TRANSMIT ;

						//DisplayAerialEarthing = FALSE;

						PLMessage[0] = '*' ;
						PLMessage[1] = SEND_RECEIVE_STATE;
						PLMessage[2]  = (u32) '\r' ;		// c/r
						PLMessage[3]  = (u32) '\n' ;		// load  pico

						while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
						{
								vTaskDelay( pdMS_TO_TICKS( 5 ));
						}

						LCD_BackLight( SEND_LCD_BACKLIGHT_OFF );		/* extinguish the LCD */

						if ( ConfidenceBeepTimer != 0 )
						{
							xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	// and start the confidence beep timer
						}

						xTimerStart( LCDTimer1, portMAX_DELAY );	// and start the backlight timer

						LCD_Clear();		// tidy up LCD
						LCD_Write_String( FIRST_LINE, 0, thisNicolaSettings.thisNicolaName );
					}
				}

				else
				if ( theMessage[0] == KEY_BLUETOOTH_PTT )
				{
					if ( TransmitReceiveStatus == NO_TRANSMIT )
					{
						/* PTT is released as detected by KEYPAD pico 				*/
						/* trigger or stop display									*/

						TransmitReceiveStatus = BLUETOOTH_TRANSMITTING ;

						//DisplayAerialEarthing = TRUE;
						LCD_Clear();
						LCD_Write_String( FIRST_LINE, 0, thisNicolaSettings.thisNicolaName );

						PLMessage[0] = '*' ;
						PLMessage[1] = SEND_TRANSMIT_STATE;
						PLMessage[2]  = (u32) '\r' ;		// c/r
						PLMessage[3]  = (u32) '\n' ;		// load  pico

						while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )

						{
								vTaskDelay( pdMS_TO_TICKS( 5 ));
						}

						LCD_BackLight( SEND_LCD_BACKLIGHT_ON );		/* light the LCD */

						if ( ConfidenceBeepTimer != 0 )
						{
							xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	// and start the confidence beep timer
						}

						// if there is a time out period for the Bluetooth transmit
						// then set the timer going.

						if ( BluetoothTimer!= 0 )
						{
							xTimerChangePeriod( LCDTimer4, pdMS_TO_TICKS(BluetoothTimer), portMAX_DELAY );
							xTimerStart( LCDTimer4, portMAX_DELAY );	//
						}

					}
					else
					if ( TransmitReceiveStatus == BLUETOOTH_TRANSMITTING )
					{
						/* PTT is released as detected by KEYPAD pico 				*/
						/* trigger or stop display									*/

						TransmitReceiveStatus = NO_TRANSMIT ;

						//DisplayAerialEarthing = FALSE;

						PLMessage[0] = '*' ;
						PLMessage[1] = SEND_RECEIVE_STATE;
						PLMessage[2]  = (u32) '\r' ;		// c/r
						PLMessage[3]  = (u32) '\n' ;		// load  pico

						while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
						{
								vTaskDelay( pdMS_TO_TICKS( 5 ));
						}

						LCD_BackLight( SEND_LCD_BACKLIGHT_OFF );		/* extinguish the LCD */

						if ( ConfidenceBeepTimer != 0 )
						{
							xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	// and start the confidence beep timer
						}

						xTimerStart( LCDTimer1, portMAX_DELAY );	// and start the backlight timer

						xTimerStop( LCDTimer4, portMAX_DELAY );		// stop the Bluetooth talk timer

					}
				}
    		}

    		else
    		// no PTT and key received - manage menu system
    		{

				if ( theMessage[0] == KEY_LEFTRIGHT )
				{
					/* handle LEFT and RIGHT together as special case to power down */

					if ( ( thisMenuItem = FindMainMenuItem( MENU_ITEM_TYPE_TURN_OFF )) != NULL )
					{
						thisMenuItem->currentSubMenu = &turnRadioOffSetting1 ;

						//SUB_MENU_ITEM	*lastSubMenu;			/* pointer during editing process */
						thisMenuItem->currentValue = 1;			/* current setting		*/
						thisMenuItem->lastValue = 0 ;			/* last setting		*/

						theMessage[0] = KEY_UP ;

						CurrentMenuPosition = 0;

						CurrentSubMenuPosition = &turnRadioOffSetting1 ;

						CurrentMenuPosition == 0 ;

						LCD_Clear();
						LCD_Home();

						LCD_Write_String( FIRST_LINE, 0, thisMenuItem->heading );

						xil_printf( "SIMULATE KEYUP for power down\r\n");
					}
				}

				switch (theMessage[0])
				{

				/* to protect against accidental menu operations, we need the UP and LEFT to	*/
				/* be touched together to start; otherwise keys will be ignored.				*/

				case KEY_UPLEFT:
					{
						if ( ( thisMenuItem != NULL ) && ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) )
						{
							xTimerStop( LCDTimer2, portMAX_DELAY );		// stop the scrolling timer
						}


						if ( ( thisMenuItem = firstMenuItem ) == NULL )
						{
							CurrentMenuPosition = TOP_LEVEL ; // to make sure
							break;		// cannot do anything if no menu
						}

						CurrentSubMenuPosition = TOP_LEVEL;
						CurrentMenuPosition = 0 ;		/* select first menu item */


						LCD_BackLight( SEND_LCD_BACKLIGHT_ON );		/* light the LCD */
						xTimerStart( LCDTimer1, portMAX_DELAY );	// and start the backlight timer

						LCD_Clear();
						LCD_Home();

						LCD_Write_String( FIRST_LINE, 0, thisMenuItem->heading );
						//LCD_Write_String( SECOND_LINE, 0, thisMenuItem->subHeading );

						DisplaySubmenuItem( thisMenuItem );
					}
					break;

				case KEY_UP:

					if ( ( thisMenuItem != NULL ) && ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) )
					{
						xTimerStop( LCDTimer2, portMAX_DELAY );		// stop the scrolling timer
						xTimerStart( LCDTimer1, portMAX_DELAY );
					}

					if ( CurrentMenuPosition == PENDING_CONFIRM )
					{

						// the change is denied

						//CurrentSubMenuPosition = TOP_LEVEL;
						CurrentMenuPosition = 0;
						CurrentSubMenuPosition = TOP_LEVEL;

						if ( thisMenuItem != NULL )
						{
							thisMenuItem->currentSubMenu = thisMenuItem->lastSubMenu;
							DisplaySubmenuItem( thisMenuItem );
						}

					}
					else
					if ( CurrentSubMenuPosition != TOP_LEVEL)
					{

						if ( ( ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT) &&
							   ( thisMenuItem->lastSubMenu != thisMenuItem->currentSubMenu ) ) ||
							 ( ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) &&
							   ( thisMenuItem->lastSubMenu != thisMenuItem->currentSubMenu ) ) ||
							 ( ( thisMenuItem->SubMenuClass == SUB_MENU_INTEGER) &&
				               ( thisMenuItem->currentValue != thisMenuItem->lastValue ) ) )
						{
							if ( thisMenuItem && (thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT ))
							{
								subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) subMenuItem;
								subScrollMenuItem->currentPosition = NULL;
							}


							xTimerStop( LCDTimer2, portMAX_DELAY );		// stop the scrolling timer
							xTimerStart( LCDTimer1, portMAX_DELAY );

							LCD_Write_String( SECOND_LINE, 0, "v YES  OK?  NO v");

							CurrentMenuPosition = PENDING_CONFIRM;

							/* at this point we ask user to confirm the settings change */
							/* and if so we will call a hook routine to implement the   */
							/* change itself */

						}
						else
						{
							CurrentSubMenuPosition = TOP_LEVEL;
							LCD_ClearLine( SECOND_LINE );
						}

						if ( thisMenuItem->currentSubMenu == NULL )
						{
							thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;
						}

						subMenuItem = thisMenuItem->currentSubMenu ;

						//LCD_ControlWrite( 0xF );				/* Display, on, cursor on, blink cursor	*/
						//LCD_ControlWrite( 0xC );				/* Display, on, cursor off, no blink cursor	*/
					}
					break;

				case KEY_DOWN:
					if ( ( thisMenuItem != NULL ) && ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) )
					{
						xTimerStop( LCDTimer2, portMAX_DELAY );		// stop the scrolling timer
						xTimerStart( LCDTimer1, portMAX_DELAY );
					}

					if ( CurrentMenuPosition == PENDING_CONFIRM )
					{
						// the change is denied

						CurrentSubMenuPosition = TOP_LEVEL;
						CurrentMenuPosition = 0;

						if ( thisMenuItem != NULL )
						{
							thisMenuItem->currentSubMenu = thisMenuItem->lastSubMenu;
							DisplaySubmenuItem( thisMenuItem );
						}

					}
					else
					if ( CurrentMenuPosition != TOP_LEVEL)
					{
						CurrentSubMenuPosition = 0;
						//LCD_ControlWrite( 0xF );				/* Display, on, cursor on, blink cursor	*/
						//LCD_ControlWrite( 0x8 );				/* Display, on, cursor off, no blink cursor	*/
						//if ( thisMenuItem->currentSubMenu == NULL )
						//{
						//	thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;
						//}

						//subMenuItem = thisMenuItem->currentSubMenu ;


						if ( thisMenuItem->lastSubMenu == NULL )
						{
							thisMenuItem->lastSubMenu = thisMenuItem->firstSubMenu;
						}

						thisMenuItem->currentSubMenu = thisMenuItem->lastSubMenu;

						thisMenuItem->currentValue = thisMenuItem->lastValue ;

						DisplaySubmenuItem( thisMenuItem );
					}

					break;

				case KEY_LEFT:
					if ( ( thisMenuItem != NULL ) && ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) )
					{
						xTimerStop( LCDTimer2, portMAX_DELAY );		// stop the scrolling timer
						xTimerStart( LCDTimer1, portMAX_DELAY );
					}

					if ( CurrentMenuPosition == PENDING_CONFIRM )
					{
						// the change is confirmed
						if ( thisMenuItem && subMenuItem && (thisMenuItem->menuItemChanged != NULL ) )
						{
							if ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
							{
								subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) thisMenuItem->currentSubMenu;
								(thisMenuItem->menuItemChanged)((int) subScrollMenuItem->subMenuHeading);
							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT )
							{
								(thisMenuItem->menuItemChanged)(thisMenuItem->currentSubMenu->value);

								if ( thisMenuItem->SubMenuType == MENU_ITEM_TYPE_DEBUGGING )
								{
									thisMenuItem->currentValue = 1 ;
									thisMenuItem->currentSubMenu = NULL ;
								}

							}
							else
							{
								(thisMenuItem->menuItemChanged)(thisMenuItem->currentValue);
							}

						}


						thisMenuItem->lastSubMenu = thisMenuItem->currentSubMenu;
						thisMenuItem->lastValue = thisMenuItem->currentValue ;

						CurrentSubMenuPosition = TOP_LEVEL;
						CurrentMenuPosition = 0 ;

						if ( thisMenuItem != NULL )
						{
							thisMenuItem->lastSubMenu = thisMenuItem->currentSubMenu ;
							DisplaySubmenuItem( thisMenuItem );
						}
					}
					else
					if ( CurrentMenuPosition != TOP_LEVEL)
					{
						if ( CurrentSubMenuPosition != TOP_LEVEL )
						{

							/* then we are scrolling through the sub menu selections */

							LCD_ClearLine( SECOND_LINE );
							if ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT)
							{
								if (subMenuItem->previousSubMenu == NULL )
								{
									thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;	/* wrap around to first menu item */
									subMenuItem = thisMenuItem->currentSubMenu ;
								}
								else
								{
									subMenuItem = subMenuItem->previousSubMenu ;
									thisMenuItem->currentSubMenu = subMenuItem ;
								}

								if ( subMenuItem->subMenuHeading != NULL )
								{
									LCD_Write_String( SECOND_LINE, 0, subMenuItem->subMenuHeading );
								}
							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
							{
								subMenuItem = thisMenuItem->currentSubMenu;

								subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) subMenuItem;

								subScrollMenuItem->currentPosition = subScrollMenuItem->subMenuHeading ;

								LCD_Write_String( SECOND_LINE, 0, subScrollMenuItem->subMenuHeading );

								xTimerStart( LCDTimer2, portMAX_DELAY );		// only start when we have a text emssage to scroll
								xTimerStop( LCDTimer1, portMAX_DELAY );

							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_INTEGER)
							{
								thisMenuItem->currentValue -= 1;
								if ( thisMenuItem->currentValue < thisMenuItem->firstSubMenu[0].value ) thisMenuItem->currentValue = thisMenuItem->firstSubMenu[0].value;

								// depending on menu type convert to seconds or minutes and seconds

								switch ( thisMenuItem->SubMenuType )
								{
								case MENU_ITEM_TYPE_BEACON_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToSeconds( thisMenuItem->currentValue, theMessage ) );
									break;

								case MENU_ITEM_TYPE_CONFIDENCE_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToMinutes( thisMenuItem->currentValue, theMessage ) );
									break;

								}

							}
						}
						else
						{

							/* else we are still scrolling through the Main Menu items */

							//CurrentMenuPosition -= 1 ;

							if (thisMenuItem->previousMainMenu == NULL )
							{
								//CurrentMenuPosition = 0;	/* wrap around to first menu item */
								thisMenuItem = firstMenuItem;
							}
							else
							{
								thisMenuItem = thisMenuItem->previousMainMenu;
							}

							LCD_Clear();
							LCD_Home();

							LCD_Write_String( FIRST_LINE, 0, thisMenuItem->heading );


							if ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT)
							{
								if ( thisMenuItem->currentSubMenu == NULL )
								{
									thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;
								}
								subMenuItem = thisMenuItem->currentSubMenu;
								LCD_Write_String( SECOND_LINE, 0, subMenuItem->subMenuHeading );
							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
							{
								subMenuItem = thisMenuItem->currentSubMenu;
								subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) subMenuItem;

								subScrollMenuItem->currentPosition = subScrollMenuItem->subMenuHeading ;

								if ( subScrollMenuItem && (subScrollMenuItem->subMenuHeading != NULL ))
								{
									LCD_Write_String( SECOND_LINE, 0, subScrollMenuItem->subMenuHeading );
									xTimerStart( LCDTimer2, portMAX_DELAY );		// only start when we have a text emssage to scroll
									xTimerStop( LCDTimer1, portMAX_DELAY );
								}

							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_INTEGER)
							{
								// depending on menu type convert to seconds or minutes and seconds

								switch ( thisMenuItem->SubMenuType )
								{
								case MENU_ITEM_TYPE_BEACON_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToSeconds( thisMenuItem->currentValue, theMessage ) );
									break;

								case MENU_ITEM_TYPE_CONFIDENCE_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToMinutes( thisMenuItem->currentValue, theMessage ) );
									break;

								}
							}
						}
					}
					break;

				case KEY_RIGHT:
					if ( ( thisMenuItem != NULL ) && ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT) )
					{
						xTimerStop( LCDTimer2, portMAX_DELAY );		// stop the scrolling timer
						xTimerStart( LCDTimer1, portMAX_DELAY );
					}

					if ( CurrentMenuPosition == PENDING_CONFIRM )
					{
						// the change is denied

						CurrentMenuPosition = 0;
						//CurrentMenuPosition = TOP_LEVEL ;
						CurrentSubMenuPosition = TOP_LEVEL;

						if ( thisMenuItem != NULL )
						{
							thisMenuItem->currentSubMenu = thisMenuItem->lastSubMenu;
							DisplaySubmenuItem( thisMenuItem );
						}
					}
					else
					/* only proceed if the LCD and Keypad are enabled by UP and LEFT together */

					if ( CurrentMenuPosition != TOP_LEVEL)
					{
						if ( CurrentSubMenuPosition != TOP_LEVEL )
						{
							/* then we are scrolling through the sub menu selections */

							LCD_ClearLine( SECOND_LINE );

							if ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT)
							{

								//subMenuItem = &thisMenuItem->subMenu[thisMenuItem->currentSubMenuIndex] ;
								if ( ( subMenuItem == NULL ) || ( subMenuItem->nextSubMenu == NULL ) )
								{
									thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;	/* wrap around to first menu item */
									subMenuItem = thisMenuItem->currentSubMenu ;
								}
								else
								{
									subMenuItem = subMenuItem->nextSubMenu ;
									thisMenuItem->currentSubMenu = subMenuItem ;
								}

								LCD_Write_String( SECOND_LINE, 0, subMenuItem->subMenuHeading );

							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
							{
								if ( ( subMenuItem == NULL ) || ( subMenuItem->nextSubMenu == NULL ) )
								{
									thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;	/* wrap around to first menu item */
									subMenuItem = thisMenuItem->currentSubMenu ;
								}
								else
								{
									subMenuItem = subMenuItem->nextSubMenu ;
									thisMenuItem->currentSubMenu = subMenuItem ;
								}

								subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) subMenuItem;

								if ( subScrollMenuItem->subMenuHeading == NULL )
								{
									subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) thisMenuItem->firstSubMenu ;	/* wrap around to first menu item */
								}

								if ( subScrollMenuItem && ( subScrollMenuItem->subMenuHeading != NULL ) )
								{
									subScrollMenuItem->currentPosition = subScrollMenuItem->subMenuHeading ;

									LCD_Write_String( SECOND_LINE, 0, subScrollMenuItem->subMenuHeading );

									// start the scrolling timer
									xTimerStart( LCDTimer2, portMAX_DELAY );		// only start when we have a text emssage to scroll
									xTimerStop( LCDTimer1, portMAX_DELAY );
								}

							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_INTEGER)
							{
								thisMenuItem->currentValue += 1;
								if ( thisMenuItem->currentValue > thisMenuItem->firstSubMenu[1].value ) thisMenuItem->currentValue = thisMenuItem->firstSubMenu[1].value;

								// depending on menu type convert to seconds or minutes and seconds

								switch ( thisMenuItem->SubMenuType )
								{
								case MENU_ITEM_TYPE_BEACON_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToSeconds( thisMenuItem->currentValue, theMessage ) );
									break;

								case MENU_ITEM_TYPE_CONFIDENCE_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToMinutes( thisMenuItem->currentValue, theMessage ) );
									break;

								}

							}
						}
						else
						{
							/* else we are still scrolling through the Main Menu items */

							//CurrentMenuPosition += 1 ;

							if (thisMenuItem->nextMainMenu == NULL )
							{
								//CurrentMenuPosition = 0;	/* wrap around to first menu item */
								thisMenuItem = firstMenuItem;
							}
							else
							{
								thisMenuItem = thisMenuItem->nextMainMenu;
							}

							LCD_Clear();

							LCD_Home();

							LCD_Write_String( FIRST_LINE, 0, thisMenuItem->heading );
							//LCD_Write_String(thisMenuItem->currentSubMenu SECOND_LINE, 0, thisMenuItem->subHeading );

#if 0
					while ( xQueueSendToBack( consoleTransmitQueue, thisMenuItem->heading, 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

							if ( thisMenuItem->currentSubMenu == NULL )
							{
								thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;
								subMenuItem = thisMenuItem->currentSubMenu ;
							}

							subMenuItem = thisMenuItem->currentSubMenu ;
							thisMenuItem->lastSubMenu = thisMenuItem->currentSubMenu;

							if ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT)
							{
								LCD_Write_String( SECOND_LINE, 0, subMenuItem->subMenuHeading );

#if 0
								while ( xQueueSendToBack( consoleTransmitQueue, subMenuItem->subMenuHeading, 0 ) != pdPASS )
								{
									vTaskDelay( pdMS_TO_TICKS( 5 ));
								}
#endif

							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
							{
								//if ( thisMenuItem->currentSubMenu  == NULL )
								//{
								//	thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu ;	/* wrap around to first menu item */

								//}
								//else
								//{
								//	subMenuItem = subMenuItem->nextSubMenu ;
								//	thisMenuItem->currentSubMenu = subMenuItem ;
								//}

								//subMenuItem = thisMenuItem->currentSubMenu ;

								subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) subMenuItem;

								if ( subScrollMenuItem->subMenuHeading == NULL )
								{
									subScrollMenuItem = ( SUB_MENU_SCROLL_ITEM *) thisMenuItem->firstSubMenu ;	/* wrap around to first menu item */
								}

								if ( subScrollMenuItem->subMenuHeading != NULL )
								{
									LCD_Write_String( SECOND_LINE, 0, subScrollMenuItem->subMenuHeading );

									subScrollMenuItem->currentPosition = (char *) subScrollMenuItem->subMenuHeading ;

									// start the scrolling timer
									xTimerStart( LCDTimer2, portMAX_DELAY );		// only start when we have a text message to scroll
									xTimerStop( LCDTimer1, portMAX_DELAY );			// and stop screen blanking
								}
							}
							else
							if ( thisMenuItem->SubMenuClass == SUB_MENU_INTEGER)
							{
								// depending on menu type convert to seconds or minutes and seconds

								switch ( thisMenuItem->SubMenuType )
								{
								case MENU_ITEM_TYPE_BEACON_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToSeconds( thisMenuItem->currentValue, theMessage ) );
									break;

								case MENU_ITEM_TYPE_CONFIDENCE_BEEP:
									LCD_Write_String( SECOND_LINE, 0, ConvertToMinutes( thisMenuItem->currentValue, theMessage ) );
									break;

								}

							}
						}
					}

					break;

				default:
					//LCD_Write_String( SECOND_LINE, 0, "UNKNOWN ");
					break;


				}
    		}
    	}

    	// vTaskDelay( pdMS_TO_TICKS(250));
    }

}


static void DisplaySubmenuItem( MAIN_MENU_ITEM *thisMenuItem )
{
	SUB_MENU_ITEM			*subMenuItem;
	SUB_MENU_SCROLL_ITEM 	*subScrollMenuItem ;
	char 					theMessage[20];

	LCD_ClearLine( SECOND_LINE );

	if ( thisMenuItem->SubMenuClass == SUB_MENU_TEXT)
	{
		if ( thisMenuItem->currentSubMenu == NULL )
		{
			thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu;

		}

		subMenuItem = thisMenuItem->currentSubMenu;

		LCD_Write_String( SECOND_LINE, 0, subMenuItem->subMenuHeading );
	}
	else
	if ( thisMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
	{
		if ( thisMenuItem->currentSubMenu == NULL )
		{
			thisMenuItem->currentSubMenu = thisMenuItem->firstSubMenu;

		}

		subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) thisMenuItem->currentSubMenu;

		thisMenuItem->lastSubMenu = NULL ;		// always select

		subScrollMenuItem->currentPosition = subScrollMenuItem->subMenuHeading;
		LCD_Write_String( SECOND_LINE, 0, subScrollMenuItem->currentPosition);

		xTimerStart( LCDTimer2, portMAX_DELAY );		// only start when we have a text MEssage to scroll
		xTimerStop( LCDTimer1, portMAX_DELAY );

	}
	else
	if ( thisMenuItem->SubMenuClass == SUB_MENU_INTEGER)
	{
		// depending on menu type convert to seconds or minutes and seconds

		switch ( thisMenuItem->SubMenuType )
		{
		case MENU_ITEM_TYPE_BEACON_BEEP:
			LCD_Write_String( SECOND_LINE, 0, ConvertToSeconds( thisMenuItem->currentValue, theMessage ) );
			break;

		case MENU_ITEM_TYPE_CONFIDENCE_BEEP:
			LCD_Write_String( SECOND_LINE, 0, ConvertToMinutes( thisMenuItem->currentValue, theMessage ) );
			break;

		}

	}

}


static void DisplayVolume()
{
	char VolMsg[16];
	int Vol;
	int i = 3 ;

	memset( VolMsg, ' ', sizeof(VolMsg)) ;

	VolMsg[0] = 'V' ;
	VolMsg[1] = 'o' ;
	VolMsg[2] = 'l' ;


	if ( ( Vol = MicrophoneVolume ) == 0 )
	{
		VolMsg[4] = '0' ;
		VolMsg[5] = 0 ;
	}
	else
	{
		while( Vol && (i>0) )
		{
			VolMsg[i+4] = (Vol%10) + '0' ;
			i -= 1 ;
			Vol /= 10 ;
		}
	}

	LCD_BackLight( SEND_LCD_BACKLIGHT_ON );		/* light the LCD */
	//xTimerStart( LCDTimer1, portMAX_DELAY );	// and start the backlight timer

	LCD_Write_String( SECOND_LINE, 0, VolMsg);

	DisplayVolumeCounter = 3 ;

	if ( xTimerStart( LCDTimer1, portMAX_DELAY ) == pdPASS )	// and start the backlight timer
	{
		xil_printf( "BG Timer OK \r\n");
	}
	else
	{
		xil_printf( "BG Timer Failed \r\n");
	}
}

static MAIN_MENU_ITEM *FindMainMenuItem( int MainMenuType )
{
	MAIN_MENU_ITEM	*theItem = firstMenuItem ;

	do
	{
		if ( theItem->SubMenuType == MainMenuType )
		{
			break;
		}
		theItem = theItem->nextMainMenu ;
	} while ( theItem != NULL );

	return theItem;
}


#if 1

static void LCD_Home()
{
	LCD_ControlWrite( 0x02 );				/* 	*/
	vTaskDelay( pdMS_TO_TICKS(10));		/* wait >1 millsec (min) */

}

static void LCD_Clear()
{
	LCD_ClearLine( FIRST_LINE );
	LCD_ClearLine( SECOND_LINE );
}


void LCD_Write_String( int WhichLine, int position, char *DisplayString)
{
	if ( WhichLine == SECOND_LINE )
	{
		LCD_SecondLine(position);
	}
	else
	{
		//LCD_Home();
		LCD_FirstLine(position);
	}

	while ( *DisplayString )
	{
		/* write character at *DisplayString to LCD data port i.e. the 8 data bits */

		LCD_Write_Char(*DisplayString);

		DisplayString++;
	}
}


static void LCD_Write_Char( char DisplayCharacter)
{
	//int 	i;
	//int enable = 0;
	u32  regValue ;

	regValue = ( 0xFA000000) | LCD_RS | LCD_Enable  | ((DisplayCharacter)&0xFF)  ;	// write only 8 data bits
	*GPIO2dataMasked = regValue ;


	vTaskDelay( 5 );							/* wait > 1usec (min) */

	regValue = ( 0xFA000000) ;	// write only 8 data bits
	*GPIO2dataMasked = regValue ;

	//xil_printf( "= %c\r\n", DisplayCharacter );

	return;




}


// Set cursor on LCD display based on value in register 'cursor_position'
//
// There are 20 character positions with the following addresses on the first line
// position         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
// cursor_position 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13
// address         80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f 90 91 92 93
// line 2 address   c0 c1 c2 .....
// other lines have other values�..
// Writing characters auto increments the address, but note that


static void LCD_FirstLine( int position )
{
	int i;
	int enable = 0;
	u32 regValue;


	regValue = 0xFB000000 | LCD_Enable | ((0x80 | position)&0xFF) ;  // mask for control bits and data bits

	*GPIO2dataMasked = regValue ;

	vTaskDelay( 25 );							/* wait > 1usec (min) */

	regValue = 0xFB000000;

	*GPIO2dataMasked = regValue ;

	return;
}


static void LCD_SecondLine( int position )
{
	int i;
	int enable = 0;
	u32 regValue;


	regValue = 0xFB000000 | LCD_Enable | ((0xC0 | position)&0xFF) ;  // mask for control bits and data bits

	*GPIO2dataMasked = regValue ;

	vTaskDelay( 25 );							/* wait > 1usec (min) */

	regValue = 0xFB000000;

	*GPIO2dataMasked = regValue ;

	return;
}


static void LCD_ClearLine( int whichLine )
{
	int i;

	if ( whichLine == FIRST_LINE )
	{
		LCD_FirstLine( 0 );
	}
	else
	{
		LCD_SecondLine( 0 );
	}

	for ( i=0; i<16; i++ )
	{
		LCD_Write_Char( ' ' );
	}

}


static void LCD_ControlWriteStart( int value )
{

	//int i;
	//int enable ;

	u32  regValue ;

	//regValue = (~value)&0xFF ;	// write only 8 data bits and invert the value
	regValue = (value)&0xFF ;	// write only 8 data bits

	//regValue |= LCD_RS ;
	regValue |= LCD_Enable ;

	//regValue |= 0xFFC00000 ;  // mask for control bits and data bits

	//*GPIO2dataMasked = regValue ;
	*GPIO2data = regValue ;

	vTaskDelay( 10 );							/* wait > 1usec (min) */
	//for ( i=0; i<40000; i++) { enable += 1; }

	regValue &= ~LCD_Enable ;
	//regValue &= ~LCD_RS ;

	regValue = 0;

	//*GPIO2dataMasked = regValue ;
	*GPIO2data = regValue ;


	regValue= 0 ;

	return ;

}



static void LCD_ControlWrite( int value )
{

	int i;
	int enable ;

	u32  regValue ;

	regValue = (value)&0xFF ;	// write only 8 data bits

	regValue |= LCD_Enable ;

	regValue |= 0xFFC00000 ;  // mask for control bits and data bits

	*GPIO2dataMasked = regValue ;
	//*GPIO2data = regValue ;

	vTaskDelay( 10 );							/* wait > 1usec (min) */
	//for ( i=0; i<40000; i++) { enable += 1; }

	regValue &= ~LCD_Enable ;

	regValue = 0;

	*GPIO2dataMasked = regValue ;
	//*GPIO2data = regValue ;


	regValue= 0 ;

	return ;
}



static void LCD_BackLight( char backLightSetting )
{
	char	PLMessage[4] ;

	PLMessage[0] = '*' ;
	PLMessage[1] = backLightSetting;
	PLMessage[2]  = (u32) '\r' ;		// c/r
	PLMessage[3]  = (u32) '\n' ;		// load  pico

	while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}


#else


#endif


/*
 * Backlight Timer handler
 */
static void LCDTimer1Callback( TimerHandle_t theHandle)
{
	char KeyMessage[8];

	KeyMessage[0] = KEY_TIMEOUT1;

	while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}

/*
 * LCD message scrolling timer
 */
static void LCDTimer2Callback( TimerHandle_t theHandle)
{
	char KeyMessage[8];

	KeyMessage[0] = KEY_TIMEOUT2;

	while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}

	xTimerStart( LCDTimer2, portMAX_DELAY );
}


/*
 * confidence beep timer
 */
static void LCDTimer3Callback( TimerHandle_t theHandle)
{
	char KeyMessage[8];

	KeyMessage[0] = KEY_TIMEOUT3;

	while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}

	xTimerStart( LCDTimer3, pdMS_TO_TICKS(1)* 1000 );
}



/*
 * Bluetooth Transmit timer
 */
static void LCDTimer4Callback( TimerHandle_t theHandle)
{
	char KeyMessage[2];

	KeyMessage[0] = KEY_TIMEOUT4;

	while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}

	//xTimerStart( LCDTimer4, pdMS_TO_TICKS(1)* 1000 );
}

/*
 * watchdog timer
 */
static void LCDTimer5Callback( TimerHandle_t theHandle)
{
	char KeyMessage[2];

	KeyMessage[0] = KEY_TIMEOUT5;

	while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}

}




static char *ConvertToSeconds( int value, char *buffer )
{

	sprintf( buffer, "%d secs", value );

	return buffer;



}

static char *ConvertToMinutes( int value, char *buffer )
{
	int minutes ;
	int seconds;

	minutes = value/60;
	seconds = value - (minutes*60);


	sprintf( buffer, "%d min %d secs", minutes, seconds );

	return buffer;



}

static char parsedString[202] ;		/* allow for pre-set text messages */


void MenuMessageFromHostComputer( char *theMessage )
{

	char parsedMenuType;
	int i;
	int copying;
	int parsedIndex;
	static MAIN_MENU_ITEM 	*mainMenuItem ;
	static SUB_MENU_ITEM	*subMenuItem ;
	static MAIN_MENU_ITEM 	*mainMenuItemPrevious ;
	static SUB_MENU_ITEM	*subMenuItemPrevious ;
	SUB_MENU_SCROLL_ITEM * subScrollMenuItem ;

	if ( CDCardRunning == 0 )
		return ;

	if ( strncmp( theMessage, "DOWNLOADSTART:", 14) == 0 )
	{

		// NOTE WELL

		// this fails if you try using the test menu system above and then
		// try to download from a PC over it! This is because the test menu
		// system is not allocated from the pool.

		if ( firstMenuItem && (firstMenuItem != &theMenu_3) )
		{

			mainMenuItem = firstMenuItem ;

			while ( mainMenuItem )
			{

				mainMenuItemPrevious = mainMenuItem ;		/* use as next for now */

				if ( mainMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
				{
					if ( ( subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) mainMenuItem->firstSubMenu ) != NULL )
					{
						while (subScrollMenuItem && (subScrollMenuItem != (SUB_MENU_SCROLL_ITEM *) mainMenuItem->firstSubMenu ) )
						{

							if ( subScrollMenuItem->subMenuHeading )
							{
								vPortFree( subScrollMenuItem->subMenuHeading );
							}

							subMenuItemPrevious = (SUB_MENU_ITEM *) subScrollMenuItem ;
							vPortFree( subScrollMenuItem );

							subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) subMenuItemPrevious->nextSubMenu;
						}
					}
				}
				else
				{
					if ( ( subMenuItem = mainMenuItem->firstSubMenu ) != NULL )
					{
						do
						{
							subMenuItemPrevious = subMenuItem ;
							vPortFree( subMenuItem );

							subMenuItem = subMenuItemPrevious->nextSubMenu;
						} while (subMenuItem && (subMenuItem != mainMenuItem->firstSubMenu ) );
					}

				}

				vPortFree( mainMenuItem );

				mainMenuItem = mainMenuItemPrevious->nextMainMenu ;

			}
		}
		// need to release all memory allocated to the menus first
		firstMenuItem = NULL;
		mainMenuItem = NULL ;
		subMenuItem = NULL ;
		mainMenuItemPrevious = NULL ;
		subMenuItemPrevious = NULL ;
	}
	else
	if ( strncmp( theMessage, "NAME: ", 6) == 0 )
	{
		copying = 0;

		for ( i=6; i<strlen( theMessage ); i++ )
		{
			if ( theMessage[i] == '<' )
			{
				copying = 1;
				parsedIndex = 0;

			}
			else
			if ( theMessage[i] == '>' )
			{
				copying = 0;
				parsedString[parsedIndex++] = 0;
				break;
			}
			else
			if ( copying )
			{
				parsedString[parsedIndex++] = theMessage[i];
			}
		}

		strncpy( (char *) thisNicolaSettings.thisNicolaName, parsedString, NICOLA_NAME_SIZE);

		copying = 0;

		i++;

		for ( ; i<strlen( theMessage ); i++ )
		{
			if ( theMessage[i] == '<' )
			{
				copying = 1;
				parsedIndex = 0;

			}
			else
			if ( theMessage[i] == '>' )
			{
				copying = 0;
				parsedString[parsedIndex++] = 0;
				break;
			}
			else
			if ( copying )
			{
				parsedString[parsedIndex++] = theMessage[i];
			}
		}

		thisNicolaSettings.thisNicolaID = atoi( parsedString);

	}
	else
	if ( strncmp( theMessage, "SETTING: ", 9) == 0 )
	{
		copying = 0;

		for ( i=9; i<strlen( theMessage ); i++ )
		{
			if ( theMessage[i] == '<' )
			{
				copying = 1;
				parsedIndex = 0;

			}
			else
			if ( theMessage[i] == '>' )
			{
				copying = 0;
				parsedString[parsedIndex++] = 0;
				break;
			}
			else
			if ( copying )
			{
				parsedString[parsedIndex++] = theMessage[i];
			}
		}

		int theSettingsType = atoi(parsedString);

		i += 2;

		copying = 0;

		for ( /* continue */; i<strlen( theMessage ); i++ )
		{
			if ( theMessage[i] == '<' )
			{
				copying = 1;
				parsedIndex = 0;

			}
			else
			if ( theMessage[i] == '>' )
			{
				copying = 0;
				parsedString[parsedIndex++] = 0;
				break;
			}
			else
			if ( copying )
			{
				parsedString[parsedIndex++] = theMessage[i];
			}
		}


		if ( theSettingsType == 0 )					// "Microphone Vol") == 0)
		{
			thisNicolaSettings.microphoneVolume = atoi( parsedString );
		}
		else
		if ( theSettingsType == 1 )					// "Aerial Type") == 0)
		{
			thisNicolaSettings.aerialType = atoi( parsedString );
		}
		else
		if ( theSettingsType == 2 )					// "Aerial Freq") == 0)
		{
			thisNicolaSettings.aerialFrequency = atoi( parsedString );
		}
		else
		if ( theSettingsType == 3 )					// "Confidence Beep Time") == 0)
		{
			thisNicolaSettings.confidenceBeepTime = atoi( parsedString );
		}

		else
		if ( theSettingsType == 4 )					// "Beacon Beep Time") == 0)
		{
			thisNicolaSettings.beaconBeepTime = atoi( parsedString );
		}
		else
		{
#if 0
			while ( xQueueSendToBack( consoleTransmitQueue, "Query Default Setting", 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
#endif
		}


#if 0
		while ( xQueueSendToBack( consoleTransmitQueue, "D/L Settings\n\r", 0 ) != pdPASS )
		{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
		}
#endif


	}
	else
	if ( strncmp( theMessage, "MENU: ", 6) == 0 )
	{
		copying = 0;

		for ( i=6; i<strlen( theMessage ); i++ )
		{
			if ( theMessage[i] == '<' )
			{
				copying = 1;
				parsedIndex = 0;

			}
			else
			if ( theMessage[i] == '>' )
			{
				copying = 0;
				parsedString[parsedIndex++] = 0;
				break;
			}
			else
			if ( copying )
			{
				parsedString[parsedIndex++] = theMessage[i];
			}
		}

		i += 2 ;		// skip '>' and space character
		parsedMenuType = theMessage[i];

		if ( ( mainMenuItem = pvPortMalloc( sizeof(MAIN_MENU_ITEM)) ) != NULL )
		{
			memset( mainMenuItem, 0, sizeof( MAIN_MENU_ITEM) ) ;
			strncpy( (char *) &mainMenuItem->heading, parsedString, 18 );
			mainMenuItem->heading[16] = 0;


#if 0
			while ( xQueueSendToBack( consoleTransmitQueue, mainMenuItem->heading, 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
#endif


#if 0
			switch (mainMenuItem->SubMenuClass )
			{
			case 'A':
				mainMenuItem->SubMenuClass = SUB_MENU_TEXT;	// the default setting
				break;
			case 'Z':
				mainMenuItem->SubMenuClass = SUB_MENU_INTEGER;	// the default setting
				break;

			}
#endif

			mainMenuItem->SubMenuType = parsedMenuType;

			LCD_LoadHandlerRoutine( mainMenuItem );

			// also need to download this value
			mainMenuItem->currentValue = 0;


			// now add to the Menu list

			if ( firstMenuItem == NULL )
			{
				firstMenuItem = mainMenuItem;
			}
			if ( mainMenuItemPrevious != NULL )
			{
				mainMenuItemPrevious->nextMainMenu = mainMenuItem ;
				mainMenuItem->previousMainMenu = mainMenuItemPrevious ;

			}

			mainMenuItemPrevious = mainMenuItem ;

			subMenuItemPrevious = NULL;
		}
	}
	else
	if ( strncmp( theMessage, "SUB: ", 5) == 0 )
	{
		copying = 0;

		for ( i=5; i<strlen( theMessage ); i++ )
		{
			if ( theMessage[i] == '<' )
			{
				copying = 1;
				parsedIndex = 0;

			}
			else
			if ( theMessage[i] == '>' )
			{
				copying = 0;
				parsedString[parsedIndex++] = 0;
				break;
			}
			else
			if ( copying )
			{
				parsedString[parsedIndex++] = theMessage[i];
			}
		}

		i += 2 ;		// skip '>' and space character
		parsedMenuType = theMessage[i];

		if ( mainMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT )
		{
			subScrollMenuItem = pvPortMalloc( sizeof(SUB_MENU_SCROLL_ITEM) );

			if ( subScrollMenuItem != NULL )
			{
				memset( subScrollMenuItem, 0x0, sizeof( SUB_MENU_SCROLL_ITEM ) );

				subScrollMenuItem->subMenuHeading = NULL ;

				if ( parsedIndex > 0 )
				{
					subScrollMenuItem->subMenuHeading = pvPortMalloc( parsedIndex );

					if ( subScrollMenuItem->subMenuHeading )
					{
						strncpy( subScrollMenuItem->subMenuHeading, parsedString, parsedIndex );
					}

					subScrollMenuItem->value = parsedMenuType - '0' ; 	// make pure integer value



#if 0
					while ( xQueueSendToBack( consoleTransmitQueue, subScrollMenuItem->subMenuHeading, 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif


					if (subMenuItemPrevious )
					{
						subMenuItemPrevious->nextSubMenu = ( SUB_MENU_ITEM *) subScrollMenuItem ;
						subScrollMenuItem->previousSubMenu = (SUB_MENU_SCROLL_ITEM *) subMenuItemPrevious;
					}

					subMenuItemPrevious = ( SUB_MENU_ITEM *) subScrollMenuItem;

					if (mainMenuItem->firstSubMenu == NULL )
					{
						mainMenuItem->firstSubMenu = ( SUB_MENU_ITEM *) subScrollMenuItem;
					}
				}

				//subScrollMenuItem->nextSubMenu = (SUB_MENU_SCROLL_ITEM *) mainMenuItem->firstSubMenu ;
				subScrollMenuItem->nextSubMenu = NULL ;
			}

		}
		else
		{
			subMenuItem = pvPortMalloc( sizeof(SUB_MENU_ITEM) );
			if ( subMenuItem != NULL )
			{
				memset( subMenuItem, 0, sizeof( SUB_MENU_ITEM ) );

				strncpy( (char *) subMenuItem->subMenuHeading, parsedString, 18 );
				subMenuItem->subMenuHeading[16] = 0;
				subMenuItem->value = parsedMenuType - '0' ; 	// make pure integer value


				if (subMenuItemPrevious )
				{
					subMenuItemPrevious->nextSubMenu = subMenuItem ;
					subMenuItem->previousSubMenu = subMenuItemPrevious;
				}

				subMenuItemPrevious = subMenuItem;

				if (mainMenuItem->firstSubMenu == NULL )
				{
					mainMenuItem->firstSubMenu = subMenuItem;
				}

				//subMenuItem->nextSubMenu = mainMenuItem->firstSubMenu ;
				subMenuItem->nextSubMenu = NULL ;

			}
		}
	}
	else
	if ( strncmp( theMessage, "COMMIT:", 7) == 0 )
	{
		writeMenuToFlash();

		ApplyDefaultSettings();
	}
}

static void ApplyDefaultSettings()
{

	SetMicrophoneVolume( 0 );

	SetAerialType( thisNicolaSettings.aerialType);

	SetAerialFrequency( thisNicolaSettings.aerialFrequency);

	SetConfidenceBeepTime( thisNicolaSettings.confidenceBeepTime);

	//BluetoothBeginInquiry( thisNicolaSettings.);  		//	if RADIO STARTS IN INQUIRY MODE

	//thisNicolaSettiBeaconBeep to be done .

}

static	u8		pageInFlash[(PAGE_SIZE*2)];		/* read/write 2 pages plus the command header */
int				flashOffset = 0;
u8				*pageData;

static u8 readback[PAGE_SIZE];

static void checkFlashWrite( )
{
	if ( (u32) pageData > (u32) &pageInFlash[PAGE_SIZE] )
	{
		/* filled the lower page; write it to flash */

		//CDFlashWrite( pageInFlash, LCD_MENU_FLASH_ADDRESS, PAGE_SIZE*2);

		CDFlashWrite( pageInFlash, LCD_MENU_FLASH_ADDRESS + flashOffset, PAGE_SIZE);


		memcpy( &pageInFlash[0], &pageInFlash[PAGE_SIZE], PAGE_SIZE );

		memset( &pageInFlash[PAGE_SIZE], 0, PAGE_SIZE );

		pageData -= PAGE_SIZE ;

		CDFlashRead( readback, LCD_MENU_FLASH_ADDRESS + flashOffset, PAGE_SIZE);

		flashOffset += PAGE_SIZE ;

	}

}

static void writeMenuToFlash()
{

	MAIN_MENU_ITEM 	*mainMenuItem ;
	SUB_MENU_ITEM	*subMenuItem ;


	/* now write the menu test harness */

	if ( ( mainMenuItem = firstMenuItem ) == NULL )		/* if no menu then do not write */
	{
		return;
	}

	// do not erase a CD card   ... q FlashErase( (u8 *) LCD_MENU_FLASH_ADDRESS, PAGE_SIZE);

	flashOffset = 0;

	pageData = &pageInFlash[0] ;
	memset( pageInFlash, 0x0, sizeof(pageInFlash) );

	*pageData = 0xF4;		// indicate a menu header
	*(pageData+1) = 0;

	memcpy( pageData+2, &thisNicolaSettings, sizeof(NICOLA_SETTINGS_DATA) );

	pageData += SETTINGS_IN_FLASH;		// extra bytes reserved for future use	*/

	checkFlashWrite(  );



	while ( mainMenuItem != NULL )
	{
		*pageData = 0xF8;		// indicate a menu header
		*(pageData+1) = 0;

		memcpy( pageData+2, mainMenuItem, sizeof(MAIN_MENU_ITEM) );

		pageData += MAIN_MENU_ITEM_IN_FLASH;		// extra bytes for future use	*/

		checkFlashWrite(  );

		subMenuItem = mainMenuItem->firstSubMenu ;

		while ( subMenuItem != NULL )
		{
			if ( mainMenuItem->SubMenuClass == SUB_MENU_SCROLL_TEXT)
			{
				*pageData = 0xFC;		// indicate a sub menu header for string
				*(pageData+1) = 0;

				memcpy( pageData+2, subMenuItem, sizeof(SUB_MENU_SCROLL_ITEM)) ;
				pageData += SUB_MENU_ITEM_IN_FLASH ;		/* extra bytes for future use	*/

				checkFlashWrite();

				/* the text string follows immediately */

				strncpy( (char *) pageData, (char *) ((SUB_MENU_SCROLL_ITEM *) subMenuItem)->subMenuHeading, SUB_MENU_SCROLL_TEXT_IN_FLASH );
				pageData += SUB_MENU_SCROLL_TEXT_IN_FLASH ;		/* 	*/

			}
			else
			{
				*pageData = 0xFA;		// indicate a menu header
				*(pageData+1) = 0;

				memcpy( pageData+2, subMenuItem, sizeof(SUB_MENU_ITEM)) ;
				pageData += SUB_MENU_ITEM_IN_FLASH ;		/* extra bytes for future use	*/
			}

			checkFlashWrite();

			subMenuItem = subMenuItem->nextSubMenu ;
		}

		mainMenuItem = mainMenuItem->nextMainMenu ;

	}

	// write the last section

	CDFlashWrite( pageInFlash, LCD_MENU_FLASH_ADDRESS + flashOffset, PAGE_SIZE);

}

static int ReadMenuFromFlash( void )
{
	//u8				pageInFlash[512 + 4];		/* read/write 2 pages plus the command header */
	u8				*pageData;
	MAIN_MENU_ITEM 	*mainMenuItem ;
	SUB_MENU_ITEM	*subMenuItem ;
	MAIN_MENU_ITEM 	*mainMenuItemPrevious ;
	SUB_MENU_ITEM	*subMenuItemPrevious ;
	SUB_MENU_SCROLL_ITEM *subScrollMenuItem ;
	int				flashOffset = 0;
	int				textLen;

	/*
	 * Read the contents of the FLASH from TEST_ADDRESS, using Normal Read
	 * command. Change the pre-scaler as the READ command operates at a
	 * lower frequency.
	 */

	extern int CDCardInit();

	if ( CDCardInit() == FALSE )
	{
		//while ( xQueueSendToBack( consoleTransmitQueue, "CD FAIL- Default Menu\n\r", 0 ) != pdPASS )
		//{
		//	vTaskDelay( pdMS_TO_TICKS( 5 ));
		//}

		firstMenuItem = &theMenu_3;

		//ApplyDefaultSettings();

		SetMicrophoneVolume( 0 );

		return pdFAIL;
	}

	CDCardRunning = 1;

	// enable if need to clean flash to write test menu

	//memset( pageInFlash, 0x0, sizeof(pageInFlash));

	//memcpy( pageInFlash, "Pete was here", 14);

	//CDFlashRead( pageInFlash, (u8 *) LCD_MENU_FLASH_ADDRESS, PAGE_SIZE*2);
	//CDFlashWrite( pageInFlash, LCD_MENU_FLASH_ADDRESS, PAGE_SIZE*2);


	memset( pageInFlash, 0xA5, sizeof(pageInFlash));

	//CDFlashRead( pageInFlash, (u8 *) LCD_MENU_FLASH_ADDRESS, PAGE_SIZE*2);
	CDFlashRead( pageInFlash, LCD_MENU_FLASH_ADDRESS, PAGE_SIZE);
	CDFlashRead( pageInFlash+PAGE_SIZE, LCD_MENU_FLASH_ADDRESS+PAGE_SIZE, PAGE_SIZE);

	flashOffset = PAGE_SIZE;


	if ( ( pageInFlash[0] == 0xFF ))	/* is there a menu on the CD card ? */
	{

		firstMenuItem = &theMenu_3;

#if 0
		/* test phase - report then write the test menu to flash */

		firstMenuItem = &theMenu_3 ;
		writeMenuToFlash();

#endif
#if 0
		// FlashErase( (u8 *) LCD_MENU_FLASH_ADDRESS, PAGE_SIZE);

		/* now write the menu test harness */

		mainMenuItem = &theMenu_3 ;

		pageData = &pageInFlash[4] ;
		pageInFlash[0] = pageInFlash[1] = pageInFlash[2] = pageInFlash[3] = 0;

		memset( pageInFlash, 0xFF, sizeof(pageInFlash) );

		while ( mainMenuItem != NULL )
		{
			*pageData = 0xF8;		// indicate a menu header
			*(pageData+1) = 0;

			memcpy( pageData+2, mainMenuItem, sizeof(MAIN_MENU_ITEM) );

			pageData += sizeof(MAIN_MENU_ITEM) + 16 ;		/* 14 bytes for future use	*/

			subMenuItem = mainMenuItem->firstSubMenu ;

			while ( subMenuItem != NULL )
			{
				*pageData = 0xFA;		// indicate a menu header
				*(pageData+1) = 0;

				memcpy( pageData+2, subMenuItem, sizeof(SUB_MENU_ITEM)) ;
				pageData += sizeof(SUB_MENU_ITEM) + 8 ;		/* 6 bytes for future use	*/


				subMenuItem = subMenuItem->nextSubMenu ;
			}

			mainMenuItem = mainMenuItem->nextMainMenu ;

			if ( (u32) pageData > (u32) &pageInFlash[4+256] )
			{
				/* filled the lower page; write it to flash */

				// FlashWrite( pageInFlash, (u8 *) LCD_MENU_FLASH_ADDRESS + flashOffset, PAGE_SIZE);

				flashOffset += PAGE_SIZE ;

				memcpy( &pageInFlash[4], &pageInFlash[4+256], PAGE_SIZE );

				pageData -= PAGE_SIZE ;

			}
		}
		// FlashWrite( pageInFlash, (u8 *) LCD_MENU_FLASH_ADDRESS + flashOffset, PAGE_SIZE);

#endif


		return pdFAIL;		/* menu not read */
	}
	else
	{
		/* read the menu system from flash */
		/* test phase - report then write the test menu to flash */

		pageData = &pageInFlash[0] ;

		mainMenuItem = NULL ;
		subMenuItem = NULL ;

		mainMenuItemPrevious = NULL;
		subMenuItemPrevious = NULL;

		while ( *pageData != 0x00 )
		{
			if ( *pageData == 0xF4 )		// is a Settings block
			{
				memcpy( &thisNicolaSettings, pageData+2, sizeof(NICOLA_SETTINGS_DATA) );

				pageData += SETTINGS_IN_FLASH ;

			}
			else
			if ( *pageData == 0xF8 )		// is a main menu item
			{

				if ( ( mainMenuItem = pvPortMalloc( sizeof(MAIN_MENU_ITEM)) ) != NULL )
				{
					memcpy( mainMenuItem, pageData+2, sizeof(MAIN_MENU_ITEM) );

					if ( firstMenuItem == NULL )
					{
						firstMenuItem = mainMenuItem;
					}

					mainMenuItem->nextMainMenu = NULL;
					mainMenuItem->previousMainMenu = NULL;
					mainMenuItem->firstSubMenu = NULL;
					mainMenuItem->currentSubMenu = NULL;
					mainMenuItem->lastSubMenu = NULL;
					mainMenuItem->currentValue = 0;
					mainMenuItem->lastValue = 0;

					if ( mainMenuItemPrevious != NULL )
					{
						mainMenuItemPrevious->nextMainMenu = mainMenuItem ;
						mainMenuItem->previousMainMenu = mainMenuItemPrevious ;
					}

					mainMenuItemPrevious = mainMenuItem ;
					subMenuItemPrevious = NULL;

					LCD_LoadHandlerRoutine( mainMenuItem );

					/* now populate the sub menu  for this item */

					pageData += MAIN_MENU_ITEM_IN_FLASH ;		/* enough bytes for future use	*/

#if 0
					while ( xQueueSendToBack( consoleTransmitQueue, mainMenuItem->heading, 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
#endif

				}
			}
			else
			if ( *pageData == 0xFA )		// is a sub menu item
			{
				if ( mainMenuItem != NULL )		// there must be a main menu item to which we belong
				{
					if ( ( subMenuItem = pvPortMalloc( sizeof(SUB_MENU_ITEM)) ) != NULL )
					{
						memcpy( subMenuItem, pageData+2, sizeof(SUB_MENU_ITEM) );


						/* now populate the sub menu  for this item */

						pageData += SUB_MENU_ITEM_IN_FLASH ;		/* 6 bytes for future use	*/

						subMenuItem->nextSubMenu = NULL;
						subMenuItem->previousSubMenu = NULL;

						if (subMenuItemPrevious )
						{
							subMenuItemPrevious->nextSubMenu = subMenuItem ;
							subMenuItem->previousSubMenu = subMenuItemPrevious;
						}

						subMenuItemPrevious = subMenuItem;

						if (mainMenuItem->firstSubMenu == NULL )
						{
							mainMenuItem->firstSubMenu = subMenuItem;
						}

#if 0
						while ( xQueueSendToBack( consoleTransmitQueue, subMenuItem->subMenuHeading, 0 ) != pdPASS )
						{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
						}
#endif

					}
				}
			}
			else
			if ( *pageData == 0xFC )		// is a sub menu text item
			{

				if ( mainMenuItem != NULL )		// there must be a main menu item to which we belong
				{
					if ( ( subScrollMenuItem = pvPortMalloc( sizeof(SUB_MENU_SCROLL_ITEM)) ) != NULL )
					{
						memcpy( subScrollMenuItem, pageData+2, sizeof(SUB_MENU_SCROLL_ITEM) );

						subScrollMenuItem->subMenuHeading = NULL;
						subScrollMenuItem->currentPosition = NULL;

						/* now populate the sub menu  for this item */

						pageData += SUB_MENU_ITEM_IN_FLASH ;		/* 6 bytes for future use	*/


						textLen = strlen( (char *) pageData );

						if ( textLen > SUB_MENU_SCROLL_TEXT_IN_FLASH )
						{
							textLen = SUB_MENU_SCROLL_TEXT_IN_FLASH ;
						}

						if ( textLen > 0 )
						{
							if ( ( subScrollMenuItem->subMenuHeading = pvPortMalloc( textLen ) ) != NULL )
							{
								strncpy( (char *) subScrollMenuItem->subMenuHeading, (char *) pageData, textLen );
							}
						}

						pageData += SUB_MENU_SCROLL_TEXT_IN_FLASH ;		/* 200 bytes	*/

						subScrollMenuItem->nextSubMenu = NULL;
						subScrollMenuItem->previousSubMenu = NULL;

						if (subMenuItemPrevious )
						{
							subMenuItemPrevious->nextSubMenu = (SUB_MENU_ITEM *) subScrollMenuItem ;
							subScrollMenuItem->previousSubMenu = (SUB_MENU_SCROLL_ITEM *) subMenuItemPrevious;
						}

						subMenuItemPrevious = (SUB_MENU_ITEM *) subScrollMenuItem;

						if (mainMenuItem->firstSubMenu == NULL )
						{
							mainMenuItem->firstSubMenu = (SUB_MENU_ITEM *) subScrollMenuItem;
						}
					}
				}
			}
			else
			{
				while ( xQueueSendToBack( consoleTransmitQueue, " Flash layout error\n\r", 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}

				flashOffset += 64;		/* minimum block size */

				if ( flashOffset > 0x10000 )
				{
					firstMenuItem = &theMenu_3;
					return pdFAIL;
				}
			}


			if ( (u32) pageData > (u32) &pageInFlash[PAGE_SIZE] )
			{
				/* dealt with the lower page; read next block from  CD card */
				flashOffset += PAGE_SIZE ;

				memcpy( &pageInFlash[0], &pageInFlash[PAGE_SIZE], PAGE_SIZE);

				CDFlashRead( &pageInFlash[PAGE_SIZE], LCD_MENU_FLASH_ADDRESS + flashOffset, PAGE_SIZE);

				pageData = pageData - PAGE_SIZE ;

#if 0
						while ( xQueueSendToBack( consoleTransmitQueue, ">> READ\n\r", 0 ) != pdPASS )
						{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
						}
#endif
			}
		}

#if 0
		vTaskDelay( pdMS_TO_TICKS( 1000 ));
		mainMenuItem = firstMenuItem;

		while ( mainMenuItem != NULL )
		{
			while ( xQueueSendToBack( consoleTransmitQueue, mainMenuItem->heading, 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
			//while ( xQueueSendToBack( consoleTransmitQueue, " <<\n\r", 0 ) != pdPASS )
			//{
			//	vTaskDelay( pdMS_TO_TICKS( 5 ));
			//}

			subMenuItem = mainMenuItem->firstSubMenu;

			while ( subMenuItem != NULL )
			{
				while ( xQueueSendToBack( consoleTransmitQueue, subMenuItem->subMenuHeading, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
				subMenuItem = subMenuItem->nextSubMenu ;
			}

			mainMenuItem = mainMenuItem->nextMainMenu ;

			while ( xQueueSendToBack( consoleTransmitQueue, "=====================\r\n", 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
		}
#endif

		return pdPASS ;


	}
	return pdFAIL; //pdPASS ;
}



static void LCD_LoadHandlerRoutine( MAIN_MENU_ITEM *mainMenuItem )
{

	mainMenuItem->menuItemChanged = NULL;	// default to this!

	mainMenuItem->SubMenuClass = SUB_MENU_TEXT;

	switch( mainMenuItem->SubMenuType )
	{
	//case MENU_ITEM_TYPE_MICROPHONE_VOLUME:
		//mainMenuItem->SubMenuClass = SUB_MENU_TEXT;
	//	mainMenuItem->menuItemChanged = &SetMicrophoneVolume;
	//	break;
	case MENU_ITEM_TYPE_AERIAL_TYPE:
		//mainMenuItem->SubMenuClass = SUB_MENU_TEXT;
		mainMenuItem->menuItemChanged = &SetAerialType;
		break;
	case MENU_ITEM_TYPE_FREQUENCY:
		//mainMenuItem->SubMenuClass = SUB_MENU_TEXT;
		mainMenuItem->menuItemChanged = &SetAerialFrequency;
		break;
	case MENU_ITEM_TYPE_CONFIDENCE_BEEP:
		mainMenuItem->SubMenuClass = SUB_MENU_INTEGER;
		mainMenuItem->menuItemChanged = &SetConfidenceBeepTime;
		break;
	case MENU_ITEM_TYPE_BEACON_BEEP:
		mainMenuItem->SubMenuClass = SUB_MENU_INTEGER;
		mainMenuItem->menuItemChanged = &SetBeaconBeepTime;
		break;
	case MENU_ITEM_TYPE_BLUETOOTH_PAIRING:
		mainMenuItem->menuItemChanged = &BluetoothBeginInquiry;
		//mainMenuItem->SubMenuClass = SUB_MENU_TEXT;
		break;
	case MENU_ITEM_TYPE_PRESET_TEXT_MSGS:
		mainMenuItem->SubMenuClass = SUB_MENU_SCROLL_TEXT;
		mainMenuItem->menuItemChanged = &SendPresetMessage;
		break;
	case MENU_ITEM_TYPE_RECVD_TEXT_MSGS:
		mainMenuItem->SubMenuClass = SUB_MENU_SCROLL_TEXT;
		break;
	case MENU_ITEM_TYPE_TURN_OFF:
		//mainMenuItem->SubMenuClass = SUB_MENU_TEXT;
		mainMenuItem->menuItemChanged = &EffectTurnRadioOff;
		break;

	}
}

void AddReceivedTextToMenu( char *textMessage )
{
	MAIN_MENU_ITEM 	*mainMenuItem ;
	SUB_MENU_SCROLL_ITEM *subScrollMenuItem ;
	SUB_MENU_SCROLL_ITEM *prevSubScrollMenuItem ;
	int				textLen ;


	if ( ( mainMenuItem = firstMenuItem) != NULL )
	{
		while ( mainMenuItem )
		{
			if ( mainMenuItem->SubMenuType == MENU_ITEM_TYPE_RECVD_TEXT_MSGS )
			{
				//subScrollMenuItem->currentPosition = NULL ;		/* stop any current scrolling */

				/* find an empty slot*/

				if ( (subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) mainMenuItem->firstSubMenu ) != NULL )
				{

					/* work to end of list */

					while ( ( subScrollMenuItem->nextSubMenu == NULL ) ||
						    ( subScrollMenuItem->nextSubMenu !=  (SUB_MENU_SCROLL_ITEM *)  mainMenuItem->firstSubMenu) )
					{
						subScrollMenuItem = subScrollMenuItem->nextSubMenu ;
					}


					/* free off the oldest message if any */

					if ( subScrollMenuItem->subMenuHeading )
					{
						vPortFree( subScrollMenuItem->subMenuHeading );			/* free the oldest received message */
					}

					/* now shuffle the messages down */

					do
					{
						prevSubScrollMenuItem = subScrollMenuItem->previousSubMenu ;
						subScrollMenuItem->subMenuHeading = prevSubScrollMenuItem->subMenuHeading ;
						prevSubScrollMenuItem->subMenuHeading = NULL ;
						subScrollMenuItem->currentPosition = NULL;
						subScrollMenuItem = prevSubScrollMenuItem ;
					}
					while ( ( subScrollMenuItem->previousSubMenu != NULL ) &&
						    ( subScrollMenuItem !=  (SUB_MENU_SCROLL_ITEM *)  mainMenuItem->firstSubMenu) ) ;

					subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) mainMenuItem->firstSubMenu;		/* back to first */

					textLen = strlen( (char *) textMessage );

					if ( textLen > SUB_MENU_SCROLL_TEXT_IN_FLASH )
					{
						textLen = SUB_MENU_SCROLL_TEXT_IN_FLASH ;
					}

					if ( ( subScrollMenuItem->subMenuHeading = pvPortMalloc( textLen+1 ) ) != NULL )
					{
						strncpy( (char *) subScrollMenuItem->subMenuHeading, textMessage, textLen+1 );

					}

					subScrollMenuItem->currentPosition = NULL;


#if 0
					{
						if ( subScrollMenuItem->subMenuHeading == NULL )
						{
							textLen = strlen( (char *) textMessage );

							if ( textLen > SUB_MENU_SCROLL_TEXT_IN_FLASH )
							{
								textLen = SUB_MENU_SCROLL_TEXT_IN_FLASH ;
							}

							if ( ( subScrollMenuItem->subMenuHeading = pvPortMalloc( textLen ) ) != NULL )
							{
								strncpy( (char *) subScrollMenuItem->subMenuHeading, textMessage, textLen );

							}
							return ;		/* text recorded */
						}
						else
						{
							subScrollMenuItem = subScrollMenuItem->nextSubMenu ;
							if ( subScrollMenuItem ==  (SUB_MENU_SCROLL_ITEM *)  mainMenuItem->firstSubMenu)
							{
								subScrollMenuItem = NULL ;
							}
						}
					}


					/* if we get here then all slots are occupied - shuffle up and assign to first */

					subScrollMenuItem = (SUB_MENU_SCROLL_ITEM *) mainMenuItem->firstSubMenu ;
#endif
				}

				mainMenuItem = NULL ;
			}
			else
			{
				mainMenuItem = mainMenuItem->nextMainMenu ;
			}
		}
	}
}



void SetConfidenceBeepTime(int selected )
{

	if ( ( ConfidenceBeaconMode == NO_BEEP_MODE ) || ( ConfidenceBeaconMode == CONFIDENCE_MODE ))
	{

		// confidence time is in minutes and seconds stored as seconds

		ConfidenceBeepTimer = (selected * 1000) ;	// convert to milliseconds

		if ( selected == 0 )
		{
			xTimerStop( LCDTimer3, pdMS_TO_TICKS(1 * 1000)  );		// stop the confidence timer
			ConfidenceBeaconMode = NO_BEEP_MODE ;
		}
		else
		{
			xTimerChangePeriod( LCDTimer3,pdMS_TO_TICKS(ConfidenceBeepTimer), pdMS_TO_TICKS(1 * 1000) );
			xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	//
			ConfidenceBeaconMode = CONFIDENCE_MODE ;
		}


		while ( xQueueSendToBack( consoleTransmitQueue, "Set confidence beep time\n", 0 ) != pdPASS )
		{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
		}
	}

}


void SetDebuggingState(int selected )
{
	char DebugMessage[2] ;

	switch ( selected )
	{
	case 1:
		//xil_printf( "DEBUGGING OFF\r\n" );

		DebugMessage[0] = 1;
		while ( xQueueSendToBack( DebugControlQueue, DebugMessage, 0 ) != pdPASS )
		{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
		}

		break;
	case 2:
		//xil_printf( "DEBUGGING ON\r\n" );

		DebugMessage[0] = 2;
		while ( xQueueSendToBack( DebugControlQueue, DebugMessage, 0 ) != pdPASS )
		{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
		}

		break;
	}
}



void SetBeaconBeepTime(int selected )
{

	if ( ( ConfidenceBeaconMode == NO_BEEP_MODE ) || ( ConfidenceBeaconMode == BEACON_MODE ))
	{
		ConfidenceBeepTimer = (selected * 1000) ;	// convert to milliseconds

		if ( selected == 0 )
		{
			xTimerStop( LCDTimer3, pdMS_TO_TICKS(1 * 1000)  );		// stop the beacon timer
			ConfidenceBeaconMode = NO_BEEP_MODE ;
		}
		else
		{
			xTimerChangePeriod( LCDTimer3,pdMS_TO_TICKS(ConfidenceBeepTimer), pdMS_TO_TICKS(1 * 1000) );
			xTimerStart( LCDTimer3, pdMS_TO_TICKS(1 * 1000) );	//
			ConfidenceBeaconMode = BEACON_MODE ;
		}


		while ( xQueueSendToBack( consoleTransmitQueue, "Set beacon time\n", 0 ) != pdPASS )
		{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
		}
	}

}



void EffectTurnRadioOff(int selected )
{
	char	PLMessage[4] ;

	if ( selected != 0 )
	{
		while ( xQueueSendToBack( consoleTransmitQueue, "Turn radio off\n", 0 ) != pdPASS )
		{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
		}

		//vTaskDelay( pdMS_TO_TICKS( 100 ));

		PLMessage[0] = '*' ;
		PLMessage[1] = SEND_TURN_OFF_RADIO ;
		PLMessage[2]  = (u32) '\r' ;		// c/r
		PLMessage[3]  = (u32) '\n' ;		// load  pico

		while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
		{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
		}
	}
	else
	{
		while ( xQueueSendToBack( consoleTransmitQueue, "keep radio on\n", 0 ) != pdPASS )
		{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
		}
	}


}


