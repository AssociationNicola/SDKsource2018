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

#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"

#include "NicolaTypes.h"


//#define  DEVELOP_TEST_AUDIO

extern int 	MicrophoneVolume ;

void SetMicrophoneVolume(int selected );
void SetAerialType(int selected );
void SetAerialFrequency(int selected );

extern QueueHandle_t	consoleTransmitQueue ;			// in ConsoleManager.c
extern QueueHandle_t	PLTransmitQueue ;				// in PSPLComms.c

extern XLlFifo PSPLFifo;

n3z_tonetest* InstancePtr = NULL;

extern n3z_tonetest		*ToneTestInstancePtr;


int		configMask = 0x80;			// config write status = No Tone detect by default

#ifdef STORE_AND_FORWARD


/* global references for other source modules */
extern void SendMessageToPL( char MsgType );			// in LCD_Display.c
extern int TxSend(XLlFifo *, u32  *SourceAddr, int );	// in PSPLComms.c



extern XLlFifo DataFifo;


extern int 	StoreAndForwardMode ;
extern int 	StoreAndFowardGo ;

void SetBluetoothMode(int);
void SendPresetMessage(int);


static void Radio_Main( void *pvParameters );


/* we will read 256 audio samples then write the lower 16 bits of each sample to flash */
/* to transmit we will read back the samples and rebuild the 32-bit audio word and write */
/* back to the audio stream FIFO */

#define AUDIO_PAGE_SIZE  256

u16	 	*audioFlashBuffer;			// pointer to Flash I/O buffer
u32		*audioStreamBuffer ;		// pointer to audio I/O buffer

#endif

void RadioInterfaceInit( )
{

	if ( ( InstancePtr = (n3z_tonetest *) pvPortMalloc( sizeof(n3z_tonetest)) ) == NULL )
	{
		xil_printf( "FAILED TO ALLOCATE MEM RadioInterface\r\n" );
	}

    n3z_tonetest_Initialize(InstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);



#if 0
	PLSendQueue = xQueueCreate( 8,					// max item count
								4 ) ;					// size of each item (max) ) ;
#endif

	/* Start the tasks as described in the comments at the top of this file. */
						/* The task handle is not required, so NULL is passed. */
#ifdef STORE_AND_FORWARD
	xTaskCreate( Radio_Main,							/* The function that implements the task. */
				"Radio Main", 						/* The text name assigned to the task - for debug only as it is not used by the kernel. */
				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
				NULL, 								/* The parameter passed to the task - not used in this case. */
				//tskIDLE_PRIORITY + 10, 				/* The priority assigned to the task. Small number low priority */
				tskIDLE_PRIORITY + 1, 				/* The priority assigned to the task. Small number low priority */
				NULL );								/* The task handle is not required, so NULL is passed. */
#endif

}

#ifdef STORE_AND_FORWARD

#ifdef DEVELOP_TEST_AUDIO

#define TEST_SEND_SIZE 256


