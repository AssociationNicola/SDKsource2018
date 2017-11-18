/*****************************************************************************
** File Name : Bluetooth.C
** Overview : Handles interface to Bluegiga
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	May 2016	PA		Original Version

** All Rights Reserved(c) Association Nicola, Graham Naylor, Pete Allwright


Description to be done


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


/* external routines and others used in the Bluetooth handler */

void MenuMessageFromHostComputer( char *theMessage );		// in LCD_Display.c

extern QueueHandle_t	consoleTransmitQueue ;
extern QueueHandle_t	MessageFromAndriodQueue ;			// in TextMessage.c
extern QueueHandle_t	KeysReceivedQueue ;					/* in LCD_Display.c */


/* constants used */

#define MAX_BLUETOOTH_CHANNELS	4
#define MAC_ADDRESS_LENGTH 18

#define NO_TYPE			0
#define HFP_AG_TYPE		1
#define HSP_AG_TYPE		2
#define TABLET_TYPE		3
#define COMPUTER_TYPE	4


typedef struct
{
	char		Allocated ;
	char		MACAddress[MAC_ADDRESS_LENGTH];
	char		Type ;
	char		LinkID;
	char		SCOChannel ;
	char		RFCommChannel ;
	int			PinCodeIndex;
} BLUETOOTH_CHANNELS ;

/* Global references */



static BLUETOOTH_CHANNELS	BluetoothChannels[MAX_BLUETOOTH_CHANNELS];

//static int	timedInquiry;					// INQUIRY clocking

static int	countConnectedChannels = 0;


static void changeToCommmandMode( int setCommandMode );

void BluetoothBeginInquiry( int selected );

BLUETOOTH_CHANNELS *AllocateChannelTable( char *theMessage);
void DetermineChannelType( BLUETOOTH_CHANNELS *BluetoothChannel, char *theType );
BLUETOOTH_CHANNELS *FindChannelTableFromMAC( char *theMACAddress);
BLUETOOTH_CHANNELS *FindChannelTableFromLinkID( char theLinkID );
BLUETOOTH_CHANNELS *FindChannelTableFromSCOChannel( char theSCOChannel );
BLUETOOTH_CHANNELS *FindChannelTableFromRFCommChannel( char theRFCommChannel );
BLUETOOTH_CHANNELS *FindChannelTableForTablet( char theType );



static void AddMessageToTransmit( char *theMessage  );



static void BluegigaOutput( void *pvParameters );
static void BluegigaInput( void *pvParameters );
static void BluetoothMain( void *pvParameters );


TaskHandle_t	BluetoothIOTask;

QueueHandle_t	BluegigaTransmitQueue ;
QueueHandle_t	BluegigaReceiveQueue ;
QueueHandle_t	consoleQueue ;

static TimerHandle_t BluetoothTimer1 ;

static void BluetoothTimer1Callback( TimerHandle_t theHandle);

char * StartupMessages[] = {
		//"SET RESET\n",
		"SET CONTROL ECHO 5\n",
		"SET CONTROL CONFIG 90 1100\n",		// 0001 0001 0000 0000

		//"SET CONTROL PCM 08200006 0060\n",
		//"SET BT NAME NICOLADEFAULT\n",

		"SET BT CLASS 200408\n",
		"SET BT AUTH * 0000\n",
		"SET BT PAIR *\n",
		"SET PROFILE HFP-AG ON\n",
		"SET PROFILE HFP ON\n",
		"SET PROFILE HSP-AG ON\n",
		"SET PROFILE HFP ON\n",
		"SET PROFILE SPP ON\n",
		"SET CONTROL AUTOPAIR\n",
		"SET CONTROL AUTOCALL\n",
		//"SET BT SSP 1 1\n",
		//"SET BT SSP 3 0\n",
		//"SET CONTROL AUDIO INTERNAL MULTISCO\n"

		//"SET CONTROL AUTOPAIR 10 5 0000 0000\n",
		//"RESET\n",
		0
};

/* ideally in the long run the user will be able to set these in EPROM 	*/
/* the start up procedure would read the pin codes from flash and 		*/
/* store in this pin code table											*/

char *PinCodes[] =
{
		"0000",
		//"1111",
		//"6111",
		//"000000",
		0
};


/* this debugging option needs to be controllable in some way - command through	*/
/* the console ?																*/

u8 		BluetoothCommandEcho = 1;		/* echo commands send to Bluegiga to console */

u32		RfcommIsOpen = 0;


