
/*****************************************************************************
** File Name : PSPLComms.c
** Overview : provides the PS to PL communications interface and management
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	Nov 2016	PA		Original Version

** All Rights Reserved(c) Association Nicola, Graham Naylor, Pete Allwright



*****************************************************************************/



#include <stdio.h>


#include "platform.h"
#include "xil_printf.h"
#include "xuartps_hw.h"


#include "xparameters.h"
#include "n3z_tonetest.h"

#include "xstatus.h"



#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"

#include <stdlib.h>

#include "xil_cache.h"

/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "timers.h"
#include "xgpiops.h"

#include "NicolaTypes.h"


// comment out next lines to hide I/O messages to/from User Pico

#ifdef DEBUG_CODE
#define RECEIVE_MESSAGE_DEBUG
//#define SEND_MESSAGE_DEBUG

#define RECEIVED_MESSAGE_SERIAL_DEBUG

#endif



/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */

#define WORD_SIZE 4            /* Size of words in bytes */
#define DataFIFO_DEV_ID           XPAR_AXI_FIFO_0_DEVICE_ID
#define PS_PLFIFO_DEV_ID          XPAR_AXI_FIFO_1_DEVICE_ID
#define UART_BASEADDR		XPAR_XUARTPS_0_BASEADDR
#define TEST_BUFFER_SIZE 32		/*for Uart buffers*/


/* Initial AudioVolume was 133, but 12 is minimum volume
 *Changed April 2017 as speaker/amp is overloaded
 */

/* This sets the radio state, lowest bits are the frequency. 1 is Heyphone */
#define RadioState 1


//#define BT_DEBUG

//#define LCD_DEBUG


/************************** Variable Definitions *****************************/

/*
 * The following are declared globally so they are zeroed and so they are
 * easily accessible from a debugger
 */

#ifdef LCD_DEBUG
extern void LCD_Write_String( int , int , char *);
#endif

 /* Device instance definitions
 */

extern QueueHandle_t	BluegigaTransmitQueue ;	/* in Bluetooth.c */
extern QueueHandle_t	KeysReceivedQueue ;		/* in LCD_Display.c */

QueueHandle_t	PLTransmitQueue ;
QueueHandle_t	TextMessageTransmitQueue ;


XLlFifo DataFifo;
XLlFifo PSPLFifo;

u32 *Buffer;


static void PL_Receiver( void * );
static void PL_Transmitter( void *pvParameters );


void LoadPicoFast( u32* , u32 , u32  );

int ReadResponse();
int TxSend(XLlFifo *, u32  *, int );


n3z_tonetest		*ToneTestInstancePtr;


#if 0

u32 TDPico[] = {
#include "../../../PicoSource/ToneDetectPico.c"
};

#endif

#if 0

u32 DSPPico[] = {
#include "../../../PicoSource/DSPPico.c"
};

#endif

#if 0
u32 KeypadPico[] = {
#include "../../../PicoSource/KeyPadPico.c"
};
#endif

#if 0
u32 UserPico[] = {
#include "../../../PicoSource/UserPico.c"
};
#endif


