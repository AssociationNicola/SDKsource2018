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

extern QueueHandle_t	consoleTransmitQueue ;			// in ConsoleManager.c
extern QueueHandle_t	PLTransmitQueue ;				// in PSPLComms.c

extern int 	MicrophoneVolume ;


void SetMicrophoneVolume(int selected );
void SetAerialType(int selected );
void SetAerialFrequency(int selected );

void SendPresetMessage(int selected);

n3z_tonetest* InstancePtr = NULL;

//static void Radio_Main( void *pvParameters );


void RadioInterfaceInit( )
{

	//InstancePtr = (n3z_tonetest *)malloc(sizeof (n3z_tonetest));
	if ( ( InstancePtr = (n3z_tonetest *) pvPortMalloc( sizeof(n3z_tonetest)) ) == NULL )
	{
		xil_printf( "FAILED TO ALLOCATE MEM RadioInterface\r\n" );
	}

    n3z_tonetest_Initialize(InstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);



#if 0
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
#endif

}

#if 0
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
#endif

/* this section provides the routines to effect setting changes made by the user	*/
/* through the menu system
 * 													*/

void SetMicrophoneVolumeAbs( int volumeValue )
{
	MicrophoneVolume = volumeValue;
	xil_printf( "Mic Volume set to %d\r\n", volumeValue );
}

void SetMicrophoneVolume(int changeValue )
{
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

	//while ( xQueueSendToBack( consoleTransmitQueue, "Set aerial type\n", 0 ) != pdPASS )
	//{
	//	vTaskDelay( pdMS_TO_TICKS( 5 ));
	//}
}

// The N3Z config bits:
// 0:2		N3Z frequency (1=Heyphone; 2=N2; 3=31kHz ...)
// 3		If 1 force ARM_ADC channel to 1 (ie not 0) which is the one used by the microphone or loop aerial (note this is heavy handed as the user pico normally controlls this)
// 4		Switch to text mode (currently doesn't go anywhere)
// 5,6		Beacon Select  (currently doesn't go anywhere) - for location beacon modes
// 7		Turn tone detect off - 1 = tone off; 0 = tone on

int		toneDetectMask = 0x80 ;
int		frequencyMask = 0x01;

void SetToneDetect(int selected )
{

	if ( selected == 0 )
	{
		toneDetectMask = 0x80;

		xil_printf( "SET Tone det off\r\n");
	}
	else
	{
		toneDetectMask = 0x00;

		xil_printf( "SET Tone det on\r\n");
	}

	n3z_tonetest_n3zconfig_write(InstancePtr, toneDetectMask | frequencyMask ) ;

}

void SetAerialFrequency(int selected )
{
	frequencyMask = selected ;

	xil_printf( "Frequency set to %x\r\n", thisNicolaSettings.aerialFrequency);

	n3z_tonetest_n3zconfig_write(InstancePtr, toneDetectMask | frequencyMask ) ;

}


void SendPresetMessage(int selected)
{

	xil_printf( "Set preset text message\r\n" ) ;

}



void SendWatchdogMessage( void )
{
	char	PLMessage[4] ;

	PLMessage[0] = '*' ;
	PLMessage[1] = SEND_WATCHDOG ;
	PLMessage[2]  = (u32) '\r' ;		// c/r
	PLMessage[3]  = (u32) '\n' ;		// load  pico

	while ( xQueueSendToBack( PLTransmitQueue, PLMessage, 0 ) != pdPASS )
	{
			vTaskDelay( pdMS_TO_TICKS( 5 ));
	}
}