void BluetoothStartup()
{
	if ( (BluetoothTimer1 = xTimerCreate( "BT1",
								10 * pdMS_TO_TICKS(1000),
								pdFALSE,
								(void *) 1,
								BluetoothTimer1Callback) ) )

	{
		xTimerStart( BluetoothTimer1, portMAX_DELAY );
	}


	BluegigaTransmitQueue = xQueueCreate( 2,					// max item count
										MAX_STRING_LENGTH ) ;	// size of each item (max) ) ;

	BluegigaReceiveQueue = xQueueCreate( 6,						// max item count
										MAX_STRING_LENGTH ) ;	// size of each item (max) ) ;

	/* Start the tasks as described in the comments at the top of this file. */

	xTaskCreate( BluegigaOutput,					/* The function that implements the task. */
				"BluegigaIOutput", 					/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 4, 				/* The priority assigned to the task. Small number low priority */
				&BluetoothIOTask );					/* The task handle is not required, so NULL is passed. */

	xTaskCreate( BluegigaInput,						/* The function that implements the task. */
				"BluegigaInput", 					/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 6, 				/* The priority assigned to the task. Small number low priority */
				&BluetoothIOTask );					/* The task handle is not required, so NULL is passed. */

	xTaskCreate( BluetoothMain,						/* The function that implements the task. */
				"BT Main", 							/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				tskIDLE_PRIORITY + 4, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */


}


static void BluetoothTimer1Callback( TimerHandle_t theHandle)
{
	char theMessage[6] ;

	theMessage[0] = 'S';
	theMessage[1] = '-';
	theMessage[2] = 'I';
	theMessage[3] = 'N';
	theMessage[4] = 'Q';
	theMessage[5] = 0;

	/* pass the Bluegiga message to the main task to be processed */
	while ( xQueueSendToBack( BluegigaReceiveQueue, &theMessage, 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 3 ));
	}

#if 1
	while ( xQueueSendToBack( consoleTransmitQueue, &theMessage, 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS( 1 ));
	}
#endif

}