void PSPLComms_Initialise()
{
    int Status;
    XLlFifo_Config *ConfigData;
    XLlFifo_Config *ConfigPSPL;

    xil_printf("PSPLComms Init\n\r");

    Buffer  = pvPortMalloc(512 * sizeof(*Buffer));


    ToneTestInstancePtr = pvPortMalloc(sizeof (n3z_tonetest));


    Status=n3z_tonetest_Initialize(ToneTestInstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);



    ConfigData=XLlFfio_LookupConfig(DataFIFO_DEV_ID);		// used in DebugInterface for send/receive debug info
    ConfigPSPL=XLlFfio_LookupConfig(PS_PLFIFO_DEV_ID);		// PS to PL e.g. key commands

    Status=XLlFifo_CfgInitialize(&DataFifo,ConfigData,ConfigData->BaseAddress);

    //printf("Status Data Fifo%d\n\r",Status);
    //printf("DataFifo pointer: %d\n\r", DataFifo);

    Status=XLlFifo_CfgInitialize(&PSPLFifo,ConfigPSPL,ConfigPSPL->BaseAddress);

    //printf("Status PSPL Fifo%d\n\r",Status);

    XLlFifo_Initialize( &DataFifo, ConfigData->BaseAddress);
    XLlFifo_Initialize( &PSPLFifo, ConfigPSPL->BaseAddress);

    XLlFifo_IntClear(&DataFifo,0xffffffff);
    XLlFifo_IntClear(&PSPLFifo,0xffffffff);

    Status = XLlFifo_Status(&PSPLFifo);

#if 0
	/* PicoNo=0; %User=0, DSP=1, KP=2,TD=3 */

   	xil_printf("Send DSP\n\r");
   	LoadPicoFast(DSPPico, sizeof(DSPPico)/4, 1);

   	xil_printf("Send TD Pico\n\r");
   	LoadPicoFast(TDPico, sizeof(TDPico)/4, 3);

    xil_printf("Send Keypad\n\r");
   	LoadPicoFast(KeypadPico, sizeof(KeypadPico)/4, 2);

   	xil_printf("Send User Pico\n\r");
   	LoadPicoFast(UserPico, sizeof(UserPico)/4, 0);


#endif

#if 0
   	xil_printf("Send TD Pico\n\r");
   	LoadPicoFast(TDPico, sizeof(TDPico)/4, 3);

    xil_printf("Send Keypad\n\r");
   	LoadPicoFast(KeypadPico, sizeof(KeypadPico)/4, 2);

   	xil_printf("Send User Pico\n\r");
   	LoadPicoFast(UserPico, sizeof(UserPico)/4, 0);
#endif



    PLTransmitQueue = xQueueCreate( 4,					// max item count
    								PL_MESSAGE_MAX ) ;				// size of each item (max) ) ;

    TextMessageTransmitQueue = xQueueCreate( 2,			// max item count
											 270 ) ;	// size of each item (max) ) ;


	xTaskCreate( PL_Receiver,						/* The function that implements the task. */
				"PL_Rx", 							/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 4, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


	xTaskCreate( PL_Transmitter,					/* The function that implements the task. */
				"PL_Tx", 							/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 3, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


}


#ifdef BT_DEBUG
static void AddMessageToBluetoothTransmit( char *theMessage  )
{
	while ( xQueueSendToBack( BluegigaTransmitQueue, theMessage, 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS(5));
	}
}
#endif


void intToHexChars( u32 value, char *s )
{
	int second = (value >> 4) & 0x0F ;

	if ( second < 10 ) *s = '0' + second ;
	else *s = 'A' + ( second - 10 );
	s++;
	second = value & 0x0F ;
	if ( second < 10 ) *s = '0' + second ;
	else *s = 'A' + ( second - 10 );
}


static void PL_Receiver( void *pvParameters )
{
	char	KeyMessage[4];

    while ( 1 ){

    	ReadResponse();			// again

    	if ( Buffer[0] == '&' )		// indicates key sent
    	{
			KeyMessage[0] = Buffer[1] & 0xFF;
			KeyMessage[1] = Buffer[2] & 0xFF;
			KeyMessage[2] = Buffer[3] & 0xFF;

			while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
    	}
    	else
		if ( Buffer[0] == '+' )		// message from Tone Pico
		{
			KeyMessage[0] = Buffer[0] & 0xFF;
			KeyMessage[1] = Buffer[1] & 0xFF;
			KeyMessage[2] = Buffer[3] & 0xFF;

			while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
		}

#ifdef RECEIVE_MESSAGE_DEBUG

    	if ( Buffer[0] == 0x0F )
    	{
    		u32 statusReg = n3z_tonetest_plstatus_read(&PSPLFifo);


    		xil_printf( "User Pico reports data in buffer %X\r\n", statusReg);

    	}
    	if ( Buffer[0] == '&' )		// indicates key sent
    	{
			switch ( Buffer[1] )		// check the received key
			{
			case KEY_NONE:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "NO KEY PRESSED\n\r" );
#endif
				break;

			case KEY_UP:		// up = 08
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY UP\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY UP\n\r");
#endif

#ifdef LCD_DEBUG

				LCD_Write_String( 1, 0 , "KEY UP");
#endif

				break;

			case KEY_DOWN:		// down = 04
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY DOWN\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY DOWN\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY DOWN");
#endif
				break;

			case KEY_RIGHT:		// right = 02
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY RIGHT\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY RIGHT\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY RIGHT");
#endif

				break;

			case KEY_LEFT:		// left = 01
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY LEFT\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY LEFT\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY LEFT");
#endif

				break;

			case KEY_UPLEFT:		// 08 + 01
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY UP plus LEFT\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY UP plus LEFT\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY UP + LEFT");
#endif

				break;

			case KEY_PTT_ON:		//		'0'
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "PTT ON\n\r" );
#endif
				break;

			case KEY_PTT_OFF:		//	'1'
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "PTT OFF\n\r" );
#endif
				break;

			case KEY_UP_PRESSED:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY UP PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY UP PRESSED\n\r");
#endif
				break;

			case KEY_DOWN_PRESSED:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY DOWN PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Down PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY DOWN PRESSED");
#endif

				break;

			case KEY_RIGHT_PRESSED:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY RIGHT PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Right PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY RIGHT PRESSED");
#endif

				break;

			case KEY_LEFT_PRESSED:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY LEFT PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Left PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY LEFT PRESSED");
#endif

				break;

			case KEY_DOWNLEFT:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY DOWN & LEFT PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Down&Left PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY DOWN & LEFT PRESSED");
#endif

				break;

			case KEY_UPRIGHT:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY UP & RIGHT PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Up&Right PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY UP and RIGHT PRESSED");
#endif

				break;


			case KEY_UPDOWN:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY UP & DOWN PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Up&Down PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY UP and DOWN PRESSED");
#endif

				break;


			case KEY_DOWNRIGHT:
#ifdef RECEIVED_MESSAGE_SERIAL_DEBUG
				xil_printf( "KEY DOWN & RIGHT PRESSED\n\r" );
#endif

#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Down&Right PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY DOWN & RIGHT PRESSED");
#endif

				break;

			case KEY_AERIAL_EARTHING:
				//xil_printf( "TRANSMIT QUAL %c %c\n\r", Buffer[2], Buffer[3] );
				break;

			case KEY_HEYPHONE_FREQ:			//	'w'
				xil_printf( "HEYPhone frequency\n\r" );
				break;

			case KEY_NICOLA2_FREQ:			//	'x'
				xil_printf( "Nicola 2 frequency\n\r" );
				break;

			case KEY_31KHZ_FREQ:			//	'y'
				xil_printf( "31kHz frequency\n\r" );
				break;

			case KEY_USER_WDOG_REPLY:			//	'p'
#ifdef RECEIVE_MESSAGE_DEBUG
				xil_printf( "User Watchdog Reply\n\r" );
#endif
				break;

			case KEY_KEYP_WDOG_REPLY:			//	'q'
#ifdef RECEIVE_MESSAGE_DEBUG
				xil_printf( "Keypad Watchdog Reply\n\r" );
#endif
				break;


			default:
				{
					//xil_printf( "default not known %x\n\r", Buffer[1] );
	#ifdef BT_DEBUG
					{
						char *msg = "     =    default not known\r\n" ;
						intToHexChars( Buffer[1], &msg[5]);
						AddMessageToBluetoothTransmit(msg);
					}
	#endif


	#ifdef LCD_DEBUG
					{
						char *msg = "x    not known" ;
						intToHexChars( Buffer[1], &msg[1]);
						LCD_Write_String( 1, 0, msg );
					}
	#endif

					break;
				}
			}
    	}

    	else
        if ( Buffer[0] == '+' )		// message from Tone Detect Pico
    	{
			switch ( Buffer[1] )		// check the received msg
			{
				case '0':
					xil_printf( "TONE OFF from Pico\n\r" );
					break;

				case '1':
					xil_printf( "TONE ON from Pico\n\r" );
					break;

				case '2':
					xil_printf( "SPEAKER DETECT DISABLED\n\r" );
					break;
			}

    	}
    	else
        if ( Buffer[0] == '?' )		// message from Tone Detect Pico
    	{
        	xil_printf( "\r\n\nUser reports unknown\r\n\n") ;
    	}

#endif
    }
}


