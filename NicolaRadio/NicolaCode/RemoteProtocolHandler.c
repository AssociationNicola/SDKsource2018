/*****************************************************************************
** File Name : TextMessaging.c
** Overview : Manages the Text Messaging sub-system
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




//#define TALKTHROUGH 1



/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "timers.h"

#include "NicolaTypes.h"


extern void AddReceivedTextToMenu( char *textMessage ) ;		// in LCD_Display.c

extern QueueHandle_t	consoleTransmitQueue ;
extern QueueHandle_t	BluegigaTransmitQueue ;
extern QueueHandle_t	PLTransmitQueue ;					/* in PSPLComms.c	*/


QueueHandle_t	MessageFromAndriodQueue ;
QueueHandle_t	MessageFromRemoteNicolasQueue ;

static void HandleRemoteNicolaMessage( void *pvParameters );
static void HandleAndriodMessage( void *pvParameters );

static void TXTMSGTimer1Callback( TimerHandle_t theHandle);
static void TXTMSGTimer2Callback( TimerHandle_t theHandle);

static void SendIndentityMessage();


static TimerHandle_t TXTMSGTimer1 ;
static TimerHandle_t TXTMSGTimer2 ;

void TextMessageStartup()
{

	MessageFromRemoteNicolasQueue = xQueueCreate( 4,					// max item count
										sizeof(TEXT_MESSAGE) /* MAX_STRING_LENGTH */) ;	// size of each item (max) ) ;
	MessageFromAndriodQueue = xQueueCreate( 4,					// max item count
										sizeof(TEXT_MESSAGE) /* MAX_STRING_LENGTH */) ;	// size of each item (max) ) ;


	xTaskCreate( HandleRemoteNicolaMessage,				/* The function that implements the task. */
				"HandleRemoteNicolaMessage", 				/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				0 );					/* The task handle is not required, so NULL is passed. */

	xTaskCreate( HandleAndriodMessage,				/* The function that implements the task. */
				"HandleAndriodMessage", 				/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				0 );					/* The task handle is not required, so NULL is passed. */

}