static void BluetoothMain( void *pvParameters )
{

	int			i;
	char 		theMessage[MAX_STRING_LENGTH];
	char 		theSendMessage[MAX_STRING_LENGTH];
	char		KeyMessage[2];
	IDENTITY_MESSAGE *theIDMessage = (IDENTITY_MESSAGE *) &theSendMessage;
	BLUETOOTH_CHANNELS	*BluetoothChannel;


	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		BluetoothChannels[i].Allocated = 0;
	}

	xTaskNotifyGive( BluetoothIOTask );


	changeToCommmandMode( TRUE );

	//AddMessageToTransmit("SET RESET\n");

	//vTaskDelay( pdMS_TO_TICKS(2000));		// enough time for the reset to work

	for ( i=0; i<sizeof(StartupMessages ); i++) {

		if ( StartupMessages[i] == 0  ) break;

		AddMessageToTransmit(StartupMessages[i]);
	}

	//vTaskDelay( pdMS_TO_TICKS(5000));

	//AddMessageToTransmit("SET CONTROL AUTOPAIR 10 5 0000\n");

	//sprintf( theSendMessage, "CALL %s 00001101-0000-1000-8000-00805F9B34FB RFCOMM\n", BluetoothChannel->MACAddress);

	//sprintf( theSendMessage, "SET CONTROL AUTOCALL 00001101-0000-1000-8000-00805F9B34FB 10000 RFCOMM\n");
	//AddMessageToTransmit(theSendMessage);


	sprintf( theSendMessage, "SET BT NAME %s\n", thisNicolaSettings.thisNicolaName);
	AddMessageToTransmit(theSendMessage);

	sprintf( theSendMessage, "RESET\n");
	AddMessageToTransmit(theSendMessage);


    while ( 1 )
    {
    	/* check for any incoming Bluegiga message and process 	*/

    	if ( xQueueReceive( BluegigaReceiveQueue, &theMessage, portMAX_DELAY  ) == pdPASS )
    	{

			//while ( xQueueSendToBack( consoleTransmitQueue, "Seen message\n\r", 0 ) != pdPASS )
			//{
			//	vTaskDelay( pdMS_TO_TICKS( 5 ));
			//}

			if ( strncmp( theMessage, "S-INQ", 6) == 0 )
			{
				// send INQUIRY message

#if 0
		    	if ( InquiryGoing )
		    	{
					if ( countConnectedChannels < 3 )
					{
						i = ( countConnectedChannels > 0 ) ? 30 : 10;

						i = 5;

						if ( timedInquiry++ == (10 * i) )		/* by 10 since each pass is 1/10th second */
						{

						}
					}
		    	}
#endif

		    	AddMessageToTransmit(  "INQUIRY 5\n" );

		    	xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY

			}
			else

#if 0
			if ( strncmp( theMessage, "INQUIRY_PARTIAL ", 14) == 0 )
			{
				// INQUIRY_PARTIAL 00:11:22:33:3f:98 200404
				// 012345678901234567890123456789012345678
				// 0          1         2         3

				//i = strlen( theMessage );
				//if ( i > 10 )

				if ( strlen( theMessage ) > 10 )
				{
					if ( (BluetoothChannel = AllocateChannelTable( &theMessage[16] )) != NULL )
					{
						DetermineChannelType( BluetoothChannel, &theMessage[34] );


						BluetoothChannel->PinCodeIndex += 1;
						if ( PinCodes[BluetoothChannel->PinCodeIndex] == NULL )
						{
							BluetoothChannel->PinCodeIndex = 0;

							InquiryGoing = 0;

							// need to tell user Pin codes have failed

						}

						/* send PIN code message  */
						//sprintf( theSendMessage, "SET BT AUTH * %s\n", PinCodes[BluetoothChannel->PinCodeIndex]);
						//AddMessageToTransmit(theSendMessage);

						//AddMessageToTransmit("SET BT SSP 3 0\n");


						/* send PAIR message */
						//sprintf( theSendMessage, "pair %s\n", BluetoothChannel->MACAddress);
						//AddMessageToTransmit(theSendMessage);

						InquiryGoing = 0;		// suppress INQUIRY for now
					}


					//
				}
			}
			else
#endif
			if ( strncmp( theMessage, "INQUIRY ", 8) == 0 )
			{
				// INQUIRY 00:11:22:33:3f:98 200404
				// 012345678901234567890123456789012345678
				// 0          1         2         3

				//i = strlen( theMessage );
				//if ( i > 10 )

				if ( strlen( theMessage ) > 10 )
				{
					if ( (BluetoothChannel = AllocateChannelTable( &theMessage[8] )) != NULL )
					{
						DetermineChannelType( BluetoothChannel, &theMessage[26] );


						BluetoothChannel->PinCodeIndex += 1;
						if ( PinCodes[BluetoothChannel->PinCodeIndex] == NULL )
						{
							BluetoothChannel->PinCodeIndex = 0;

							// need to tell user Pin codes have failed

						}

#if 1
						//if ( ( BluetoothChannel->Type != COMPUTER_TYPE ) &&
						//	 ( BluetoothChannel->Type != TABLET_TYPE ) )


						if ( BluetoothChannel->Type != COMPUTER_TYPE )
						{


							//if ( BluetoothChannel->Type == COMPUTER_TYPE )
							{
							//sprintf( theSendMessage, "SET BT PAIR %s 3b41ca4f42401ca64ab3ca3303d8ccdc\n", BluetoothChannel->MACAddress);
							//AddMessageToTransmit(theSendMessage);
							}

							/* send PIN code message  */
							if ( BluetoothChannel->Type == TABLET_TYPE )
							{
								sprintf( theSendMessage, "SET BT AUTH * 000000\n");
							}
							else
							{
								sprintf( theSendMessage, "SET BT AUTH * %s\n", PinCodes[BluetoothChannel->PinCodeIndex]);
							}



							AddMessageToTransmit(theSendMessage);

							//AddMessageToTransmit("SET BT SSP 3 0\n");


							/* send PAIR message */
							sprintf( theSendMessage, "pair %s\n", BluetoothChannel->MACAddress);
							AddMessageToTransmit(theSendMessage);
						}
						//else
						//{
							//sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
							//AddMessageToTransmit(theSendMessage);
						//}

						//InquiryGoing = 0;		// suppress INQUIRY for now

						xTimerStop( BluetoothTimer1, portMAX_DELAY );		// stop the INQUIRY timer
#endif


					}


					//
				}

				else

				if ( theMessage[8] == '0')
				{
					//timedInquiry = 1;
				}
				BluetoothChannel = NULL;
			}
			else
			if ( strncmp( theMessage, "PAIR ", 5) == 0 )
			{
				// PAIR 64:5a:04:86:01:c9 OK
				// 012345678901234567890123456789012345
				if ( strlen( theMessage ) < 20 )	// strange error
				{
					//timedInquiry = 8;

				}
				else
				if ( ((BluetoothChannel = FindChannelTableFromMAC( &theMessage[5] ) ) != NULL ) ||
				     ((BluetoothChannel = AllocateChannelTable( &theMessage[5] ) ) != NULL ) )

				{
#if 1
					if ( memcmp( &theMessage[23], "OK", 2) == 0 )
					{
						/* PAIRed successfully.						*/

						switch( BluetoothChannel->Type )
						{
							case HFP_AG_TYPE:
								sprintf( theSendMessage, "CALL %s 111E HFP-AG\n", BluetoothChannel->MACAddress);
								AddMessageToTransmit(theSendMessage);
								break;

							case HSP_AG_TYPE:
								sprintf( theSendMessage, "CALL %s 1108 HSP-AG\n", BluetoothChannel->MACAddress);
								AddMessageToTransmit(theSendMessage);
								break;

							case TABLET_TYPE:
								//sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
								sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
								AddMessageToTransmit(theSendMessage);
								break;
							case COMPUTER_TYPE:
								//sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
								sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
								AddMessageToTransmit(theSendMessage);
								break;

						}

						countConnectedChannels += 1;

						//InquiryGoing = 1;		// allow INQUIRY

						xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY

					}
					else
					if ( memcmp( &theMessage[23], "FAIL", 4) == 0 )
					{
						BluetoothChannel->PinCodeIndex += 1;
						if ( PinCodes[BluetoothChannel->PinCodeIndex] == NULL )
						{
							BluetoothChannel->PinCodeIndex = 0;
							//timedInquiry = 1;

							// need to tell user Pin codes have failed

						}

						{

							if ( BluetoothChannel->Type == TABLET_TYPE )
							{
								sprintf( theSendMessage, "SET BT AUTH * 000000\n");
							}
							else
							{
								sprintf( theSendMessage, "SET BT AUTH * %s\n", PinCodes[BluetoothChannel->PinCodeIndex]);
							}

							/* repeat the send PIN code message */

							AddMessageToTransmit(theSendMessage);

							/* send PAIR message */
							sprintf( theSendMessage, "pair %s\n", BluetoothChannel->MACAddress);
							AddMessageToTransmit(theSendMessage);
						}

						//InquiryGoing = 1;		// allow INQUIRY

						xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY
					}
#endif
				}
				else
				{
					//timedInquiry = 1;
				}
			}
			else
			if ( strncmp( theMessage, "CALL ", 5) == 0 )
			{
				/* the CALL response should come as a response to the CALL message just issued	*/

				/* extract the link ID number as an alphabetic character */


				if ( BluetoothChannel != NULL )
				{
					BluetoothChannel->LinkID = theMessage[5];
				}

				BluetoothChannel = NULL;
			}

			else
			if ( strncmp( theMessage, "CONNECT ", 8) == 0 )
			{
				/* the CONNECT response should come as a response to the CALL message just issued	*/

				// CONNECT 0 RFCOMM 1
				// 012345678901234567890123456789012345

				/* extract the RFCOMM channel as an alphabetic character */

				if ( ( strncmp( &theMessage[10], "HSP-AG ", 6) == 0 ) ||
					 ( strncmp( &theMessage[10], "HFP-AG ", 6) == 0 ) )
				{
					if ( (BluetoothChannel = FindChannelTableFromLinkID( theMessage[8] ) ) != NULL )
					{
						BluetoothChannel->RFCommChannel = theMessage[17];
					}

					/* send SCO OPEN message */
					sprintf( theSendMessage, "SCO OPEN %c\n", BluetoothChannel->LinkID );
					AddMessageToTransmit(theSendMessage);
				}
				else
				if ( strncmp( &theMessage[10], "SCO ", 4) == 0 )
				{

				}
				else
				if ( strncmp( &theMessage[10], "RFCOMM ", 7) == 0 )
				{
					BluetoothChannel->RFCommChannel = theMessage[17];

					//InquiryGoing = 0;

					xTimerStop( BluetoothTimer1, portMAX_DELAY );		// stop the INQUIRY timer

					sprintf( theSendMessage, "SELECT %c\n", BluetoothChannel->RFCommChannel);
					AddMessageToTransmit(theSendMessage);

					AddMessageToTransmit( "And a message" );

				}

				BluetoothChannel = NULL;

				//timedInquiry = 1;		/* resume looking for orher conncetions */
			}

			else
			if ( strncmp( theMessage, "RING ", 5) == 0 )
			{
				//theMessage[24] = 0;
				//sprintf( theSendMessage, "KILL %s\n", &theMessage[7]);
				//AddMessageToTransmit(theSendMessage);

				// RING 0 64:5a:04:86:01:c9 3 HFP
				// 012345678901234567890123456789012345


				if ( (BluetoothChannel = AllocateChannelTable( &theMessage[7] )) != NULL )
				{
					//DetermineChannelType( BluetoothChannel, &theMessage[8+MAC_ADDRESS_LENGTH] );

					BluetoothChannel->LinkID = theMessage[5];
					BluetoothChannel->RFCommChannel = theMessage[25];

					//sprintf( theSendMessage, "CALL %s 00001101-0000-1000-8000-00805F9B34FB RFCOMM\n", BluetoothChannel->MACAddress);

					//"SET CONTROL AUTOCALL 00001101-0000-1000-8000-00805F9B34FB 10000 RFCOMM",
					//AddMessageToTransmit(theSendMessage);

					//AddMessageToTransmit("OK\n");


					if ( strncmp( &theMessage[27], "RFCOMM", 6) == 0 )
					{
						//xTaskNotifyGive( BluetoothIOTask );

						xil_printf( "DATA MODE 1\n\r");


						RfcommIsOpen = 1;
						BluetoothChannel->RFCommChannel = theMessage[25];

	        			theIDMessage->header.StartCharacter = '#';
	        			theIDMessage->header.MessageType = IDENTITY_MESSAGE_TYPE;	// simulate received message
	        			theIDMessage->header.MessageLength[0] = 0x80;
	        			theIDMessage->header.MessageLength[1] = NICOLA_NAME_SIZE + 1; //

	        			theIDMessage->thisNicolaID = thisNicolaSettings.thisNicolaID + '@';
	        			strncpy( theIDMessage->thisNicolaName, thisNicolaSettings.thisNicolaName, NICOLA_NAME_SIZE );

	        			AddMessageToTransmit( (char *) theIDMessage);
					}
					if ( strncmp( &theMessage[27], "HFP", 6) == 0 )
					{
						RfcommIsOpen = 1;
						BluetoothChannel->RFCommChannel = theMessage[25];

						AddMessageToTransmit( "And a message" );

						xil_printf( "DATA MODE 2\n\r");

					}

				}


			}
			else
			if ( strncmp( theMessage, "SSPAUTH ", 8) == 0 )
			{
				// SSPAUTH 64:5a:04:86:01:c9?
				// 012345678901234567890123456789012345
				if ( theMessage[25] == '?'  )
				{
					if ( (BluetoothChannel = FindChannelTableFromMAC( &theMessage[8] ) ) == NULL )
					{
						if ( (BluetoothChannel = AllocateChannelTable( &theMessage[8] )) != NULL )
						{

							BluetoothChannel->Type = TABLET_TYPE ; 		// assume a tablet until shown otherwise
						}

					}

					// can get an SSPAUTH with INQUIRY - but we will not know what type of connection!
					//
					if ( BluetoothChannel != NULL )
					{

						vTaskDelay( 100 );

						/* send SSP OK message */
						sprintf( theSendMessage, "sspauth %s OK\n", BluetoothChannel->MACAddress );
						AddMessageToTransmit(theSendMessage);

						//sprintf( theSendMessage, "SSP CONFIRM %s OK\n", BluetoothChannel->MACAddress );
						//AddMessageToTransmit(theSendMessage);

							//sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
							//AddMessageToTransmit(theSendMessage);

						//vTaskDelay( pdMS_TO_TICKS(10000) );
						if ( BluetoothChannel->Type == COMPUTER_TYPE )
						{
							sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
							AddMessageToTransmit(theSendMessage);
						}

						//char *SSPkey = "123456";
						//sprintf( theSendMessage, "SSP CONFIRM %s %s ?\n", BluetoothChannel->MACAddress, SSPkey );
						//AddMessageToTransmit(theSendMessage);

							//InquiryGoing = 0;

						xTimerStop( BluetoothTimer1, portMAX_DELAY );		// stop the INQUIRY timer

					}
					else
					{
						// InquiryGoing = 1;

						xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY
					}
				}

			}
			else
			if ( strncmp( theMessage, "SSP CONFIRM ", 12) == 0 )
			{
				// SSP CONFIRM 64:5a:04:86:01:c9 790476 ?
				// 01234567890123456789012345678901234567
				if ( (BluetoothChannel = FindChannelTableFromMAC( &theMessage[12] ) ) != NULL )
				{

					if ( theMessage[37] == '?' )
					{
						char SSPkey[7];

						memcpy( SSPkey, &theMessage[30], 6 );
						SSPkey[6] = 0;

						/* send SSP OK message */
						//sprintf( theSendMessage, "SSPAUTH %s OK\n", BluetoothChannel->MACAddress );
						//AddMessageToTransmit(theSendMessage);
						sprintf( theSendMessage, "ssp confirm %s OK\n", BluetoothChannel->MACAddress );
						AddMessageToTransmit(theSendMessage);

						//sprintf( theSendMessage, "SSP CONFIRM %s %s ?\n", BluetoothChannel->MACAddress, SSPkey );
						//AddMessageToTransmit(theSendMessage);


							//sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
							//AddMessageToTransmit(theSendMessage);

						/* send PAIR confirm message */
						//sprintf( theSendMessage, "PAIR %s OK\n", BluetoothChannel->MACAddress);
						//AddMessageToTransmit(theSendMessage);
					}

				}
			}
			else
			if ( strncmp( theMessage, "SSP COMPLETE ", 12) == 0 )
			{
				// SSP COMPLETE 64:5a:04:86:01:c9 HCI_E
				// 012345678901234567890123456789012345

				if ( (BluetoothChannel = FindChannelTableFromMAC( &theMessage[13] ) ) != NULL )
				{
					if ( strncmp( &theMessage[31], "HCI_ERROR", 8 ) == 0)
					{
						//InquiryGoing = 1;		// restart INQUIRY

						xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY

					//}
					//else
					//if ( strncmp( &theMessage[31], "HCI_E", 5 ) == 0)
					//{
						//InquiryGoing = 0;		// stop INQUIRY

						//sprintf( theSendMessage, "CALL %s 1101 RFCOMM\n", BluetoothChannel->MACAddress);
						//AddMessageToTransmit(theSendMessage);
					}
				}

			}

			else
			if ( strncmp( theMessage, "CONNAUTH ", 9) == 0 )
			{
				// CONNAUTH b0:ee:45:f4:47:06 2 3?
				// 0123456789012345678901234567890

				if ( (BluetoothChannel = FindChannelTableFromMAC( &theMessage[9] ) ) != NULL )
				{
					if ( theMessage[30] == '?' )
					{
						sprintf( theSendMessage, "CONNAUTH %s %c %c OK\n", BluetoothChannel->MACAddress, theMessage[27], theMessage[29]);
						AddMessageToTransmit(theSendMessage);
					}
				}

			}

			else
			if ( ( strncmp( theMessage, "HSP-AG ", 7) == 0 ) ||
				 ( strncmp( theMessage, "HFP-AG ", 7) == 0 ) )
			{
				if ( (BluetoothChannel = FindChannelTableFromLinkID( theMessage[7] ) ) != NULL )
				{
					if ( strncmp( &theMessage[9], "BUTTON", 6) == 0 )
					{
						/* handle Bluetooth transmit ON or OFF */

			    		KeyMessage[0] = KEY_BLUETOOTH_PTT;

						while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
						{
								vTaskDelay( pdMS_TO_TICKS( 5 ));
						}


						while ( xQueueSendToBack( consoleTransmitQueue, "Transmit requested\n\r", 0 ) != pdPASS )
						{
							vTaskDelay( pdMS_TO_TICKS( 5 ));
						}

						//AddMessageToTransmit( "PLAY 6,gfgfgf__gfgfgf______gfgfgf__gfgfgf");
					}

					else

					// HFP-AG 0 UNKNOWN (0): ATD?;\r
					// 0123456789012345678901234567890
					//           1         2
					if ( strncmp( &theMessage[9], "UNKNOWN", 7) == 0 )
					{
						if ( strncmp( &theMessage[22], "ATD?", 4) == 0 )
						{
							/* handle Bluetooth transmit ON or OFF */

				    		KeyMessage[0] = KEY_BLUETOOTH_PTT;

							while ( xQueueSendToBack( KeysReceivedQueue, KeyMessage, 0 ) != pdPASS )
							{
									vTaskDelay( pdMS_TO_TICKS( 5 ));
							}

							while ( xQueueSendToBack( consoleTransmitQueue, "Transmit requested\n\r", 0 ) != pdPASS )
							{
								vTaskDelay( pdMS_TO_TICKS( 5 ));
							}

						}
					}

				}
			}



			else
			if ( strncmp( theMessage, "NO CARRIER", 10) == 0 )
			{
				//char linkID = theMessage[11];

#if 0
				if ( (BluetoothChannel = FindChannelTableFromLinkID( linkID ) ) != NULL )
				{
					/* the message was for the connected Link ID */
					BluetoothChannel->Allocated = 0;
					countConnectedChannels -= 1;
					if ( countConnectedChannels < 0 ) countConnectedChannels = 0;
					timedInquiry = 5;
				}
				else
				if ( (BluetoothChannel = FindChannelTableFromSCOChannel( linkID ) ) != NULL )
				{
					/* the message was for the connected audio ID */
					BluetoothChannel->Allocated = 0;
					countConnectedChannels -= 1;
					if ( countConnectedChannels < 0 ) countConnectedChannels = 0;
					timedInquiry = 5;
				}
				else
				if ( (BluetoothChannel = FindChannelTableFromRFCommChannel( linkID ) ) != NULL )
				{
					/* the message was for the connected audio ID */
					BluetoothChannel->Allocated = 0;
					countConnectedChannels -= 1;
					if ( countConnectedChannels < 0 ) countConnectedChannels = 0;
					timedInquiry = 5;
				}
#endif
				//timedInquiry = 5;

				xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY
			}




			else
			if ( strncmp( theMessage, "SYNTAX ERROR", 12) == 0 )
			{
				//timedInquiry = 1;
			}

			else
			if ( strncmp( theMessage, "£", 1) == 0 )		// received from computer - menu and settings download
			{
				MenuMessageFromHostComputer( &theMessage[1] );
			}

			else
			if ( strncmp( theMessage, "$", 1) == 0 )		// received from Andriod tablet
			{
				while ( xQueueSendToBack( MessageFromAndriodQueue, theMessage, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 5 ));
				}
			}

			else
			if ( strncmp( theMessage, "#", 1) == 0 )		// received from other Nicola
			{
				//if ( theMessage[4] == 'R')
				{
					/* text message has been received from the other end */

					if ( RfcommIsOpen == 0 )
					{
						/* re-open the RFCOMM channel to the tablet - need to locate it */
						if ( ( (BluetoothChannel = FindChannelTableForTablet( TABLET_TYPE ) ) != NULL ) &&
							 ( BluetoothChannel->RFCommChannel != 0 ) )
						{
							sprintf( theSendMessage, "SELECT %c\n", BluetoothChannel->RFCommChannel);
							AddMessageToTransmit(theSendMessage);
							RfcommIsOpen = 1;
						}
					}
					if ( RfcommIsOpen == 1 )
					{
						theMessage[3] = ' ';
						AddMessageToTransmit(  theMessage );		/* send message to the tablet */
					}
				}
			}


    	}

    	vTaskDelay( pdMS_TO_TICKS(100));

    }

}