/*  routine to receive audio (and store in flash) during store and forward development */
void ReceiveAudioTest()
{
	int	i;
	int	j;
	int	flashOffset;
	int	audioBytesReceived;
	int	audioValueCount ;
	u32 AudioValue ;
	u16 	*audioBufferPtr ;

    while ( 1 )
    {
    	// if we are receiving then store to flash
    	if ( StoreAndForwardMode && StoreAndFowardGo )
    	//if ( 1 )
    	{

    		audioBytesReceived = flashOffset = 0 ;

			//SetBluetoothMode( 0x400 ) ;

    		/* set the FIFO to stream audio to the ARM */
    		n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* reset FIFO */

    		//   1098 7654 3210 9876 5432 1098 7654 3210
    		//   0000 0000 1000 0001 0000 0000 0000 0000

    		n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x001010100);	/* bit 16, 17, 18 is channel and 16 = audio stream */
    																			/* bit 24 tells FPGA to stream until told to stop */

    		// while there is incoming audio data

			audioBufferPtr = audioFlashBuffer ;

			xil_printf( "\r\n\nRead Audio Data\r\n\n");

			// read the audio FIFO into the buffer
			do
			{

				audioValueCount = XLlFifo_RxOccupancy(&DataFifo) ;	/* how many values read? */

				if ( audioValueCount == 0 )
				{
					vTaskDelay( pdMS_TO_TICKS(5)); // wait for audio data to appear */
				}
				else
				for ( i=0; i<audioValueCount; i++ )
				{

					AudioValue = XLlFifo_RxGetWord(&DataFifo);	/* read next audio value */

					//if ( audioBytesReceived < 256 )
					//{
					//	xil_printf("Read %X\r\n", AudioValue );
					//}

					*audioBufferPtr++ = (u16) AudioValue ;

					audioBytesReceived += 1;  // actual count of audio words received

					if ( (audioBytesReceived % (AUDIO_PAGE_SIZE) ) == 0 )
					{

						CDFlashWrite( (u8 *) audioFlashBuffer, AUDIO_MESSAGE_FLASH_ADDRESS + flashOffset, AUDIO_PAGE_SIZE*2);

						flashOffset += AUDIO_PAGE_SIZE*2 ;

						audioBufferPtr = audioFlashBuffer ;		/* beginning of buffer */

					}
				}

			} while ( StoreAndFowardGo );


			// write rest of audio to flash
			//CDFlashWrite( (u8 *) audioFlashBuffer, AUDIO_MESSAGE_FLASH_ADDRESS + flashOffset, AUDIO_PAGE_SIZE*2);

			/* stop the FIFO to stream audio to the ARM */
    		n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* reset FIFO */

			xil_printf( "\r\nFinish Read Audio Data\r\n\n");


			//SendAudioFromFlashTest( audioBytesReceived ) ;

			vTaskDelay( pdMS_TO_TICKS(1000));

    	}
    	else
    	{
			vTaskDelay( pdMS_TO_TICKS(1000));

    	}
    }


}


/*  routine to send audio to PL during store and forward development */
void SendAudioFromFlashTest( int  numberWords)
{
	unsigned int i;
	unsigned int j;
	int k;
	int configmask_in ;
	u32	OffsetInFlash ;

	vTaskDelay( pdMS_TO_TICKS( 5000 ));		// initial wait

	xil_printf( "\n\nTransmit Audio TESTING\r\n");

	//SetBluetoothMode( 0x200 ) ;// send to Bluetooth = 0x200

	//n3z_tonetest_n3zconfig_write(InstancePtr, configMask + 0x10 ) ;		// temp debug set Text Flag
	//n3z_tonetest_n3zconfig_write(InstancePtr, configMask + 0x0 ) ;		// temp debug set Text Flag


	n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* stop streaming */
	n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x001010100);	/* bit 16, 17, 18 is channel and 16 = audio stream */
																		/* bit 24 tells FPGA to stream until told to stop */
	n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* stop streaming */


	//while ( 1 )
	{
		j=0;
		k=0;

		//SendMessageToPL( SEND_TRANSMIT_STATE );

		vTaskDelay( pdMS_TO_TICKS( 1000 ));		// wait for the leading warble to finish

		OffsetInFlash = AUDIO_MESSAGE_FLASH_ADDRESS ;

		for ( i=0; i<numberWords; i += AUDIO_PAGE_SIZE )		// since PL reads 64*512 samples per second should be 8 secs worth !
		{

			// do not send first 1/2 second of audio = 400 samples
			CDFlashRead( (u8 *) audioFlashBuffer,  OffsetInFlash, AUDIO_PAGE_SIZE*2);

			OffsetInFlash += AUDIO_PAGE_SIZE*2 ;

			for ( j=0; j<AUDIO_PAGE_SIZE; j++ )
			{

				audioStreamBuffer[j] = (audioFlashBuffer[j] & 0xFFFF) | 0xE0000000 ;

				//if ( i < AUDIO_PAGE_SIZE)
				{
					//xil_printf( "snd %X\r\n", audioStreamBuffer[j] );
				}

			}

				TxSend(&DataFifo, audioStreamBuffer, AUDIO_PAGE_SIZE);

				//xil_printf( "*" ) ;
		}


		//reset stream direction to normal
		//audioStreamBuffer[0] = 0x8000000 ;
		//TxSend(&DataFifo, audioStreamBuffer, 1);

		vTaskDelay( pdMS_TO_TICKS( 2000 ));		// wait for the trailing warble to finish



		//SendMessageToPL( SEND_RECEIVE_STATE );

		configmask_in = n3z_tonetest_n3zconfig_read(InstancePtr ) ;

		xil_printf( "Transmit Audio TESTING C %x\r\n\n", configmask_in);


	}
}