static void PL_Transmitter( void *pvParameters )
{
	int		i;
	char	PLMessage[PL_MESSAGE_MAX];
	u32		theMessage[PL_MESSAGE_MAX];
	int		txCharacterCount ;

	theMessage[0] = '!' ;
	theMessage[1] = '\r' ;
	theMessage[2] = '\n' ;
	TxSend(&PSPLFifo, theMessage, 3 ) ; //txCharacterCount);

	while ( 1 )
	{
		if ( xQueueReceive( PLTransmitQueue, &PLMessage, portMAX_DELAY ) == pdPASS )
		{
#ifdef SEND_MESSAGE_DEBUG
			xil_printf( "SEND %X %X %X %X %X %X\r\n",
					PLMessage[0], PLMessage[1], PLMessage[2], PLMessage[3], PLMessage[4], PLMessage[5] ) ;
#endif


			txCharacterCount = 0;

			for ( i=0; i<PL_MESSAGE_MAX; i++)
			{
				txCharacterCount += 1 ;
				if ( PLMessage[i] == '\n' )
					break;
			}

			for ( i=0; i<txCharacterCount; i++ )
			{
				theMessage[i] = PLMessage[i] ;
			}

			TxSend(&PSPLFifo, theMessage, txCharacterCount);
		}

		// vTaskDelay( pdMS_TO_TICKS(250));
	}
}