static void changeToCommmandMode( int setCommandMode )
{

	vTaskDelay( pdMS_TO_TICKS(1001));					/* wait just over 1 second  		*/
	uart_SendByte(XPAR_PS7_UART_1_BASEADDR, '+' );	/* send the escape sequence			*/
	uart_SendByte(XPAR_PS7_UART_1_BASEADDR, '+' );	/* send the escape sequence			*/
	uart_SendByte(XPAR_PS7_UART_1_BASEADDR, '+' );	/* send the escape sequence			*/
	vTaskDelay( pdMS_TO_TICKS(1001));					/* wait just over 1 second  again	*/

}


void BluetoothBeginInquiry( int selected )
{
	if ( selected == 0 )
	{
		//InquiryGoing = 0;
		xTimerStop( BluetoothTimer1, portMAX_DELAY );		// stop the INQUIRY timer
	}
	else
	{
		//timedInquiry = 8;

		xTimerStart( BluetoothTimer1, portMAX_DELAY );		// restart timer for next INQUIRY
	}
}

static void BluegigaOutput( void *pvParameters )
{
	u8 		theMessage[MAX_STRING_LENGTH];
	int		i;


    while ( 1 )
    {
    	/* look for data transition reset */

    	if ( ulTaskNotifyTake( pdTRUE, 0 ) != 0  )
    	{
    		changeToCommmandMode( TRUE );

    	}

#ifndef TALKTHROUGH

    	if ( xQueueReceive( BluegigaTransmitQueue, &theMessage, 0 ) == pdPASS )
    	{
    		for ( i=0; (i<MAX_STRING_LENGTH) && (theMessage[i] != 0); i++ )
    		{
    			uart_SendByte(XPAR_PS7_UART_1_BASEADDR, theMessage[i] );

    			//if ( BluetoothCommandEcho )
    			//{
    				//uart_SendByte(STDOUT_BASEADDRESS, theMessage[i] );
    			//}

    			if ( theMessage[i] == '\n' )
    			{
    				//uart_SendByte(STDOUT_BASEADDRESS, '\r' );
    				break;
    			}

    		}

    		if ( BluetoothCommandEcho )
    		{
    			while ( xQueueSendToBack( consoleTransmitQueue, &theMessage, 0 ) != pdPASS )
    			{
    				vTaskDelay( pdMS_TO_TICKS( 5 ));
    			}
    		}
    	}

#endif

		vTaskDelay( pdMS_TO_TICKS(250));


    }
}