/*  routine to send audio to PL during store and forward development */
void SendAudioTest()
{
	unsigned int i;
	unsigned int j;
	int k;
	int configmask_in ;

    int Status = 0 ;
    int StatusLast = 0 ;

	vTaskDelay( pdMS_TO_TICKS( 10000 ));		// initial wait

	xil_printf( "\n\nTransmit Audio TESTING\r\n");

	//SetBluetoothMode( 0x200 ) ;// send to Bluetooth = 0x200

	//n3z_tonetest_n3zconfig_write(InstancePtr, configMask + 0x10 ) ;		// temp debug set Text Flag
	//n3z_tonetest_n3zconfig_write(InstancePtr, configMask + 0x0 ) ;		// temp debug set Text Flag


	n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* stop streaming */
	n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x001010100);	/* bit 16, 17, 18 is channel and 16 = audio stream */
																		/* bit 24 tells FPGA to stream until told to stop */
	n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* stop streaming */


	while ( 1 )
	{
		j=0;
		k=0;

		for (k=0; k<TEST_SEND_SIZE; k++)
		{
			j =  ((k & 0x0000000f) << 11) & 0x0000FFFF ;

			//j =  ((i & 0xFFF) << 4) & 0xFFFF ;

			audioStreamBuffer[k] = j  + 0xE0000000;
			//audioStreamBuffer[k] = 0x3333  + 0xE0000000;

		}

		SendMessageToPL( SEND_TRANSMIT_STATE );

		vTaskDelay( pdMS_TO_TICKS( 2000 ));		// wait for the leading warble to finish


		for ( i=0; i<128; i++ )		// since PL reads 64*512 samples per second should be 8 secs worth !
		{


				//xil_printf( "%d - ", XLlFifo_iTxVacancy(&DataFifo));

				//TxSend(&DataFifo, audioOutBuffer, 256);
				TxSend(&DataFifo, audioStreamBuffer, TEST_SEND_SIZE);
		}


		//reset stream direction to normal
		//audioStreamBuffer[0] = 0x8000000 ;
		//TxSend(&DataFifo, audioStreamBuffer, 1);

		SendMessageToPL( SEND_RECEIVE_STATE );


		configmask_in = n3z_tonetest_n3zconfig_read(InstancePtr ) ;

		xil_printf( "Transmit Audio TESTING C %x\r\n\n", configmask_in);

		vTaskDelay( pdMS_TO_TICKS( 5000 ));		// pause

	}
}


#endif




