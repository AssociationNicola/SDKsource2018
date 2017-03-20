/*
    FreeRTOS V9.0.0 - Copyright (C) 2016 Real Time Engineers Ltd.
    All rights reserved

    VISIT http://www.FreeRTOS.org TO ENSURE YOU ARE USING THE LATEST VERSION.

    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation >>>> AND MODIFIED BY <<<< the FreeRTOS exception.

    ***************************************************************************
    >>!   NOTE: The modification to the GPL is included to allow you to     !<<
    >>!   distribute a combined work that includes FreeRTOS without being   !<<
    >>!   obliged to provide the source code for proprietary components     !<<
    >>!   outside of the FreeRTOS kernel.                                   !<<
    ***************************************************************************

    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE.  Full license text is available on the following
    link: http://www.freertos.org/a00114.html

    ***************************************************************************
     *                                                                       *
     *    FreeRTOS provides completely free yet professionally developed,    *
     *    robust, strictly quality controlled, supported, and cross          *
     *    platform software that is more than just the market leader, it     *
     *    is the industry's de facto standard.                               *
     *                                                                       *
     *    Help yourself get started quickly while simultaneously helping     *
     *    to support the FreeRTOS project by purchasing a FreeRTOS           *
     *    tutorial book, reference manual, or both:                          *
     *    http://www.FreeRTOS.org/Documentation                              *
     *                                                                       *
    ***************************************************************************

    http://www.FreeRTOS.org/FAQHelp.html - Having a problem?  Start by reading
    the FAQ page "My application does not run, what could be wrong?".  Have you
    defined configASSERT()?

    http://www.FreeRTOS.org/support - In return for receiving this top quality
    embedded software for free we request you assist our global community by
    participating in the support forum.

    http://www.FreeRTOS.org/training - Investing in training allows your team to
    be as productive as possible as early as possible.  Now you can receive
    FreeRTOS training directly from Richard Barry, CEO of Real Time Engineers
    Ltd, and the world's leading authority on the world's leading RTOS.

    http://www.FreeRTOS.org/plus - A selection of FreeRTOS ecosystem products,
    including FreeRTOS+Trace - an indispensable productivity tool, a DOS
    compatible FAT file system, and our tiny thread aware UDP/IP stack.

    http://www.FreeRTOS.org/labs - Where new FreeRTOS products go to incubate.
    Come and try FreeRTOS+TCP, our new open source TCP/IP stack for FreeRTOS.

    http://www.OpenRTOS.com - Real Time Engineers ltd. license FreeRTOS to High
    Integrity Systems ltd. to sell under the OpenRTOS brand.  Low cost OpenRTOS
    licenses offer ticketed support, indemnification and commercial middleware.

    http://www.SafeRTOS.com - High Integrity Systems also provide a safety
    engineered and independently SIL3 certified version for use in safety and
    mission critical applications that require provable dependability.

    1 tab == 4 spaces!
*/

/*****************************************************************************
** File Name : DebugInterface.c
** Overview : for debugging the streaming messages during transmit/receive
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	March 2017	PA/GD		Original Version

** All Rights Reserved(c) Association Nicola, Graham Naylor, Pete Allwright



*****************************************************************************/



/* Standard includes. */
#include <stdio.h>
#include <limits.h>

#include <ps7_init.h>

/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"


/* Xilinx includes. */
#include "platform.h"
#include "xparameters.h"
#include "xscutimer.h"
#include "xscugic.h"
#include "xil_exception.h"

#include "xuartps_hw.h"


#include "xparameters.h"
#include "n3z_tonetest.h"

#include "xstatus.h"



#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"

#include "NicolaTypes.h"

#define WORD_SIZE 4            /* Size of words in bytes */
#define DataFIFO_DEV_ID           XPAR_AXI_FIFO_0_DEVICE_ID
#define PS_PLFIFO_DEV_ID          XPAR_AXI_FIFO_1_DEVICE_ID
#define UART_BASEADDR		XPAR_XUARTPS_0_BASEADDR
#define TEST_BUFFER_SIZE 32		/*for Uart buffers*/

