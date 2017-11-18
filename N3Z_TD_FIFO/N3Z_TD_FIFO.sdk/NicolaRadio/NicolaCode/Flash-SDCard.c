


/* Standard includes. */
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdio.h>

/* Xilinx library includes. */
#include "xparameters.h"
#include "xil_types.h"
#include "xsdps.h"		/* SD device driver */
//#include "xsdps_info.h"	/* SD info */

/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "portmacro.h"

/***************************** Include Files *********************************/
#include "xsdps.h"


#define STA_NOINIT		0x01	/* Drive not initialized */
#define STA_NODISK		0x02	/* No medium in the drive */
#define STA_PROTECT		0x04	/* Write protected */

#define SD_DEVICE_ID					XPAR_XSDPS_0_DEVICE_ID
#define HIGH_SPEED_SUPPORT				0x01
#define WIDTH_4_BIT_SUPPORT				0x4
#define SD_CLK_12_MHZ					12000000
#define SD_CLK_25_MHZ					25000000
#define SD_CLK_26_MHZ					26000000
#define SD_CLK_52_MHZ					52000000
#define EXT_CSD_DEVICE_TYPE_BYTE		196
#define EXT_CSD_4_BIT_WIDTH_BYTE		183
#define EXT_CSD_HIGH_SPEED_BYTE			185
#define EXT_CSD_DEVICE_TYPE_HIGH_SPEED	0x3

#define HUNDRED_64_BIT			100ULL
#define BYTES_PER_MB			( 1024ull * 1024ull )
#define SECTORS_PER_MB			( BYTES_PER_MB / 512ull )


static int vSDMMC_Status( int iDriveNumber );

static int sd_disk_status = STA_NOINIT;	/* Disk status */

static XSdPs xSDCardInstance;
static XSdPs *pxSDCardInstance = &xSDCardInstance;


int CDCardInit()
{
	int 			Status;
	XSdPs_Config 	*SdConfig;


	/* Initialize the host controller */
	SdConfig = XSdPs_LookupConfig(XPAR_XSDPS_0_DEVICE_ID);
	if( SdConfig == NULL )
	{
		return FALSE;
	}


	if( XSdPs_CfgInitialize(pxSDCardInstance, SdConfig, SdConfig->BaseAddress) != XST_SUCCESS )
	{
		return FALSE;
	}

	#if( ffconfigSDIO_DRIVER_USES_INTERRUPT != 0 )
	{
		vInstallInterrupt();
	}
	#endif	/* ffconfigSDIO_DRIVER_USES_INTERRUPT */


	if( XSdPs_CardInitialize( pxSDCardInstance ) != XST_SUCCESS )
	{
		return FALSE;
	}


	/* Check if card is in the socket */
	Status = vSDMMC_Status( 0 );
	if( ( Status & STA_NODISK ) != 0 )
	{
		return FALSE;
	}


	/* Disk is initialized OK: clear the 'STA_NOINIT' bit. */
	Status &= ~( STA_NOINIT );



	return TRUE;

}


void CDFlashRead( u8 *writeToAddress, u32 flashAddress, u32 numberOfBytes)
{
	u32 blockCount = (numberOfBytes+511)/512;

	if ( numberOfBytes > 0 )
	{
		if ( XSdPs_ReadPolled( pxSDCardInstance, flashAddress, blockCount, writeToAddress) != XST_SUCCESS )
		{
			xil_printf( "CD CARD READ FAILED\r\n" );
		}
	}
}


void CDFlashWrite( u8 *writeToAddress, u32 flashAddress, u32 numberOfBytes)
{

	u32 blockCount = (numberOfBytes+511)/512;

	if ( numberOfBytes > 0 )
	{
		if ( XSdPs_WritePolled( pxSDCardInstance, flashAddress, blockCount, writeToAddress) != XST_SUCCESS )
		{
			xil_printf( "CD CARD READ FAILED\r\n" );
		}
	}
}

static int vSDMMC_Status( int iDriveNumber )
{
int iStatus = sd_disk_status;
u32 ulStatusReg;

	/*_RB_ Function name not following convention, parameter not used, parameter
	using plain int type. */
	( void ) iDriveNumber;

	ulStatusReg = XSdPs_GetPresentStatusReg( XPAR_XSDPS_0_BASEADDR );
	if( ( ulStatusReg & XSDPS_PSR_CARD_INSRT_MASK ) == 0 )
	{
		iStatus = STA_NODISK | STA_NOINIT;
	}
	else
	{
		iStatus &= ~STA_NODISK;
		if( ( ulStatusReg & XSDPS_PSR_WPS_PL_MASK ) != 0 )
		{
			iStatus &= ~STA_PROTECT;
		}
		else
		{
			iStatus |= STA_PROTECT;
		}
	}

	sd_disk_status = iStatus;
	return iStatus;
}