void LoadPicoFast( u32* LoadArray, u32 numberOfInstructions, u32 PicoType )
{
	int i;
	static u32 InstructionVal;

	/*
	Now send Pico instructions to Datafifo (not quite 2048 - keep a few spare locations in fifo!??)
	*/

	for ( i=0; i < 2040; i++)
	{

		//InstructionVal=0;


		/* PicoNo=0; %User=0, DSP=1, KP=2,TD=3 */

		/* p = upper 3 bits is Pico number */
		/* i = middle 18 bits are the instruction */
		/* a = lower 11 bits are the address in the pico */

		/* pppi iiii iiii iiii iiii iaaa aaaa aaaa */

		InstructionVal = (PicoType << 29) |
					     (*LoadArray << 11) |
						 (i) ;


		LoadArray++;

		//xil_printf("You sent %x \n\r", InstructionVal);


	  while ( XLlFifo_iTxVacancy(&DataFifo) == 0 ){
	  }

	  XLlFifo_TxPutWord(&DataFifo,InstructionVal);

	}

	XLlFifo_iTxSetLen(&DataFifo, 8160);
	while( !(XLlFifo_IsTxDone(&DataFifo)) )
	{
	}

}


int ReadResponse()
{
	int frame_len;

 	while (XLlFifo_RxOccupancy(&PSPLFifo) == 0) {

 		vTaskDelay( pdMS_TO_TICKS( 5 ));
 	}

 	frame_len = XLlFifo_RxGetLen(&PSPLFifo);

 	XLlFifo_Read(&PSPLFifo, Buffer, frame_len);



//#ifdef RECEIVE_MESSAGE_DEBUG
#if 0
 	//if ( Buffer[i] == 0x0D )
 	{
 		//xil_printf( "EMPTY\r\n", Buffer[i]);
 	}
 	//else
	for ( i=0; i<frame_len/4; i+=1)	// * Buffer is a u32 !
	{
		//if ( Buffer[i] > 0x20 )
		{
			xil_printf( "%x.", Buffer[i]);
		}

	}

 	//if ( Buffer[i] != 0x0D )
 	{
 		xil_printf( "  ab\r\n");
 	}

#endif


	return 0;
}