extern n3z_tonetest		*ToneTestInstancePtr ;		/* in PSPLComms.c	*/
extern XLlFifo 			DataFifo;					/* in PSPLComms.c	*/


static void Debuging_Main( void *pvParameters );
static void GetMsgFromUART( char *, int ) ;


QueueHandle_t	DebugControlQueue ;


// static u32 Buffer[512];		/* if storing to write to flash */




void DebugingGraham_Startup()
{
	DebugControlQueue = xQueueCreate( 2,					// max item count
									  2 ) ;					// size of each item (max) ) ;

	/* Start the tasks as described in the comments at the top of this file. */
						/* The task handle is not required, so NULL is passed. */

	xTaskCreate( Debuging_Main,							/* The function that implements the task. */
				"Debug Main", 						/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


}


static void Debuging_Main( void *pvParameters )
{
	XLlFifo_Config *ConfigData;
	int Status;
    int NumberOfSamples;
    int NumberOfSamplesRead;
    u32 ReceiveLength;
    u32 DataStreamSpec;
    int Value;
    u32 DataStreamID ;
    u32 debuggingOn = 0;
    char theMessage[2];
    char inBuffer[10] ;
	u32 RxWord;
	u32 *receiveBuffer = NULL;
	u32 *receiveBufferStart = NULL;


	vTaskDelay( pdMS_TO_TICKS(1000)); /* wait for PLPS comms to initialise (needs better interface) */

	while ( ToneTestInstancePtr == NULL )
	{
		vTaskDelay( pdMS_TO_TICKS(1000)); /* wait for PLPS comms to initialise (needs better interface) */
	}


	//ZoneTestInstancePtr = pvPortMalloc(sizeof (n3z_tonetest));

	//Status=n3z_tonetest_Initialize(ZoneTestInstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);

	//ConfigData=XLlFfio_LookupConfig(DataFIFO_DEV_ID);
	//Status=XLlFifo_CfgInitialize(&DataFifo,ConfigData,ConfigData->BaseAddress);

    //XLlFifo_Initialize( &DataFifo, ConfigData->BaseAddress);

    //XLlFifo_IntClear(&DataFifo,0xffffffff);

    n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);

    /* collect stream ID - can be 0 through 3 */
    //DataStreamID = 0 * 0x10000 ;		// 65536;

    //NumberOfSamples = 10 ;
    //DataStreamSpec = DataStreamID + NumberOfSamples ;

    //n3z_tonetest_values2recover_write(ZoneTestInstancePtr, DataStreamSpec);

    receiveBufferStart = pvPortMalloc( 2000 * sizeof(u32)) ;

	while ( 1 )
	{

		if ( debuggingOn )
		{
			//while ( XLlFifo_RxOccupancy(&DataFifo) )
			while (NumberOfSamplesRead < NumberOfSamples)
			{
				while ( XLlFifo_RxOccupancy(&DataFifo) && (NumberOfSamplesRead < NumberOfSamples) )
				//if ( XLlFifo_RxOccupancy(&DataFifo) )
				{
					RxWord = XLlFifo_RxGetWord(&DataFifo);
					//xil_printf( "Read %d\r\n", RxWord ) ;
					NumberOfSamplesRead += 1 ;
					*receiveBuffer++ = RxWord ;
				}

				// how often does the Pico send data?  Change delay to suit.

				vTaskDelay( pdMS_TO_TICKS(5)); /* wait for data to appear - short time in long run? */

				// Could write to flash at this point for larger volumes of data

			}
		}
		else
		{
			vTaskDelay( pdMS_TO_TICKS(1000));
		}


    	if ( xQueueReceive( DebugControlQueue, &theMessage, 0 ) == pdPASS )
    	{
    		if ( theMessage[0] ==  2 )		/* start debugging */
			{
    			debuggingOn = 1 ;		/* debugging is ON */

    			/* get channel and number of samples */

    			xil_printf( "ENTER CHANNEL NUMBER (0 - 3): ");

    			GetMsgFromUART( inBuffer, 3);	/* read only 1 character */

    		    /* collect stream ID - can be 0 through 3 */

    		    /* convert to channel */

    		    DataStreamID = (u32) (inBuffer[0]&0x0F) << 16 ;


    			xil_printf( "\n\rENTER NUMBER OF SAMPLES:  ");

    			GetMsgFromUART( inBuffer, sizeof(inBuffer));

    			NumberOfSamples = (int) atoi( inBuffer ) ;
    			NumberOfSamplesRead = 0;

    			if ( NumberOfSamples > 2000 )
    			{
    				NumberOfSamples = 2000 ;
    			}

    			/* tell pico to start sending values */

    		    DataStreamSpec = DataStreamID + NumberOfSamples ;

    		    n3z_tonetest_values2recover_write(ToneTestInstancePtr, DataStreamSpec);


    		    //receiveBufferStart = pvPortMalloc( NumberOfSamples * sizeof(u32)) ;

    		    receiveBuffer = receiveBufferStart;

			}
    		else
    		{
    			debuggingOn = 0 ;

    			/* do whatever with the samples read */

    			//vPortFree( receiveBuffer ) ;
    		}
    	}

		if ( debuggingOn )
		{
			if (NumberOfSamplesRead > 0)
			{
				int i;

				receiveBuffer = receiveBufferStart;

				xil_printf("%d SAMPLES READ\n\r", NumberOfSamplesRead );


				for ( i=0; i < NumberOfSamplesRead; i++ )
				{
					xil_printf("%d\n\r", *receiveBuffer++ );
				}

				xil_printf("DONE\n\r" );

				if ( NumberOfSamplesRead >= NumberOfSamples )
				{
					debuggingOn = 0 ;		/* stop collecting data */
					//vPortFree( receiveBufferStart ) ;

				    n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);

				}
			}
		}

	}

	//ReceiveLength=Rx2Uart(&DataFifo);

}