static void BluegigaInput( void *pvParameters )
{
	u8 		inBuffer[MAX_STRING_LENGTH];
	int		i;
	u8 		inByte;
	u8 		theByte[MAX_STRING_LENGTH];
	u32 	byteCount = 0;



	while ( 1 )
	{
    	while ( uart_ReceiveByte( XPAR_PS7_UART_1_BASEADDR, &inByte ) == 1 )
    	{

#ifdef TALKTHROUGH

    		uart_SendByte(STDOUT_BASEADDRESS, inByte );

#else
    		//uart_SendByte(STDOUT_BASEADDRESS, inByte );

			if ( inByte == 0 )
			{
				inByte = '?';		/* temporary to remove NULL */
			}

    		//if ( inByte == '\n' )
    		//{
    		//	theByte[byteCount++] = 0;
    			//break;
    		//}

			inBuffer[byteCount++] = inByte;

    		if ( byteCount == MAX_STRING_LENGTH ) break;

#endif

    	}

    	for ( i=0; i<byteCount; i++)
    	{
    		// look for a \n in the buffer received

    		theByte[i] = inBuffer[i];

    		if ( inBuffer[i] == '\n' )
    		{
    			theByte[i] = 0;
    			inByte = '\n' ;

    			byteCount = byteCount - i - 1;

    			if ( byteCount )
    			{
    				memcpy( inBuffer, &inBuffer[i+1], byteCount ) ;
    			}

    			break;
    		}
    	}


    	{

#ifndef TALKTHROUGH

			if ( (byteCount == MAX_STRING_LENGTH) || ( inByte == '\n' ))
			{

				//if ( memcmp( theByte, "PAIR", 4) == 0 )
				//{
				//	while ( uart_ReceiveByte( XPAR_PS7_UART_1_BASEADDR, &inByte ) == 1 )
				//	{

				//	}
				//}

				/* pass the Bluegiga message to the main task to be processed */
				while ( xQueueSendToBack( BluegigaReceiveQueue, &theByte, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 3 ));
				}

#if 1
				while ( xQueueSendToBack( consoleTransmitQueue, &theByte, 0 ) != pdPASS )
				{
					vTaskDelay( pdMS_TO_TICKS( 1 ));
				}
#endif


				// no for ( i=0; i<byteCount; i++ )
				//{
				//	theByte[i] = 0;
				//}

				inByte = 0;
			}
    	}

#endif

    	if ( ( byteCount == 0 ) && ( uart_ReceiveByteCheck( XPAR_PS7_UART_1_BASEADDR ) == 0 ) )
    	{
    		vTaskDelay( pdMS_TO_TICKS(5));
    	}

    }

}


