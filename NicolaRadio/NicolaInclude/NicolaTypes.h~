/*****************************************************************************
** File Name : NicolaTypes.h
** Overview : Structures and definitions for the Nicola radio
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	May 2016	PA		Original Version

** All Rights Reserved(c) Association Nicola, Graham Naylor, Pete Allwright



*****************************************************************************/


#include "xparameters.h"	/* SDK generated parameters */
#include "xqspips.h"		/* QSPI device driver */


/* LED defitions */


#define GPIO_BANK2 (54)

#define LED_BLUE		(GPIO_BANK2 + 12)
#define LED_GREEN		(GPIO_BANK2 + 13)
#define LED_RED			(GPIO_BANK2 + 14)

#define LED_YELLOW		(0x8FFF1FFF)
#define LED_PURPLE		(0x8FFF2FFF)
#define LED_LIGHTBLUE	(0x8FFF4FFF)
#define LED_WHITE		(0x8FFF8FFF)
#define LED_OFF			(0x8FFFFFFF)



/*  need to hold all messages */
#define MAX_STRING_LENGTH	128
#define NICOLA_NAME_SIZE 20

char *GetVersionString();

void ConsoleStartup();
void BluetoothStartup();

void transmitToConsole( void *pvParameters );


u8   uart_ReceiveByteCheck( u32 uartAddress ) ;
u8   uart_ReceiveByte( u32 uartAddress, u8 *receivedByte );
void uart_SendByte(u32 BaseAddress, u8 Data);


typedef struct
{
	char			thisNicolaName[NICOLA_NAME_SIZE] ;		// its name - fixed for duration
	char			thisNicolaLocation[NICOLA_NAME_SIZE] ; 	// can by changed e.g. in texting
	char			thisNicolaID;		// the ID number of the Nicola

	char			microphoneVolume;
	char			aerialType;
	char			aerialFrequency;
	char			confidenceBeepTime;
	char			beaconBeepTime;


} NICOLA_SETTINGS_DATA;


extern NICOLA_SETTINGS_DATA thisNicolaSettings;


/* Bluetooth messages to/from Andriod for texting purposes */

typedef enum
{
	IDENTITY_MESSAGE_TYPE = 0x10,
	TIME_AND_DATE_MESSAGE_TYPE = 0x11,


	TEXT_MESSAGE_TYPE = 0x20,		// as appears in Nicola to Nicola transmission
	TEXT_MESSAGE_RECEIVED ,			// and is converted internally to either of these
	TEXT_MESSAGE_TO_TRANSMIT,

	TXTMSGTimer1_RECV_TIMEOUT = 0x60,
	TXTMSGTimer2_WAKE_UP_MESSAGE,

	END_OF

} COMMS_MESSAGE_TYPES;

typedef struct
{
	char	StartCharacter;
	char	MessageType;
	char	MessageLength[2];		// not short int to avoid alignment

} COMMS_MESSAGE_HEADER;

typedef struct
{
	char	C_R_Character;			// end of message for FIFO for transmission to pico
	char	L_F_Character;			// end of message
} COMMS_MESSAGE_TRAILER;

// [0] = start
// [1] = Type
// [2] [3] = length
// [4] = send to Nicola number
// [5] = sending Nicola
// [6] = message


typedef struct
{
	COMMS_MESSAGE_HEADER	header;
	char	targetNicolaID;			// ID of the Nicola to receive the message
	char	sendingNicolaID;		// ID of the originating Nicola
	char	textMessage[256];
	COMMS_MESSAGE_TRAILER  trailer ;
} TEXT_MESSAGE ;


// a full text message is transmitted by the Nicola in small fragments
// with error checks and re-tries to suit.
typedef struct
{
	COMMS_MESSAGE_HEADER	header;	// 4 bytes
	char	targetNicolaID;			// ID of the Nicola to receive the message
	char	sendingNicolaID;		// ID of the originating Nicola
	char	fragmentNumber ;		// frament number
	char    byteCount ;				// number of bytes in this fragment
	char	textMessageFragment[22];	// FRAGMENT_CHAR_COUNT
	COMMS_MESSAGE_TRAILER  trailer ;	// 2 byte
} TEXT_MESSAGE_FRAGMENT ;