/* ***************************
* Version of RXread to print to Uart and not save to buffer
* */

int Rx2Uart (XLlFifo *InstancePtr)
{

	int i;
	int Status;
	u32 RxWord;
	static u32 ReceiveLength;

	xil_printf(" Receiving data ....\n\r");
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
		xil_printf("%d\n\r", RxWord);
	}

	Status = XLlFifo_IsRxDone(InstancePtr);
	if(Status != TRUE){
		xil_printf("Failing in receive complete ... \r\n");
		return XST_FAILURE;
	}

	return ReceiveLength;		/* Change to return a useful number*/
}


static void GetMsgFromUART( char *MessageBuffer, int MaxCharCount )
{
	int 	charCount = 0;
	char	RecvChar ;

#if 0
    u32 CntrlRegister;

    CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

    	/* Enable TX and RX for the device */
    XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
    				((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
    				 XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));

#endif


	do
	{
		//while (uart_ReceiveByteCheck( XPAR_PS7_UART_0_BASEADDR ) == 0)  /* wait for character */
		//{
		//	vTaskDelay( pdMS_TO_TICKS(100));
		//}

		//RecvChar = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);

		//uart_ReceiveByte( XPAR_PS7_UART_0_BASEADDR, &RecvChar ) ;

		while ( uart_ReceiveByte( XPAR_PS7_UART_0_BASEADDR, (u8 *) &RecvChar ) == 0 )
		{
			vTaskDelay( pdMS_TO_TICKS(100));
		}

		xil_printf( "%c", RecvChar) ;

		if (('0' <= RecvChar) && ('9' >= RecvChar))
		{
			MessageBuffer[charCount++] = RecvChar ;
			MessageBuffer[charCount] = 0 ;
		}
		else
		if ( RecvChar == 8 /* backspace */ )
		{
			if ( charCount )
			{
				charCount -= 1;
				MessageBuffer[charCount] = 0 ;
				xil_printf( "\b \b" );
			}
		}

	} while ( (RecvChar!=13) && (charCount < MaxCharCount-1) ) ; /*until CR character*/


}
