
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


/* Initial AudioVolume was 133
 *
 */
#define AudioVolume  133


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


#ifdef OldSlowDownload
void LoadPicos( u32* , u32, u32  );
void LoadUserPico( u32* , u32 , u32 );
#endif


void LoadPicoFast( u32* , u32 , u32  );

int ReadResponse();
int TxSend(XLlFifo *, u32  *, int );



n3z_tonetest		*ZoneTestInstancePtr;

#if OldSlowDownload
u32 UserPicoDownload[] = {
#include "../../../PicoSource/UserPicoDownload.c"
};
#endif


#if 0

u32 DSPPico[] = {
#include "../../../PicoSource/DSPPico.c"
};

#endif

u32 KeypadPico[] = {
#include "../../../PicoSource/KeyPadPico.c"
};


u32 UserPico[] = {
#include "../../../PicoSource/UserPico.c"
};




void PSPLComms_Initialise()
{
    int Status;
    XLlFifo_Config *ConfigData;
    XLlFifo_Config *ConfigPSPL;

    xil_printf("PSPLComms Init\n\r");

    Buffer  = malloc(512 * sizeof(*Buffer));


    ZoneTestInstancePtr = malloc(sizeof (n3z_tonetest));


    Status=n3z_tonetest_Initialize(ZoneTestInstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);
    //printf("Status tonetest Axilite %d\n\r",Status);

    /*Set Audio volume to valid level
       *
       */

    n3z_tonetest_audiovolume_write(ZoneTestInstancePtr, AudioVolume);




    ConfigData=XLlFfio_LookupConfig(DataFIFO_DEV_ID);
    ConfigPSPL=XLlFfio_LookupConfig(PS_PLFIFO_DEV_ID);

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

#ifdef OldSlowDownload

    xil_printf("Send Loader\n\r");
    LoadUserPico(UserPicoDownload, 32, 0x40);
    //sleep(1);
    xil_printf("Send Keypad\n\r");
    LoadPicos(KeypadPico, 0, 0x43);
    //sleep(1);
    xil_printf("Send User Pico\n\r");

    LoadUserPico(UserPico, 32, 0x40);

    //sleep(1);

#endif


#if 1

   	//xil_printf("Send DSP\n\r");
   	//LoadPicoFast(DSPPico, sizeof(DSPPico)/4, 2);

    xil_printf("Send Keypad\n\r");
   	LoadPicoFast(KeypadPico, sizeof(KeypadPico)/4, 2);

   	xil_printf("Send User Pico\n\r");
   	LoadPicoFast(UserPico, sizeof(UserPico)/4, 0);

   	xil_printf("Done Load Pico\n\r");

#endif


    PLTransmitQueue = xQueueCreate( 4,					// max item count
									4 ) ;				// size of each item (max) ) ;

    TextMessageTransmitQueue = xQueueCreate( 2,			// max item count
											 270 ) ;	// size of each item (max) ) ;


	xTaskCreate( PL_Receiver,						/* The function that implements the task. */
				"PL_Rx", 							/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


	xTaskCreate( PL_Transmitter,					/* The function that implements the task. */
				"PL_Tx", 							/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
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

#if 1
			switch ( Buffer[1] )		// check the received key
			{

			case KEY_NONE:
				xil_printf( "NO KEY PRESSED\n\r" );
				break;

			case KEY_UP:		// up = 08
				xil_printf( "KEY UP\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY UP\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY UP");
#endif

				break;

			case KEY_DOWN:		// down = 04
				xil_printf( "KEY DOWN\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY DOWN\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY DOWN");
#endif
				break;

			case KEY_RIGHT:		// right = 02
				xil_printf( "KEY RIGHT\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY RIGHT\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY RIGHT");
#endif

				break;

			case KEY_LEFT:		// left = 01
				xil_printf( "KEY LEFT\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY LEFT\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY LEFT");
#endif

				break;

			case KEY_UPLEFT:		// 08 + 01
				xil_printf( "KEY UP plus LEFT\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY UP plus LEFT\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY UP + LEFT");
#endif

				break;

			case KEY_PTT_ON:		//		'0'
				xil_printf( "PTT ON\n\r" );
				break;

			case KEY_PTT_OFF:		//	'1'
				xil_printf( "PTT OFF\n\r" );
				break;

			case KEY_UP_PRESSED:
				xil_printf( "KEY UP PRESSED\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY UP PRESSED\n\r");
#endif
				break;

			case KEY_DOWN_PRESSED:
				xil_printf( "KEY DOWN PRESSED\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Down PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY DOWN PRESSED");
#endif

				break;

			case KEY_RIGHT_PRESSED:
				xil_printf( "KEY RIGHT PRESSED\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Right PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY RIGHT PRESSED");
#endif

				break;

			case KEY_LEFT_PRESSED:
				xil_printf( "KEY LEFT PRESSED\n\r" );
#ifdef BT_DEBUG
				AddMessageToBluetoothTransmit("  KEY Left PRESSED\n\r");
#endif

#ifdef LCD_DEBUG
				LCD_Write_String( 1, 0 , "KEY LEFT PRESSED");
#endif

				break;


			case KEY_AERIAL_EARTHING:
				xil_printf( "TRANSMIT QUAL %c %c\n\r", Buffer[2], Buffer[3] );
				break;

			default:
			{
				xil_printf( "default not known %x\n\r", Buffer[1] );
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
#endif
    	}
    }
}




static void PL_Transmitter( void *pvParameters )
{
	int		i;
	char	PLMessage[4];
	int		theMessage[4];
	int		txCharacterCount ;


	theMessage[0] = '!' ;
	theMessage[1] = '\r' ;
	theMessage[2] = '\n' ;
	TxSend(&PSPLFifo, theMessage, 3 ) ; //txCharacterCount);

	while ( 1 )
	{
		if ( xQueueReceive( PLTransmitQueue, &PLMessage, portMAX_DELAY ) == pdPASS )
		{
			if ( PLMessage[0] == '*' )
			{
				txCharacterCount = 4;
			}

			for ( i=0; i<txCharacterCount; i++ )
			{
				theMessage[i] = PLMessage[i] ;
			}

			TxSend(&PSPLFifo, theMessage, 4 ) ; //txCharacterCount);
		}

		// vTaskDelay( pdMS_TO_TICKS(250));
	}
}

s32 xsleep(u32 seconds)
{
#if 0
  XTime tEnd, tCur;

  XTime_GetTime(&tCur);
  tEnd  = tCur + (((XTime) seconds) * 1);
  do
  {
    XTime_GetTime(&tCur);
  } while (tCur < tEnd);
#endif

  int i, j;

  //for ( i=0; i<200000; i++) {  for ( j=0; j<20; j++ ) ; }
  for ( i=0; i<100000; i++) {  for ( j=0; j<20; j++ ) ; }
  // this fails = for ( i=0; i<75000; i++) {  for ( j=0; j<20; j++ ) ; }
  // this fails = for ( i=0; i<50000; i++) {  for ( j=0; j<20; j++ ) ; }

  return 0;
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


#ifdef OldSlowDownload

void LoadPicos( u32* LoadArray, u32 offset, u32 type )
{
	int i;
	//u32	Buffer[4] ;
	int Status;

    //xil_printf("Check Download cmd Status %d\n\r",Status);

#define slowload 1


#ifdef slowload
	if ( offset == 0)
	{


	    xil_printf("Send Jump 0\n\r");

	    Buffer[0] = (u32) 13 ;		// null
	    Buffer[1] = (u32) 'Z' ;		// start load
	    Buffer[2] = (u32) 13 ;		// c/r
	    Buffer[3] = (u32) type ;		// load  pico

	    Status=TxSend(&PSPLFifo, Buffer, 4);

		for ( i=offset; i<1024; i++)
		{
		    Buffer[0] = (0x22000>>12) & 0x3F ;  // upper 6 bits
		    Buffer[1] = (0x22000>>6) & 0x3F ;  	// middle 6 bits
		    Buffer[2] = 0x22000 & 0x3F ;  		// lower 6 bits

			//xil_printf( "%x\r\n", UserPico[i]);

		    //xil_printf( "%d - %x %x %x\r\n", i, Buffer[0], Buffer[1], Buffer[2]);


		    if ( Buffer[0] == 80 )
		    {
		    	xil_printf( "Will STOP\r\n");
		    	sleep(5);
		    }

		    Status=TxSend(&PSPLFifo, Buffer, 3);

		    xsleep(100);
		}

	    Buffer[0] = (u32) 'P' ;		// end load
	    Buffer[1] = (u32) 10 ;		// load User pico

	    Status=TxSend(&PSPLFifo, Buffer, 2);

	}

    //xil_printf("Send code\n\r");

    Buffer[0] = (u32) 13 ;		// null
    Buffer[1] = (u32) 'Z' ;		// start load
    Buffer[2] = (u32) 13 ;		// c/r
    Buffer[3] = (u32) type ;		// load  pico

    Status=TxSend(&PSPLFifo, Buffer, 4);

    Buffer[0] = (0x22000>>12) & 0x3F ;  // upper 6 bits
    Buffer[1] = (0x22000>>6) & 0x3F ;  	// middle 6 bits
    Buffer[2] = 0x22000 & 0x3F ;  		// lower 6 bits

	//xil_printf( "%x\r\n", UserPico[i]);

    //xil_printf( "%x %x %x\r\n", Buffer[0], Buffer[1], Buffer[2]);


    if ( Buffer[0] == 80 )
    {
    	xil_printf( "Will STOP\r\n");
    	sleep(5);
    }

    Status=TxSend(&PSPLFifo, Buffer, 3);
#endif

#ifndef slowload
    sleep(4);
#endif

    xil_printf("Send code\n\r");

    Buffer[0] = (u32) 13 ;		// null
    Buffer[1] = (u32) 'Z' ;		// start load
    Buffer[2] = (u32) 13 ;		// c/r
    Buffer[3] = (u32) type ;		// load  pico

#ifdef slowload

	for ( i=1; i<sizeof(UserPico)/4; i++)

#else

	for ( i=0; i<sizeof(UserPico)/4; i++)

#endif
	{

		if ( LoadArray[i] == 0 ) break;

	    Buffer[0] = (LoadArray[i]>>12) & 0x3F ;  // upper 6 bits
	    Buffer[1] = (LoadArray[i]>>6) & 0x3F ;  // middle 6 bits
	    Buffer[2] = LoadArray[i] & 0x3F ;  // lower 6 bits

		//xil_printf( "%x\r\n", UserPico[i]);

	    //xil_printf( "%x %x %x\r\n", Buffer[0], Buffer[1], Buffer[2]);


	    if ( Buffer[0] == 80 )
	    {
	    	xil_printf( "Will STOP\r\n");
	    	sleep(5);
	    }

	    Status=TxSend(&PSPLFifo, Buffer, 3);

	   // xil_printf("Check %d\n\r",Status);

	    xsleep(100);

	}


#ifdef slowload
    Buffer[0] = (u32) 'P' ;		// end load
    Buffer[1] = (u32) 13 ;		// load User pico

    Status=TxSend(&PSPLFifo, Buffer, 2);

    //xil_printf("Check Download End Status %d\n\r",Status);



	    Buffer[0] = (u32) 13 ;		// null
	    Buffer[1] = (u32) 'Z' ;		// start load
	    Buffer[2] = (u32) 13 ;		// c/r
	    Buffer[3] = (u32) type ;		// load  pico

	    Status=TxSend(&PSPLFifo, Buffer, 4);

	    Buffer[0] = (LoadArray[0]>>12) & 0x3F ;  // upper 6 bits
	    Buffer[1] = (LoadArray[0]>>6) & 0x3F ;  // middle 6 bits
	    Buffer[2] = LoadArray[0] & 0x3F ;  // lower 6 bits

		//xil_printf( "%x\r\n", UserPico[i]);

	    //xil_printf( "%x %x %x\r\n", Buffer[0], Buffer[1], Buffer[2]);


	    if ( Buffer[0] == 80 )
	    {
	    	xil_printf( "Will STOP\r\n");
	    	sleep(5);
	    }

	    Status=TxSend(&PSPLFifo, Buffer, 3);

	   // xil_printf("Check %d\n\r",Status);

	    xsleep(100);
#endif

	    Buffer[0] = (u32) 'P' ;		// end load
    	Buffer[1] = (u32) 10 ;		// load User pico

    	Status=TxSend(&PSPLFifo, Buffer, 2);

}


void LoadUserPico( u32* LoadArray, u32 offset, u32 type )
{
	int i;
	//u32	Buffer[4] ;
	int Status;

    //xil_printf("USer Check Download cmd Status %d\n\r",Status);

    Buffer[0] = (u32) 13 ;		// null
    Buffer[1] = (u32) 'Z' ;		// start load
    Buffer[2] = (u32) 13 ;		// c/r
    Buffer[3] = (u32) type ;		// load  pico

    Status=TxSend(&PSPLFifo, Buffer, 4);

    // for the user pico start at 32
	for ( i=offset; i<sizeof(UserPico)/4; i++)
	{

		if ( LoadArray[i] == 0 ) break;

	    Buffer[0] = (LoadArray[i]>>12) & 0x3F ;  // upper 6 bits
	    Buffer[1] = (LoadArray[i]>>6) & 0x3F ;  // middle 6 bits
	    Buffer[2] = LoadArray[i] & 0x3F ;  // lower 6 bits

		//xil_printf( "%x\r\n", UserPico[i]);

	    //xil_printf( "%x %x %x\r\n", Buffer[0], Buffer[1], Buffer[2]);

	    if ( Buffer[0] == 80 )
	    {
	    	xil_printf( "Will STOP\r\n");
	    	sleep(5);
	    }

	    Status=TxSend(&PSPLFifo, Buffer, 3);

	   // xil_printf("Check %d\n\r",Status);

	    xsleep(100);

	}

    Buffer[0] = (u32) 'P' ;		// end load
    Buffer[1] = (u32) 10 ;		// load User pico

    Status=TxSend(&PSPLFifo, Buffer, 2);

    //xil_printf("User Check Download End Status %d\n\r",Status);

}

#endif


int ReadResponse()
{
	int frame_len;
	int i;

 	while (XLlFifo_RxOccupancy(&PSPLFifo) == 0) {
 		//xsleep( 5 );

 		vTaskDelay( pdMS_TO_TICKS( 5 ));
 	}

 	frame_len = XLlFifo_RxGetLen(&PSPLFifo);

 	XLlFifo_Read(&PSPLFifo, Buffer, frame_len);



#if 1
	for ( i=0; i<frame_len/4; i+=1)	// * Buffer is a u32 !
	{
		//if ( Buffer[i] > 0x20 )
		{
			xil_printf( "%x.", Buffer[i]);
		}

	}

	xil_printf( "\r\n");
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
	//int j;

	//xil_printf(" Transmitting Data \r\n", );


	/* Filling the buffer with data */
	for (i=0;i<no_word;i++)
		{
			while ( XLlFifo_iTxVacancy(InstancePtr) == 0){
				vTaskDelay( pdMS_TO_TICKS( 50 ));
			}

			XLlFifo_TxPutWord(InstancePtr,
						      *(SourceAddr+i));

			//xil_printf( "%C", *(SourceAddr+i));
	}

	//xil_printf( "\r\n" );
	/* Start Transmission by writing transmission length into the TLR */
	XLlFifo_iTxSetLen(InstancePtr, (no_word * WORD_SIZE));

	/* Check for Transmission completion */
	while( !(XLlFifo_IsTxDone(InstancePtr)) ){

	}

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
	//u32 numberofsamples;

	//do {
	//numberofsamples=XLlFifo_RxOccupancy(&DataFifo);
	//print("Hello Data World\n\r");
	//printf("Receive Data Occupancy is %d\r\n",numberofsamples);
	//} while ( numberofsamples == 0);


	//xil_printf(" Receiving data ....\n\r");
	/* Read Recieve Length */
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