typedef struct
{
	COMMS_MESSAGE_HEADER	header;
	char	targetNicolaID;						// will be send to ALL = 0
	char	thisNicolaID;						// the ID number of the Nicola
	char	thisNicolaName[NICOLA_NAME_SIZE] ;	// its name
	COMMS_MESSAGE_TRAILER trailer ;				// to trigger the FIFO
} IDENTITY_MESSAGE;


#if 0
typedef struct
{
	COMMS_MESSAGE_HEADER	header;
	char					remoteNicolaID;		// the ID number of the Nicola
	char					remoteNicolaName[NICOLA_NAME_SIZE] ;	// its name
} WAKE_UP_MESSAGE;
#endif


/*
 *  User Pico message types
 *
 *  Messages sent to User Pico and passed on as appropriate
 */

#define SEND_CONFIDENCE_BEEP 	('c')
#define SEND_BEACON_BEEP 		('b')
#define SEND_TRANSMIT_STATE 	('t')
#define SEND_RECEIVE_STATE 		('r')

#define SEND_LCD_BACKLIGHT_ON	('y')
#define SEND_LCD_BACKLIGHT_OFF	('Y')

#define SEND_TURN_OFF_RADIO		('Z')

/*
 * Key event definitions
 *
 * Also messages from Keypad Pico
 *
 */


#define KEY_NONE	'@'		//
#define KEY_UP		'H'		// up = 08
#define KEY_DOWN	'D'		// down = 04
#define KEY_RIGHT	'B'		// right = 02
#define KEY_LEFT	'A'		// left = 01

#define KEY_UP_PRESSED		'X'		// up = 08
#define KEY_DOWN_PRESSED	'T'		// down = 04
#define KEY_RIGHT_PRESSED	'R'		// right = 02
#define KEY_LEFT_PRESSED	'Q'		// left = 01

#define KEY_UPLEFT     'I'	// 08 + 01
#define KEY_LEFTRIGHT  'C'  // 02 + 01
#define KEY_DOWNLEFT   'E'  // 04 + 01
#define KEY_DOWNRIGHT  'F'  // 04 + 02

#define KEY_PTT_ON			'0'
#define KEY_PTT_OFF			'1'

#define KEY_BLUETOOTH_PTT	'2'



#define KEY_TIMEOUT1			'a'		/* to turn off backlight */
#define KEY_TIMEOUT2			'b'		/* for text scrolling */
#define KEY_TIMEOUT3			'c'		/* confidence beep */
#define KEY_TIMEOUT4			'd'		/* confidence beep */


/* NOTE WELL - must change User Pico about line 500 if this changes */
#define KEY_AERIAL_EARTHING		'e'		/* not really a KEY but ... */

#define KEY_HEYPHONE_FREQ	'w'		/* not really a KEY but ... */
#define KEY_NICOLA2_FREQ	'x'		/* not really a KEY but ... */
#define KEY_31KHZ_FREQ		'y'		/* not really a KEY but ... */


// Microphone volume management

#define MIN_VOLUME 15
#define MAX_VOLUME 200
#define INCREMENT_VOLUME	25
#define DECREMENT_VOLUME	-25

#define DEFAULT_VOLUME		25

/* for use in LCD_Dispay and elsewhere		*/

#define	ONE_SECOND	(pdMS_TO_TICKS(1000))

/* FLASH operations and Definitions */

//int  qFlashInit();

//void qFlashErase( u8 * Address, u32 ByteCount);

//void FlashErasePage(XQspiPs *QspiPtr, u32 Address, u32 ByteCount);

int CDCardInit();		// in Flash-SDCard.c

void CDFlashRead( u8 *writeToAddress, u32 flashAddress, u32 numberOfBytes);			// in Flash-SDCard.c

void CDFlashWrite( u8 *writeToAddress, u32 flashAddress, u32 numberOfBytes);		// in Flash-SDCard.c

/* define the sector usage in FLASH here  */

#define		LCD_MENU_FLASH_ADDRESS 0x000000

#define SECTOR_SIZE		0x10000
#define NUM_SECTORS		0x100
#define NUM_PAGES		0x10000
#define PAGE_SIZE		512
//#define PAGE_SIZE		256