/*****************************************************************************/
/*
*
* TxSend routine, It will send the requested amount of data at the
* specified addr.
*
* @param	InstancePtr is a pointer to the instance of the
*		XLlFifo component.
*
* @param	SourceAddr is the address where the FIFO stars writing
*
* @return	-XST_SUCCESS to indicate success
*		-XST_FAILURE to indicate failure
*
* @note		None
*
******************************************************************************/
int TxSend(XLlFifo *InstancePtr, u32  *SourceAddr, int no_word)
{
	int i;
	int errorCount = 0;
	u32 *baseAddress = (u32 *) InstancePtr->BaseAddress ;
	//u32 *dataCount = (u32 *) InstancePtr->BaseAddress + 0x0C;
	//xil_printf( "\r\n" ) ;
	/* Filling the buffer with data */
	for (i=0;i<no_word;i++)
	{
		while ( XLlFifo_iTxVacancy(InstancePtr) == 0){
		//if ( XLlFifo_iTxVacancy(InstancePtr) < 32){
			//do
			//{
				vTaskDelay( pdMS_TO_TICKS( 25 ));			// 8 words per millisecond so 25 msecs = 200 samples
			//} while ( XLlFifo_iTxVacancy(InstancePtr) < 512);
		}

		XLlFifo_TxPutWord(InstancePtr,
						  *(SourceAddr+i));

		//xil_printf( "%X\r\n", *(SourceAddr+i) ) ;

		//xil_printf( "ADD %X (%d) status %X\r\n", *dataCount, i, (u32) *baseAddress);
	}

	/* Start Transmission by writing transmission length into the TLR */

	XLlFifo_iTxSetLen(InstancePtr, (no_word * WORD_SIZE));

	//xil_printf( "TX %X status=%X\r\n", *dataCount, (u32) *baseAddress);

	/* Check for Transmission completion */
	while( !(XLlFifo_IsTxDone(InstancePtr)) ){
		if (errorCount++ == 20 )
		{
			xil_printf( "try send to user again %X occ=%d\r\n", (u32) *baseAddress, XLlFifo_iTxVacancy(InstancePtr) );

			errorCount = 0;
		}
		vTaskDelay( pdMS_TO_TICKS( 5));

		//xil_printf( "TX %X status=%X\r\n", *dataCount, (u32) *baseAddress);

	}

	//xil_printf( "After TX %X status=%X\r\n", *dataCount, (u32) *baseAddress);


	/* Transmission Complete */
	return XST_SUCCESS;
}


/*****************************************************************************/
/*
*
* RxReceive routine.It will receive the data from the FIFO.
*
* @param	InstancePtr is a pointer to the instance of the
*		XLlFifo instance.
*
* @param	DestinationAddr is the address where to copy the received data.
*
* @return	-XST_SUCCESS to indicate success
*		-XST_FAILURE to indicate failure
*
* @note		None
*
******************************************************************************/
int RxReceive (XLlFifo *InstancePtr, u32* DestinationAddr)
{

	int i;
	int Status;
	u32 RxWord;
	static u32 ReceiveLength;

	//xil_printf(" Receiving data ....\n\r");
	/* Read Receive Length */
	ReceiveLength = (XLlFifo_iRxGetLen(InstancePtr))/WORD_SIZE;
	xil_printf("Receive length = %d \n\r", ReceiveLength );
	/* Start Receiving */

	for ( i=0; i < ReceiveLength; i++){
		RxWord = 0;
		RxWord = XLlFifo_RxGetWord(InstancePtr);

		if(XLlFifo_iRxOccupancy(InstancePtr)){
			RxWord = XLlFifo_RxGetWord(InstancePtr);
		}
		*(DestinationAddr+i) = RxWord;
	}

	Status = XLlFifo_IsRxDone(InstancePtr);
	if(Status != TRUE){
		xil_printf("Failing in receive complete ... \r\n");
		return XST_FAILURE;
	}

	return ReceiveLength;		/* Change to return a useful number*/
}