static void HandleRemoteNicolaMessage( void *pvParameters )
{
	u8 				*sendMessage;
	TEXT_MESSAGE	theReceivedMessage;
	TEXT_MESSAGE    *theSendMessage = &theReceivedMessage ;		//so the code reads OK
	IDENTITY_MESSAGE *IdentityMessage = (IDENTITY_MESSAGE *) &theReceivedMessage;
	int				characterCount;
	int				i;

	// turn off for now!

	while ( 1 )
	{
    	vTaskDelay( 100 * pdMS_TO_TICKS(1000));

	}


	/* declare message reply timeout */
	if ( (TXTMSGTimer1 = xTimerCreate( "XT1",
								60 * pdMS_TO_TICKS(1000),	// 1 minute
								pdFALSE,
								(void *) 1,
								TXTMSGTimer1Callback) ) )

	{

	}

	/* declare and start Indentity message repeat timer */
	if ( (TXTMSGTimer2 = xTimerCreate( "XT2",
								5 * 60 * pdMS_TO_TICKS(1000),		// 5 minutes
								pdFALSE,		// not auto restart
								(void *) 1,
								TXTMSGTimer2Callback) ) )

	{
		xTimerStart( TXTMSGTimer2, portMAX_DELAY );
	}

	// On start up send the wake up IDENTITY message to anyone listening

	SendIndentityMessage();


	while ( 1 )
	{

    	if ( xQueueReceive( MessageFromRemoteNicolasQueue, &theReceivedMessage, portMAX_DELAY ) == pdPASS )
    	{
    		if ( theReceivedMessage.header.StartCharacter == TXTMSGTimer1_RECV_TIMEOUT )	// Timer 1 for reply timeout
    		{

    		}
    		else
			if ( theReceivedMessage.header.StartCharacter == TXTMSGTimer2_WAKE_UP_MESSAGE )	// Timer 2 - repeat IDENTITY message
			{

				/* no response is expected to the Identity message */
				SendIndentityMessage();
			}
			else
    		if ( theReceivedMessage.header.StartCharacter == '#' )	// is a message from the other Nicola(s)
    		{
        		if ( theReceivedMessage.header.MessageType == IDENTITY_MESSAGE_TYPE)
    			{

        			// message from remote Nicola when it powers up

        			// need to record presence of remote Nicola here

#if 0
        			IdentityMessage->header.StartCharacter = '#';
        			IdentityMessage->header.MessageType = IDENTITY_MESSAGE_TYPE;	// simulate received message
        			IdentityMessage->header.MessageLength[0] = 0x80;
        			IdentityMessage->header.MessageLength[1] = NICOLA_NAME_SIZE + 1; //

        			IdentityMessage->thisNicolaID = thisNicolaSettings.thisNicolaID + '@';

        			strncpy( IdentityMessage->thisNicolaName, thisNicolaSettings.thisNicolaName, NICOLA_NAME_SIZE );
#endif
        			// pass received message onto Android.

					while ( xQueueSendToBack( BluegigaTransmitQueue, IdentityMessage, 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
    			}

    			else
    			if ( theReceivedMessage.header.MessageType == TEXT_MESSAGE_TYPE)
				{
					// message received from another Nicola

    				// depending on transmit performance will need to manage
    				// checksum and retries. Then put fragments together.

    				// - then we will send the message onto the Andriod and include
    				// retry counts and error indications.

					// pass the message onto the Bluetooth manage for onward handling
					// as a number of string arrays depending on the length of the
					// received message

					sendMessage = (u8*) &theReceivedMessage;

					characterCount = theReceivedMessage.header.MessageLength[1];

					theReceivedMessage.header.MessageType = TEXT_MESSAGE_RECEIVED ; 	// identify received message

					for ( i=0; i<characterCount; i+= MAX_STRING_LENGTH)
					{
						while ( xQueueSendToBack( BluegigaTransmitQueue, sendMessage, 0 ) != pdPASS )
						{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
						}
						sendMessage += MAX_STRING_LENGTH;
					}
					while ( xQueueSendToBack( consoleTransmitQueue, "Simulate received >>", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}

					while ( xQueueSendToBack( consoleTransmitQueue, theReceivedMessage.textMessage, 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}

					while ( xQueueSendToBack( consoleTransmitQueue, "<<\n\r", 0 ) != pdPASS )
					{
						vTaskDelay( pdMS_TO_TICKS( 5 ));
					}
				}

    		}
    	}

    	//vTaskDelay( pdMS_TO_TICKS(500));

	}
}

/*
 * Comms reply timer
 */
static void TXTMSGTimer1Callback( TimerHandle_t theHandle)
{
	char KeyMessage[8];

	KeyMessage[0] = TXTMSGTimer1_RECV_TIMEOUT;

	while ( xQueueSendToBack( MessageFromRemoteNicolasQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}

/*
 * Identity repeat message timer
 */
static void TXTMSGTimer2Callback( TimerHandle_t theHandle)
{
	char KeyMessage[8];

	KeyMessage[0] = TXTMSGTimer2_WAKE_UP_MESSAGE;

	while ( xQueueSendToBack( MessageFromRemoteNicolasQueue, KeyMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}

	xTimerStart( TXTMSGTimer2, portMAX_DELAY );
}


static void SendIndentityMessage()
{
	IDENTITY_MESSAGE IdentityMessage ;

	IdentityMessage.header.StartCharacter = '#';
	IdentityMessage.header.MessageType = IDENTITY_MESSAGE_TYPE;	// send identity message
	IdentityMessage.header.MessageLength[0] = 0x80;
	IdentityMessage.header.MessageLength[1] = 2 + NICOLA_NAME_SIZE; // no N3X:

	IdentityMessage.thisNicolaID = '@';		// send to ALL
	IdentityMessage.thisNicolaID = thisNicolaSettings.thisNicolaID+ '@';
	strcpy( IdentityMessage.thisNicolaName, (char *)&thisNicolaSettings.thisNicolaName );

	IdentityMessage.trailer.C_R_Character = '\r' ;
	IdentityMessage.trailer.L_F_Character = '\n' ;		// to trigger the FIFO to the PICO

	// send to other Nicola radios

	while ( xQueueSendToBack( PLTransmitQueue, &IdentityMessage, 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}


/*
 * Messages received are:
 *
 *  	- location of this radio changed
 *  	- text message to send
 *  	- close down
 *
 */
static void HandleAndriodMessage( void *pvParameters )
{
	TEXT_MESSAGE	theReceivedMessage;

	while ( 1 )
	{
    	if ( xQueueReceive( MessageFromAndriodQueue, &theReceivedMessage, portMAX_DELAY ) == pdPASS )
    	{
			if ( theReceivedMessage.header.StartCharacter == '$' )	// is a message from the Andriod
			{
				theReceivedMessage.header.StartCharacter = '#';

				// identify time and date

				// identify opening connection message

				// identify send text message
    			if ( theReceivedMessage.header.MessageType == TEXT_MESSAGE_TO_TRANSMIT)
				{
        			/* convert message type to the generic TEXT MESSAGE for transmission */
        			theReceivedMessage.header.MessageType = IDENTITY_MESSAGE_TYPE ;
				}



				while ( xQueueSendToBack( consoleTransmitQueue, "Our message >>", 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}

				while ( xQueueSendToBack( consoleTransmitQueue, theReceivedMessage.textMessage, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}

				AddReceivedTextToMenu( theReceivedMessage.textMessage ) ;

				while ( xQueueSendToBack( consoleTransmitQueue, "<<\n\r", 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
			}
    	}
	}

}