static void AddMessageToTransmit( char *theMessage  )
{
	while ( xQueueSendToBack( BluegigaTransmitQueue, theMessage, 0 ) != pdPASS )
	{
		vTaskDelay( pdMS_TO_TICKS(5));
	}
}




BLUETOOTH_CHANNELS *AllocateChannelTable( char *theMACAddress )
{
	int			i;
	BLUETOOTH_CHANNELS *theTable;

	if ( (theTable = FindChannelTableFromMAC( theMACAddress ) ) != NULL )
	{
		return( theTable );
	}

	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		if ( BluetoothChannels[i].Allocated == 0)
		{
			BluetoothChannels[i].Allocated = 1;
			memcpy( &BluetoothChannels[i].MACAddress, theMACAddress, MAC_ADDRESS_LENGTH-1);
			BluetoothChannels[i].MACAddress[MAC_ADDRESS_LENGTH-1] = 0;
			BluetoothChannels[i].Type = NO_TYPE;
			BluetoothChannels[i].LinkID = 0;
			BluetoothChannels[i].SCOChannel = 0;
			BluetoothChannels[i].RFCommChannel = 0;
			BluetoothChannels[i].PinCodeIndex = 0;
			return( &BluetoothChannels[i] );
		}
	}

	return( NULL );

}