static void Radio_Main( void *pvParameters )
{
	//char theMessage;
	int	i;
	int	j;
	int	flashOffset;
	int	audioBytesReceived;
	int	audioValueCount ;
	u32 AudioValue ;
	u16 	*audioBufferPtr ;
	//u32 	*audioBufferOutPtr ;


	if ( ( audioFlashBuffer = pvPortMalloc( AUDIO_PAGE_SIZE*2 ) ) == NULL )
	{
		xil_printf( "MEMALLOC Failed\r\n");
		while (1);
	}

	if ( ( audioStreamBuffer = pvPortMalloc( AUDIO_PAGE_SIZE*4 ) ) == NULL )
	{
		xil_printf( "MEMALLOC Failed\r\n");
		while (1);
	}





#ifdef DEVELOP_TEST_AUDIO

	SendAudioTest() ;

#if 0
	while ( 1 )
	{
		SendAudioFromFlashTest( 64 * AUDIO_PAGE_SIZE ) ;
		vTaskDelay( pdMS_TO_TICKS( 5000 ));		// pause
	}
#endif


	//ReceiveAudioTest() ;

#endif


    while ( 1 )
    {
    	// if we are receiving then store to flash
    	if ( StoreAndForwardMode && StoreAndFowardGo )
    	{
    		audioBytesReceived = flashOffset = 0 ;

			//SetBluetoothMode( 0x400 ) ;

    		/* set the FIFO to stream audio to the ARM */
    		n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* reset FIFO */

    		//   1098 7654 3210 9876 5432 1098 7654 3210
    		//   0000 0000 1000 0001 0000 0000 0000 0000

    		n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x001010100);	/* bit 16, 17, 18 is channel and 16 = audio stream */
    																			/* bit 24 tells FPGA to stream until told to stop */

    		// while there is incoming audio data

			audioBufferPtr = audioFlashBuffer ;

			xil_printf( "\r\n\nRead Audio Data\r\n\n");

			// read the audio FIFO into the buffer
			do
			{

				audioValueCount = XLlFifo_RxOccupancy(&DataFifo) ;	/* how many values read? */

				if ( audioValueCount == 0 )
				{
					vTaskDelay( pdMS_TO_TICKS(5)); // wait for audio data to appear */
				}
				else
				for ( i=0; i<audioValueCount; i++ )
				{

					AudioValue = XLlFifo_RxGetWord(&DataFifo);	/* read next audio value */

					//if ( audioBytesReceived < 256 )
					//{
					//	xil_printf("Read %X\r\n", AudioValue );
					//}

					*audioBufferPtr++ = (u16) AudioValue ;

					audioBytesReceived += 1;  // actual count of audio values received

					if ( (audioBytesReceived % (AUDIO_PAGE_SIZE) ) == 0 )
					{

						CDFlashWrite( (u8 *) audioFlashBuffer, AUDIO_MESSAGE_FLASH_ADDRESS + flashOffset, AUDIO_PAGE_SIZE*2);

						flashOffset += AUDIO_PAGE_SIZE*2 ;

						audioBufferPtr = audioFlashBuffer ;		/* beginning of buffer */

					}
				}

			} while ( StoreAndFowardGo );


			// write rest of audio to flash
			CDFlashWrite( (u8 *) audioFlashBuffer, AUDIO_MESSAGE_FLASH_ADDRESS + flashOffset, AUDIO_PAGE_SIZE*2);

			//SetBluetoothMode( 0x200 ) ;			// send audio to Bluetooth for debug

       		n3z_tonetest_values2recover_write(ToneTestInstancePtr, 0x00000000);	/* stop streaming */

       		//reset stream direction to normal
    		//audioStreamBuffer[0] = 0x8000000 ;
    		//TxSend(&DataFifo, audioStreamBuffer, 1);


    		// if we have message stored in flash then transmit said message
    		// transmit all the audio data in flash

			xil_printf( "\n\nTransmit Audio Data %d\r\n", audioBytesReceived);

    		if ( audioBytesReceived )
    		{


    			SendMessageToPL( SEND_TRANSMIT_STATE );

    			//vTaskDelay( pdMS_TO_TICKS( 2000 ));		// wait for the leading warble to finish


    			for ( i=0; i<audioBytesReceived; i += AUDIO_PAGE_SIZE )		// since PL reads 64*512 samples per second should be 8 secs worth !
    			{

    				CDFlashRead( (u8 *) audioFlashBuffer, AUDIO_MESSAGE_FLASH_ADDRESS + (i*2), AUDIO_PAGE_SIZE*2);

    				for ( j=0; j<AUDIO_PAGE_SIZE; j++ )
    				{

    					audioStreamBuffer[j] = audioFlashBuffer[j] | 0xE0000000 ;

    					//xil_printf( "%X\r\n", audioStreamBuffer[j] ) ;

    				}

    				TxSend(&DataFifo, audioStreamBuffer, AUDIO_PAGE_SIZE);


    			}


    			//reset stream direction to normal
    			//audioStreamBuffer[0] = 0x8000000 ;
    			//TxSend(&DataFifo, audioStreamBuffer, 1);

    			SendMessageToPL( SEND_RECEIVE_STATE );

				xil_printf( "Done Transmit Audio Data\r\n");



#if 0

        		SendMessageToPL( SEND_TRANSMIT_STATE );

        		vTaskDelay( pdMS_TO_TICKS( 3000 ));		// wait for the leading warble to finish


				for ( i=0; i<audioBytesReceived; i+= AUDIO_PAGE_SIZE )
				{

					CDFlashRead( (u8 *) audioFlashBuffer, AUDIO_MESSAGE_FLASH_ADDRESS + (i * (AUDIO_PAGE_SIZE*2)), AUDIO_PAGE_SIZE*2);

					// copy from flash buffer to the audio buffer adding audio flags

					if ( (audioBytesReceived - i) < AUDIO_PAGE_SIZE )
					{
						xil_printf( "\r\nLASTBLOCK\r\n" ) ;
					}
					else
					{
						for ( j=0; j<AUDIO_PAGE_SIZE; j++ )
						{
							//*(audioStreamBuffer+j) = *(audioFlashBuffer+j) | 0xE0000000 ;
							audioStreamBuffer[j] = audioFlashBuffer[j] | 0xE0000000 ;
						}
					}

					//for ( j=0; j<AUDIO_PAGE_SIZE ; j++ )
					//{
					//	*(audioStreamBuffer+j) =  (((j & 0x1f) << 11) & 0x7FFF) | 0xE0000000 ;
					//}

					// The FIFO is read at 8kHz to transmit the audio

					//xil_printf( "%d - ", XLlFifo_iTxVacancy(&DataFifo));

					TxSend(&DataFifo, audioStreamBuffer, AUDIO_PAGE_SIZE );
					//TxSend(&DataFifo, audioStreamBuffer, TEST_SEND_SIZE);

				}

				// need to send last block....



        		vTaskDelay( pdMS_TO_TICKS( 10 ));

				xil_printf( "Done Transmit Audio Data\r\n");


    			SendMessageToPL( SEND_RECEIVE_STATE );
#endif

    		}
    	}
    	else
    	{
    		vTaskDelay( pdMS_TO_TICKS( 50 ));
    	}

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

void SetForwardMode(int selected)
{
	extern int StoreAndForwardMode;

	if ( selected == 0 )
	{
		StoreAndForwardMode = FALSE;

		SetToneDetect( 0 ) ;		// also have Tone Detect off


		xil_printf( "Audio Forward disabled\r\n");
	}
	else
	{
		StoreAndForwardMode = TRUE;

		SetToneDetect( 1 ) ;		// must also have Tone Detect on

		xil_printf( "Audio forward enabled\r\n");
	}

}


// The N3Z config bits:
// 0:2		not used for frequency now - N3Z frequency (1=Heyphone; 2=N2; 3=31kHz ...)
// 3		If 1 force ARM_ADC channel to 1 (ie not 0) which is the one used by the microphone or loop aerial (note this is heavy handed as the user pico normally controlls this)
// 4		Switch to text mode (currently doesn't go anywhere)
// 5,6		Beacon Select  (currently doesn't go anywhere) - for location beacon modes
// 7		Turn tone detect off - 1 = tone off; 0 = tone on

// The bits 9-11 are by default 0 which gives the normal signal that goes to the handset speaker. Other options are:
// 	1 Data streamed from ARM to PL over the DataFifo
// 	2 Data being streamed from PL to ARM over DataFifo to be stored in flash for recovery later.
// 	3 and higher currently as 2


void SetToneDetect(int selected )
{

	if ( selected == 0 )
	{
		//toneDetectMask = 0x80;
		configMask |= 0x80;

		xil_printf( "Set Tone det off\r\n");
	}
	else
	{
		configMask &= (~0x80) ;

		xil_printf( "Set Tone det on\r\n");
	}

	n3z_tonetest_n3zconfig_write(InstancePtr, configMask ) ;

}


void SetBluetoothMode(int BT_Debug )
{
	// The bits 9-11 are by default 0 which gives the normal signal that goes to the handset speaker. Other options are:
	// 1 Data streamed from ARM to PL over the DataFifo
	// 2 Data being streamed from PL to ARM over DataFifo to be stored in flash for recovery later.
	// 3 and higher currently as 2

	n3z_tonetest_n3zconfig_write(InstancePtr, configMask | BT_Debug ) ;

}


void SetAerialFrequency(int selected )
{
	int	TXfrequency = selected &0xFFFF ;
	int	RXfrequency = (selected>>16) &0xFFFF ;

	////frequencyMask = selected ;

	xil_printf( "Frequency set to TX %x and RX %x\r\n", TXfrequency, RXfrequency );

	n3z_tonetest_txfreq_write(InstancePtr, TXfrequency ) ;
	n3z_tonetest_rxfreq_write(InstancePtr, RXfrequency ) ;

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




