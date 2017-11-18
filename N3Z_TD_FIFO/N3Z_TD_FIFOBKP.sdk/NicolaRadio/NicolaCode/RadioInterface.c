/*****************************************************************************
** File Name : RadioInterface.c
** Overview : Handles the interface to the radio IP in the Programmable Logic
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	Sep 2016	PA		Original Version

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

#include "n3z_tonetest.h"

/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "timers.h"


#include "NicolaTypes.h"


/* global references for other source modules */

QueueHandle_t	PLSendQueue ;			// queue of message to be sent to PL
//QueueHandle_t	PLSendQueue ;			// queue of message to be sent to PL


extern QueueHandle_t	consoleTransmitQueue ;			// in ConsoleManager.c

void SetMicrophoneVolume(int selected );
void SetAerialType(int selected );
void SetAerialFrequency(int selected );

void SendPresetMessage(int selected);

n3z_tonetest* InstancePtr = NULL;

static void Radio_Main( void *pvParameters );


void RadioInterfaceInit( )
{

	InstancePtr = (n3z_tonetest *)malloc(sizeof (n3z_tonetest));

    n3z_tonetest_Initialize(InstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);

	PLSendQueue = xQueueCreate( 8,					// max item count
								4 ) ;					// size of each item (max) ) ;

	/* Start the tasks as described in the comments at the top of this file. */
						/* The task handle is not required, so NULL is passed. */

	xTaskCreate( Radio_Main,							/* The function that implements the task. */
				"Radio Main", 						/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 2, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


}

static void Radio_Main( void *pvParameters )
{
	char theMessage;
    while ( 1 )
    {
    	if ( xQueueReceive( PLSendQueue, &theMessage, portMAX_DELAY ) == pdPASS )
    	{

    	}
    	//vTaskDelay( pdMS_TO_TICKS( 1000 ));
    }
}


/* this section provides the routines to effect setting changes made by the user	*/
/* through the menu system															*/

void SetMicrophoneVolume(int changeValue )
{
	extern int 	MicrophoneVolume ;

	if ( changeValue > 0 )
	{
		if ( MicrophoneVolume == MIN_VOLUME )
		{
			// if we were at minimum volume then set to callers value
			MicrophoneVolume = changeValue ;
		}
		else
		{
			// increase by callers value
			MicrophoneVolume += changeValue ;
		}
	}
	else
	if ( changeValue < 0 )
	{
		// decrease by callers value
		MicrophoneVolume += changeValue ;
	}

	if ( MicrophoneVolume < MIN_VOLUME )
	{
		MicrophoneVolume = MIN_VOLUME ;
	}

	if ( MicrophoneVolume > MAX_VOLUME )
	{
		MicrophoneVolume = MAX_VOLUME ;
	}

	n3z_tonetest_audiovolume_write(InstancePtr, MicrophoneVolume);

}

void SetAerialType(int selected )
{
	while ( xQueueSendToBack( consoleTransmitQueue, "Set aerial type\n", 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}

void SetAerialFrequency(int selected )
{
	while ( xQueueSendToBack( consoleTransmitQueue, "Set aerial frequency\n", 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}


void SendPresetMessage(int selected)
{
	while ( xQueueSendToBack( consoleTransmitQueue, "Set preset text message\n", 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 5 ));
	}

	while ( xQueueSendToBack( consoleTransmitQueue, (char *) selected, 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 5 ));
	}


}