void DetermineChannelType( BLUETOOTH_CHANNELS *BluetoothChannel, char *theType )
{

	if ( strncmp( theType, "200404", 6) == 0)
	{
		BluetoothChannel->Type = HFP_AG_TYPE;
	}
	else
	if ( strncmp( theType, "240404", 6) == 0)
	{
		BluetoothChannel->Type = HSP_AG_TYPE;
	}
	else
	if ( strncmp( theType, "1a0114", 6) == 0)
	{
		BluetoothChannel->Type = TABLET_TYPE;
	}
	else
	if ( strncmp( theType, "02010c", 6) == 0)
	{
		BluetoothChannel->Type = COMPUTER_TYPE;
	}



}

BLUETOOTH_CHANNELS *FindChannelTableFromMAC( char *theMACAddress)
{
	int		i;

	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		if ( BluetoothChannels[i].Allocated == 1)
		{
			if ( memcmp( theMACAddress, BluetoothChannels[i].MACAddress, MAC_ADDRESS_LENGTH-1 ) == 0)
			{
				return( &BluetoothChannels[i] );
			}
		}
	}

	return( NULL );
}

BLUETOOTH_CHANNELS *FindChannelTableFromLinkID( char theLinkID )
{
	int		i;

	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		if ( BluetoothChannels[i].Allocated == 1)
		{
			if ( BluetoothChannels[i].LinkID == theLinkID )
			{
				return( &BluetoothChannels[i] );
			}
		}
	}

	return( NULL );
}


BLUETOOTH_CHANNELS *FindChannelTableFromSCOChannel( char theSCOChannel )
{
	int		i;

	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		if ( BluetoothChannels[i].Allocated == 1)
		{
			if ( BluetoothChannels[i].SCOChannel == theSCOChannel )
			{
				return( &BluetoothChannels[i] );
			}
		}
	}

	return( NULL );
}

BLUETOOTH_CHANNELS *FindChannelTableFromRFCommChannel( char theRFCommChannel )
{
	int		i;

	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		if ( BluetoothChannels[i].Allocated == 1)
		{
			if ( BluetoothChannels[i].RFCommChannel == theRFCommChannel )
			{
				return( &BluetoothChannels[i] );
			}
		}
	}

	return( NULL );
}


BLUETOOTH_CHANNELS *FindChannelTableForTablet( char theType )
{
	int		i;

	for ( i=0; i<MAX_BLUETOOTH_CHANNELS; i++)
	{
		if ( BluetoothChannels[i].Allocated == 1)
		{
			if ( BluetoothChannels[i].Type == theType )		// TABLET_TYPE or COMPUTER_TYPE
			{
				return( &BluetoothChannels[i] );
			}
		}
	}

	return( NULL );
}



