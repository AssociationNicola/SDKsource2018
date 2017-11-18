/*****************************************************************************
** File Name : ConsoleManager.c
** Overview : Handles the RS232 serial interface when accessible
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


#include "NicolaTypes.h"

extern QueueHandle_t	MessageFromRemoteNicolasQueue ;		// in TextMessaging.c
extern QueueHandle_t	BluegigaTransmitQueue ;
extern QueueHandle_t	KeysReceivedQueue ;

QueueHandle_t	consoleTransmitQueue ;
QueueHandle_t	consoleReceiveQueue ;

static void consoleMain( void *pvParameters );
void transmitToConsole( void *pvParameters );


u8   uart_ReceiveByteCheck( u32 uartAddress ) ;
u8   uart_ReceiveByte( u32 uartAddress, u8 *receivedByte );
void uart_SendByte(u32 BaseAddress, u8 Data);



void ConsoleStartup()
{
	consoleTransmitQueue = xQueueCreate( 4,						// max item count
										MAX_STRING_LENGTH ) ;	// size of each item (max) ) ;


	consoleReceiveQueue = xQueueCreate( 4,						// max item count
										MAX_STRING_LENGTH ) ;	// size of each item (max) ) ;

	/* Start the tasks as described in the comments at the top of this file. */

	xTaskCreate( transmitToConsole,					/* The function that implements the task. */
				"ConsoleTask1", 					/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */

	xTaskCreate( consoleMain,							/* The function that implements the task. */
				"Console Main", 							/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


}

static void consoleMain( void *pvParameters )
{
	int			i;
	char 		theMessage[MAX_STRING_LENGTH];
	TEXT_MESSAGE	theSendMessage;
	IDENTITY_MESSAGE	*IdentityMessage = (IDENTITY_MESSAGE *) &theSendMessage;
	char	KeyMessage[2];

    while ( 1 )
    {

    	/* check for any incoming messages and process 	*/

    	if ( xQueueReceive( consoleReceiveQueue, &theMessage, portMAX_DELAY ) == pdPASS )
    	{
			if ( strncmp( theMessage, "T:", 2) == 0 )		/* simulate TEXT message */
															/* T:NNNNN */
															/*   NNNNN is freeform message */
			{
				i = strlen( theMessage);
				theSendMessage.header.StartCharacter = '#';
				theSendMessage.header.MessageType = TEXT_MESSAGE_RECEIVED;	// simulate received message
				theSendMessage.header.MessageLength[0] = 0x80;;
				theSendMessage.header.MessageLength[1] = 2 + i-2; // remove N3X:

				theSendMessage.targetNicolaID = thisNicolaSettings.thisNicolaID + '@';
				theSendMessage.sendingNicolaID = theMessage[2] ; //'B' ;

				strcpy( theSendMessage.textMessage, &theMessage[3]);

				while ( xQueueSendToBack( MessageFromRemoteNicolasQueue, &theSendMessage, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
				while ( xQueueSendToBack( consoleTransmitQueue, theMessage, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
			}
			else
			if ( strncmp( theMessage, "R:", 2) == 0 )		/* simulate remote connection message */
															/* R:lNNNNN */
															/*   l = remote ID A=; B=2; C=3 etc */
															/*    NNNNN is freeform name no spaces */
			{
				IdentityMessage->header.StartCharacter = '#';
				IdentityMessage->header.MessageType = IDENTITY_MESSAGE_TYPE;	// simulate received message
				IdentityMessage->header.MessageLength[0] = 0x80;;
				IdentityMessage->header.MessageLength[1] = 1 + NICOLA_NAME_SIZE; // remove N3X:

				IdentityMessage->thisNicolaID = theMessage[2];
				strcpy( IdentityMessage->thisNicolaName, &theMessage[3] );

				while ( xQueueSendToBack( BluegigaTransmitQueue, IdentityMessage, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
			}
			else
			if ( strncmp( theMessage, "GV", 2) == 0 )
			{
				while ( xQueueSendToBack( consoleTransmitQueue, GetVersionString(), 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
			}
#if 0
			else
			if ( strncmp( theMessage, "K", 1) == 0 )
			{

				/* there seems to be a problem with strcmp - appeared to crash the ARM */

				if ( strncmp( theMessage, "KX", 2) == 0 )		/* Up and Left together */
				{
					KeyMessage[0] = KEY_UPLEFT;
				}
				else
				if ( strncmp( theMessage, "KD", 2) == 0 )
				{
					KeyMessage[0] = KEY_DOWN;

				}
				else
				if ( strncmp( theMessage, "KU", 2) == 0 )
				{
					KeyMessage[0] = KEY_UP;
				}
				else
				if ( strncmp( theMessage, "KR", 2) == 0 )
				{
					KeyMessage[0] = KEY_RIGHT;
				}
				else
				if ( strncmp( theMessage, "KL", 2) == 0 )
				{
					KeyMessage[0] = KEY_LEFT;
				}
			}
			else
			if ( strncmp( theMessage, "PTT+", 4) == 0 )
			{
				KeyMessage[0] = KEY_PTT_ON;
				KeyMessage[1] = TRUE;
			}
			else
			if ( strncmp( theMessage, "PTT-", 4) == 0 )
			{
				KeyMessage[0] = KEY_PTT_OFF;
				KeyMessage[1] = FALSE;
			}

			else
			if ( strncmp( theMessage, "A", 1) == 0 )
			{
				KeyMessage[0] = KEY_AERIAL_EARTHING;
				KeyMessage[1] = atoi( &theMessage[1]);

			}

#endif


			while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
			{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
			}
			// format message and send to KeysReceivedQueue


    	}

    	// not needed if queue suspends task - vTaskDelay( pdMS_TO_TICKS(500));
    }
}


void transmitToConsole( void *pvParameters )
{
	u8 		theMessage[MAX_STRING_LENGTH];
	u32		i;
	u8 	inByte;
	u8 	theByte[MAX_STRING_LENGTH] ;
	u32 byteCount = 0;

	memset( theByte, sizeof(theByte), 0);

    while ( 1 )
    {

#ifndef TALKTHROUGH

    	if ( xQueueReceive( consoleTransmitQueue, &theMessage, portMAX_DELAY ) == pdPASS )
    	{
    		for ( i=0; i<MAX_STRING_LENGTH; i++ )
    		{
    			uart_SendByte(STDOUT_BASEADDRESS, theMessage[i] );

    			if ( theMessage[i] == 0 )
    			{
    				break;
    			}

    		}

    		uart_SendByte(STDOUT_BASEADDRESS, '\n' );
    		uart_SendByte(STDOUT_BASEADDRESS, '\r' );

    		//vTaskDelay( pdMS_TO_TICKS(100));
    	}

#endif


    	while ( uart_ReceiveByte( STDOUT_BASEADDRESS, &inByte ) == 1 )
    	{

#ifdef TALKTHROUGH

    		uart_SendByte(XPAR_PS7_UART_1_BASEADDR, inByte );

			//Bluetooth_SendByte(STDOUT_BASEADDRESS, inByte );

#else
    		if ( ( inByte == '\n' ) ||  ( inByte == '\r' ) )
    		{
    			theByte[byteCount++] = 0;
    			break;
    		}

    		theByte[byteCount++] = inByte;

    		if ( byteCount == MAX_STRING_LENGTH ) break;
#endif
    	}

#ifndef TALKTHROUGH
    	if ( (byteCount == MAX_STRING_LENGTH) || ( inByte == '\n' ) || ( inByte == '\r' ))
    	{
    		/* pass the Bluegiga message to the main task to be processed */
			//while ( xQueueSendToBack( BluegigaReceiveQueue, &theByte, 0 ) != pdPASS )
			//{
			//	vTaskDelay( pdMS_TO_TICKS( 5 ));
			//}

    		while ( xQueueSendToBack( consoleReceiveQueue, &theByte, 0 ) != pdPASS )
			{
				vTaskDelay( pdMS_TO_TICKS( 5 ));
			}

			inByte = byteCount = 0;
			memset( theByte, sizeof(theByte), 0);
    	}
#endif

		vTaskDelay( pdMS_TO_TICKS(100));

    }

}


/* to be moved to UART.c  */



u8   uart_ReceiveByteCheck( u32 uartAddress )
{

	if ( (Xil_In32(uartAddress + XUARTPS_SR_OFFSET) & XUARTPS_SR_RXEMPTY) == XUARTPS_SR_RXEMPTY) {
		return 0;
	}

	return ( 1 );

}


u8   uart_ReceiveByte( u32 uartAddress, u8 *receivedByte )
{

	if ( (Xil_In32(uartAddress + XUARTPS_SR_OFFSET) & XUARTPS_SR_RXEMPTY) == XUARTPS_SR_RXEMPTY) {
		return 0;
	}

	*receivedByte = Xil_In32(uartAddress + XUARTPS_FIFO_OFFSET);

	return ( 1 );

}

/*****************************************************************************/
void uart_SendByte(u32 BaseAddress, u8 Data)
{
		/*
		 * Wait until there is space in TX FIFO
		 */
		while (XUartPs_IsTransmitFull(BaseAddress))
		{
			/* The UART FIFO is 32 bytes deep at 14 characters per 1 millisecond	*/
			/* means it would take just over 2 millisecond to empty.				*/
			/* so delay for a couple of milliseconds if the FIFO becomes full		*/

			vTaskDelay( pdMS_TO_TICKS(2));
		}

		/*
		 * Write the byte into the TX FIFO
		 */
		XUartPs_WriteReg(BaseAddress, XUARTPS_FIFO_OFFSET, Data);
}



