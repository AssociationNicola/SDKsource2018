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
** File Name : main.c
** Overview : provides the System Initialisation and the RTOS routines as above
** Identity :
** Modif. History :
**
**	Version:	Date:	Author:	Reason:
**	00.0A	May 2016	PA		Original Version
** All Rights Reserved(c) Association Nicola, Graham Naylor, Pete Allwright



*****************************************************************************/

// Bluetooth disabled

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


#include "NicolaTypes.h"


// fsbl

#if 0


#include "fsbl.h"
#include "qspi.h"
#include "nand.h"
#include "nor.h"
#include "sd.h"
#include "pcap.h"
#include "image_mover.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xil_exception.h"
#include "xstatus.h"
#include "fsbl_hooks.h"
#include "xtime_l.h"

#ifdef XPAR_XWDTPS_0_BASEADDR
#include "xwdtps.h"
#endif

#ifdef STDOUT_BASEADDRESS
#ifdef XPAR_XUARTPS_0_BASEADDR
#include "xuartps_hw.h"
#endif
#endif

#ifdef RSA_SUPPORT
#include "rsa.h"
#endif

/************************** Constant Definitions *****************************/

#ifdef XPAR_XWDTPS_0_BASEADDR
#define WDT_DEVICE_ID		XPAR_XWDTPS_0_DEVICE_ID
#define WDT_EXPIRE_TIME		100
#define WDT_CRV_SHIFT		12
#endif

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

#ifdef XPAR_XWDTPS_0_BASEADDR
XWdtPs Watchdog;		/* Instance of WatchDog Timer	*/
#endif
/************************** Function Prototypes ******************************/
extern int ps7_init();
extern char* getPS7MessageInfo(unsigned key);
#ifdef PS7_POST_CONFIG
extern int ps7_post_config();
#endif

static void Update_MultiBootRegister(void);
/* Exception handlers */
static void RegisterHandlers(void);
static void Undef_Handler (void);
static void SVC_Handler (void);
static void PreFetch_Abort_Handler (void);
static void Data_Abort_Handler (void);
static void IRQ_Handler (void);
static void FIQ_Handler (void);


#ifdef XPAR_XWDTPS_0_BASEADDR
int InitWatchDog(void);
u32 ConvertTime_WdtCounter(u32 seconds);
void  CheckWDTReset(void);
#endif

u32 NextValidImageCheck(void);

u32 DDRInitCheck(void);

/************************** Variable Definitions *****************************/
/*
 * Base Address for the Read Functionality for Image Processing
 */
u32 FlashReadBaseAddress = 0;
/*
 * Silicon Version
 */
u32 Silicon_Version;

/*
 * Boot Device flag
 */
u8 LinearBootDeviceFlag=0;

u32 PcapCtrlRegVal;

u8 SystemInitFlag;

extern ImageMoverType MoveImage;
extern XDcfg *DcfgInstPtr;
extern u8 BitstreamFlag;
#ifdef XPAR_PS7_QSPI_LINEAR_0_S_AXI_BASEADDR
extern u32 QspiFlashSize;
#endif

// end fsbl

#endif




/*-----------------------------------------------------------*/
/*-----------------------------------------------------------*/
/*-----------------------------------------------------------*/


						// 6 chars for version no; rest for date
						//   01234567890123456
char *VersionStringStart = 	"0.1dev dd mmm yy";
char VersionString[18];

							// 012345678901
char *thisDate = __DATE__ ;	// mmm dd yyyy
char *thisTime = __TIME__ ;


/*-----------------------------------------------------------*/
/*-----------------------------------------------------------*/
/*-----------------------------------------------------------*/

NICOLA_SETTINGS_DATA thisNicolaSettings;

/*
 * Configure the hardware as necessary to run this demo.
 */
static void prvSetupHardware( void );

void tempFSBLCode();



/*
 * The Xilinx projects use a BSP that do not allow the start up code to be
 * altered easily.  Therefore the vector table used by FreeRTOS is defined in
 * FreeRTOS_asm_vectors.S, which is part of this project.  Switch to use the
 * FreeRTOS vector table.
 */
extern void vPortInstallFreeRTOSVectorTable( void );

/* Prototypes for the standard FreeRTOS callback/hook functions implemented
within this file. */
void vApplicationMallocFailedHook( void );
void vApplicationIdleHook( void );
void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName );
void vApplicationTickHook( void );

/*-----------------------------------------------------------*/

/* The interrupt controller is initialised in this file, and made available to
other modules. */
XScuGic xInterruptController;

/* The private watchdog is used as the timer that generates run time
stats.  This frequency means it will overflow quite quickly. */
XScuWdt xWatchDogInstance;


/*-----------------------------------------------------------*/

/* Nicola definitions etc */

extern void PSPLComms_Initialise();
extern void BluetoothStartup();
extern void LCD_Startup();
extern void TextMessageStartup();
extern void Flash_Startup(void);
extern int  FlashInit();
extern void RadioInterfaceInit( );
extern void DebugingGraham_Startup();

//#define COPY_DATA_SECTION


#ifndef DEBUG_CODE
#define COPY_DATA_SECTION
#endif

#ifdef COPY_DATA_SECTION

extern char _dataLMA, _dataVMA_start, _dataVMA_end;

static void copy(char *src, char *dstStart, char *dstEnd) {
	/* ROM has data at end of text; copy it. */
	while (dstStart < dstEnd)
	{

		*dstStart++ = *src++;
		asm volatile ("dsb sy");

	}
}

#endif




int main( void )
{
#ifdef COPY_DATA_SECTION

	unsigned int *modifiedLMAAddress;
	//int i;
	int warningInReleaseBuild = 0;		// generate a warning in the release build to show code generated

	xil_printf("\r\nSTART\r\n" );
	//for ( i=0; i<5000000; i++);

	//while(1);

	modifiedLMAAddress = (unsigned int *) &_dataLMA ;

	while ( *modifiedLMAAddress == 0xFFFFFFFF ) modifiedLMAAddress++;


#if 0
	xil_printf("\r\nCopy from %d\r\n",  modifiedLMAAddress);

	for ( i=0; i<5000000; i++);

	xil_printf("Link LMA is %d\r\n",  &_dataLMA);

	for ( i=0; i<5000000; i++);

	xil_printf("to %d\r\n", &_dataVMA_start);

	for ( i=0; i<5000000; i++);

	xil_printf("end %d\r\n\r\n", &_dataVMA_end );

	for ( i=0; i<5000000; i++);
#endif

	//while(1);

	copy( (char *) modifiedLMAAddress, &_dataVMA_start, &_dataVMA_end);
	//copy( &_dataLMA,&_dataVMA_start,&_dataVMA_end);

	//while(1);

	xil_printf("\r\nCOPIED\r\n" );
	//for ( i=0; i<5000000; i++);
	//for ( i=0; i<5000000; i++);
	//for ( i=0; i<5000000; i++);

#endif


	ps7_init();

	/* See http://www.freertos.org/RTOS-Xilinx-Zynq.html for instructions. */

	/* Configure the hardware ready to run. */


	prvSetupHardware();

	memcpy( VersionString, VersionStringStart, 18 ) ;

	thisNicolaSettings.thisNicolaID = 0;
	strcpy( thisNicolaSettings.thisNicolaName, "NICOLADEFAULT");
	strcpy( thisNicolaSettings.thisNicolaLocation, "NOT CHANGED");

	thisNicolaSettings.microphoneVolume = 50 ;		//
	thisNicolaSettings.aerialType = 0 ;				// earthed
	thisNicolaSettings.aerialFrequency = 1 ;		// HEYPhone
	thisNicolaSettings.toneDetectSelected = 0 ;		// tone detect off
	thisNicolaSettings.confidenceBeepTime = 0 ;		// no confidence beep



	ConsoleStartup();			/* serial port interface */

	PSPLComms_Initialise();

	//uart_SendByte(STDOUT_BASEADDRESS, '2' );


	//FlashDump();

	//FlashInit();				/* after console start for debug messages */

	CDCardInit() ;

	//uart_SendByte(STDOUT_BASEADDRESS, '3' );


	LCD_Startup();				/* reads menu and default settings */

	//uart_SendByte(STDOUT_BASEADDRESS, '4' );


	// Disable for debug

	BluetoothStartup();			// to Bluetooth devices of all kinds

	//uart_SendByte(STDOUT_BASEADDRESS, '5' );


	TextMessageStartup();		// text message handling

	//uart_SendByte(STDOUT_BASEADDRESS, '6' );

	//DebugingGraham_Startup();		// start the streaming debug interface

	RadioInterfaceInit();		// start the PL to PS comms here




	//Flash_Startup();  THIS IS THE TEST FLASH TASK ONLY.

	/* Start the tasks and timer running. */
	vTaskStartScheduler();




	/* Don't expect to reach here. */
	return 0;
}


void tempFSBLCode()
{

#if 0

	u32 BootModeRegister = 0;
	u32 HandoffAddress = 0;
	u32 Status = XST_SUCCESS;

	/*
	 * PCW initialization for MIO,PLL,CLK and DDR
	 */

#if 0
	Status = ps7_init();
	if (Status != FSBL_PS7_INIT_SUCCESS) {
		fsbl_printf(DEBUG_GENERAL,"PS7_INIT_FAIL : %s\r\n",
						getPS7MessageInfo(Status));
		OutputStatus(PS7_INIT_FAIL);
		/*
		 * Calling FsblHookFallback instead of Fallback
		 * since, devcfg driver is not yet initialized
		 */
		FsblHookFallback();
	}
#endif


	/*
	 * Unlock SLCR for SLCR register write
	 */
	SlcrUnlock();

	//uart_SendByte(STDOUT_BASEADDRESS, 'A' );


	/* If Performance measurement is required
	 * then read the Global Timer value , Please note that the
	 * time taken for mio, clock and ddr initialisation
	 * done in the ps7_init function is not accounted in the FSBL
	 *
	 */
#ifdef FSBL_PERF
	XTime tCur = 0;
	FsblGetGlobalTime(&tCur);
#endif

	/*
	 * Flush the Caches
	 */
	Xil_DCacheFlush();

	/*
	 * Disable Data Cache
	 */
	Xil_DCacheDisable();

	/*
	 * Register the Exception handlers
	 */
	RegisterHandlers();

	/*
	 * Print the FSBL Banner
	 */
	fsbl_printf(DEBUG_GENERAL,"\n\rXilinx First Stage Boot Loader \n\r");
	fsbl_printf(DEBUG_GENERAL,"Release %d.%d	%s-%s\r\n",
			SDK_RELEASE_YEAR, SDK_RELEASE_QUARTER,
			__DATE__,__TIME__);

	/*
	 * TE-Modification: Modified FSBL to run on DDR Less Zynq PS
	 * https://wiki.trenz-electronic.de/display/PD/DDR+less+ZYNQ+Design
	 */

#define XPAR_PS7_DDR_0_S_AXI_BASEADDR 0
#ifdef XPAR_PS7_DDR_0_S_AXI_BASEADDR

    /*
     * DDR Read/write test
     */
	// Status = DDRInitCheck();
	if (Status == XST_FAILURE) {
		fsbl_printf(DEBUG_GENERAL,"DDR_INIT_FAIL \r\n");
		/* Error Handling here */
		//OutputStatus(DDR_INIT_FAIL);
		/*
		 * Calling FsblHookFallback instead of Fallback
		 * since, devcfg driver is not yet initialized
		 */
		FsblHookFallback();
	}


	/*
	 * PCAP initialization
	 */
	Status = InitPcap();
	if (Status == XST_FAILURE) {
		fsbl_printf(DEBUG_GENERAL,"PCAP_INIT_FAIL \n\r");
		OutputStatus(PCAP_INIT_FAIL);
		/*
		 * Calling FsblHookFallback instead of Fallback
		 * since, devcfg driver is not yet initialized
		 */
		FsblHookFallback();
	}

	fsbl_printf(DEBUG_INFO,"Devcfg driver initialized \r\n");

	/*
	 * Get the Silicon Version
	 */
	GetSiliconVersion();

#ifdef XPAR_XWDTPS_0_BASEADDR
	/*
	 * Check if WDT Reset has occurred or not
	 */
	CheckWDTReset();

	/*
	 * Initialize the Watchdog Timer so that it is ready to use
	 */
	Status = InitWatchDog();
	if (Status == XST_FAILURE) {
		fsbl_printf(DEBUG_GENERAL,"WATCHDOG_INIT_FAIL \n\r");
		OutputStatus(WDT_INIT_FAIL);
		FsblFallback();
	}
	fsbl_printf(DEBUG_INFO,"Watchdog driver initialized \r\n");
#endif

	/*
	 * Get PCAP controller settings
	 */
	PcapCtrlRegVal = XDcfg_GetControlRegister(DcfgInstPtr);

	/*
	 * Check for AES source key
	 */
	if (PcapCtrlRegVal & XDCFG_CTRL_PCFG_AES_FUSE_MASK) {
		/*
		 * For E-Fuse AES encryption Watch dog Timer disabled and
		 * User not allowed to do system reset
		 */
#ifdef	XPAR_XWDTPS_0_BASEADDR
		fsbl_printf(DEBUG_INFO,"Watchdog Timer Disabled\r\n");
		XWdtPs_Stop(&Watchdog);
#endif
		fsbl_printf(DEBUG_INFO,"User not allowed to do "
								"any system resets\r\n");
	}

	/*
	 * Store FSBL run state in Reboot Status Register
	 */
	MarkFSBLIn();

	/*
	 * Read bootmode register
	 */
	BootModeRegister = Xil_In32(BOOT_MODE_REG);
	BootModeRegister &= BOOT_MODES_MASK;

	//uart_SendByte(STDOUT_BASEADDRESS, 'A' + BootModeRegister );

	/*
	 * QSPI BOOT MODE
	 */
#ifdef XPAR_PS7_QSPI_LINEAR_0_S_AXI_BASEADDR

#ifdef MMC_SUPPORT
	/*
	 * To support MMC boot
	 * QSPI boot mode detection ignored
	 */
	if (BootModeRegister == QSPI_MODE) {
		BootModeRegister = MMC_MODE;
	}
#endif

	if (BootModeRegister == QSPI_MODE) {
		//fsbl_printf(DEBUG_GENERAL,"Boot mode is QSPI\n\r");
		//uart_SendByte(STDOUT_BASEADDRESS, '1' );
		InitQspi();
		MoveImage = QspiAccess;
		//fsbl_printf(DEBUG_INFO,"QSPI Init Done \r\n");
	} else
#endif

	/*
	 * NAND BOOT MODE
	 */
#ifdef XPAR_PS7_NAND_0_BASEADDR
	if (BootModeRegister == NAND_FLASH_MODE) {
		/*
	 	* Boot ROM always initialize the nand at lower speed
	 	* This is the chance to put it to an optimum speed for your nand
	 	* device
	 	*/
		fsbl_printf(DEBUG_GENERAL,"Boot mode is NAND\n");

		Status = InitNand();
		if (Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL,"NAND_INIT_FAIL \r\n");
			/*
			 * Error Handling here
			 */
			OutputStatus(NAND_INIT_FAIL);
			FsblFallback();
		}
		MoveImage = NandAccess;
		fsbl_printf(DEBUG_INFO,"NAND Init Done \r\n");
	} else
#endif

	/*
	 * NOR BOOT MODE
	 */
	if (BootModeRegister == NOR_FLASH_MODE) {
		fsbl_printf(DEBUG_GENERAL,"Boot mode is NOR\n\r");
		/*
		 * Boot ROM always initialize the nor at lower speed
		 * This is the chance to put it to an optimum speed for your nor
		 * device
		 */
		InitNor();
		fsbl_printf(DEBUG_INFO,"NOR Init Done \r\n");
		MoveImage = NorAccess;
	} else

	/*
	 * SD BOOT MODE
	 */
#if defined(XPAR_PS7_SD_0_S_AXI_BASEADDR) || defined(XPAR_XSDPS_0_BASEADDR)

	if (BootModeRegister == SD_MODE) {
		fsbl_printf(DEBUG_GENERAL,"Boot mode is SD\r\n");

		/*
		 * SD initialization returns file open error or success
		 */
		Status = InitSD("BOOT.BIN");
		if (Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL,"SD_INIT_FAIL\r\n");
			OutputStatus(SD_INIT_FAIL);
			FsblFallback();
		}
		MoveImage = SDAccess;
		fsbl_printf(DEBUG_INFO,"SD Init Done \r\n");
	} else

	if (BootModeRegister == MMC_MODE) {
		fsbl_printf(DEBUG_GENERAL,"Booting Device is MMC\r\n");

		/*
		 * MMC initialization returns file open error or success
		 */
		Status = InitSD("BOOT.BIN");
		if (Status != XST_SUCCESS) {
			fsbl_printf(DEBUG_GENERAL,"MMC_INIT_FAIL\r\n");
			OutputStatus(SD_INIT_FAIL);
			FsblFallback();
		}
		MoveImage = SDAccess;
		fsbl_printf(DEBUG_INFO,"MMC Init Done \r\n");
	} else

#endif

	/*
	 * JTAG  BOOT MODE
	 */
	if (BootModeRegister == JTAG_MODE) {
		fsbl_printf(DEBUG_GENERAL,"Boot mode is JTAG\r\n");
		/*
		 * Stop the Watchdog before JTAG handoff
		 */
#ifdef	XPAR_XWDTPS_0_BASEADDR
		XWdtPs_Stop(&Watchdog);
#endif
		/*
		 * Clear our mark in reboot status register
		 */
		ClearFSBLIn();

		/*
		 * SLCR lock
		 */
		SlcrLock();

		FsblHandoffJtagExit();
	} else {
		fsbl_printf(DEBUG_GENERAL,"ILLEGAL_BOOT_MODE \r\n");
		OutputStatus(ILLEGAL_BOOT_MODE);
		/*
		 * fallback starts, no return
		 */
		FsblFallback();
	}

	fsbl_printf(DEBUG_INFO,"Flash Base Address: 0x%08lx\r\n", FlashReadBaseAddress);

	/*
	 * Check for valid flash address
	 */
	if ((FlashReadBaseAddress != XPS_QSPI_LINEAR_BASEADDR) &&
			(FlashReadBaseAddress != XPS_NAND_BASEADDR) &&
			(FlashReadBaseAddress != XPS_NOR_BASEADDR) &&
			(FlashReadBaseAddress != XPS_SDIO0_BASEADDR)) {
		fsbl_printf(DEBUG_GENERAL,"INVALID_FLASH_ADDRESS \r\n");
		OutputStatus(INVALID_FLASH_ADDRESS);
		FsblFallback();
	}

	/*
	 * NOR and QSPI (parallel) are linear boot devices
	 */
	if ((FlashReadBaseAddress == XPS_NOR_BASEADDR)) {
		fsbl_printf(DEBUG_INFO, "Linear Boot Device\r\n");
		LinearBootDeviceFlag = 1;
	}

#ifdef	XPAR_XWDTPS_0_BASEADDR
	/*
	 * Prevent WDT reset
	 */
	XWdtPs_RestartWdt(&Watchdog);
#endif

	/*
	 * This used only in case of E-Fuse encryption
	 * For image search
	 */
	SystemInitFlag = 1;

	/*
	 * Load boot image
	 */
	HandoffAddress = LoadBootImage();

	fsbl_printf(DEBUG_INFO,"Handoff Address: 0x%08lx\r\n",HandoffAddress);

	/*
	 * For Performance measurement
	 */
#ifdef FSBL_PERF
	XTime tEnd = 0;
	fsbl_printf(DEBUG_GENERAL,"Total Execution time is ");
	FsblMeasurePerfTime(tCur,tEnd);
#endif

	/*
	 * FSBL handoff to valid handoff address or
	 * exit in JTAG
	 */
	FsblHandoff(HandoffAddress);

#else
	OutputStatus(NO_DDR);
	FsblFallback();
#endif


#endif

}



char *GetVersionString()
{
	memcpy( &VersionString[7], &thisDate[4], 3 );
	memcpy( &VersionString[10], thisDate, 4 );
	memcpy( &VersionString[14], &thisDate[9], 2 );

	return VersionString ;
}


/*-----------------------------------------------------------*/

static void prvSetupHardware( void )
{
BaseType_t xStatus;
XScuGic_Config *pxGICConfig;

	/* Ensure no interrupts execute while the scheduler is in an inconsistent
	state.  Interrupts are automatically enabled when the scheduler is
	started. */
	portDISABLE_INTERRUPTS();

	/* Obtain the configuration of the GIC. */
	pxGICConfig = XScuGic_LookupConfig( XPAR_SCUGIC_SINGLE_DEVICE_ID );

	/* Sanity check the FreeRTOSConfig.h settings are correct for the
	hardware. */
	configASSERT( pxGICConfig );
	configASSERT( pxGICConfig->CpuBaseAddress == ( configINTERRUPT_CONTROLLER_BASE_ADDRESS + configINTERRUPT_CONTROLLER_CPU_INTERFACE_OFFSET ) );
	configASSERT( pxGICConfig->DistBaseAddress == configINTERRUPT_CONTROLLER_BASE_ADDRESS );

	/* Install a default handler for each GIC interrupt. */
	xStatus = XScuGic_CfgInitialize( &xInterruptController, pxGICConfig, pxGICConfig->CpuBaseAddress );
	configASSERT( xStatus == XST_SUCCESS );
	( void ) xStatus; /* Remove compiler warning if configASSERT() is not defined. */

	/* Initialise the LED port. */
	//vParTestInitialise();

	/* The Xilinx projects use a BSP that do not allow the start up code to be
	altered easily.  Therefore the vector table used by FreeRTOS is defined in
	FreeRTOS_asm_vectors.S, which is part of this project.  Switch to use the
	FreeRTOS vector table. */

	vPortInstallFreeRTOSVectorTable();

}
/*-----------------------------------------------------------*/

void vApplicationMallocFailedHook( void )
{
	/* Called if a call to pvPortMalloc() fails because there is insufficient
	free memory available in the FreeRTOS heap.  pvPortMalloc() is called
	internally by FreeRTOS API functions that create tasks, queues, software
	timers, and semaphores.  The size of the FreeRTOS heap is set by the
	configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{
volatile size_t xFreeHeapSpace, xMinimumEverFreeHeapSpace;

	/* This is just a trivial example of an idle hook.  It is called on each
	cycle of the idle task.  It must *NOT* attempt to block.  In this case the
	idle task just queries the amount of FreeRTOS heap that remains.  See the
	memory management section on the http://www.FreeRTOS.org web site for memory
	management options.  If there is a lot of heap memory free then the
	configTOTAL_HEAP_SIZE value in FreeRTOSConfig.h can be reduced to free up
	RAM. */
	xFreeHeapSpace = xPortGetFreeHeapSize();
	xMinimumEverFreeHeapSpace = xPortGetMinimumEverFreeHeapSize();

	/* Remove compiler warning about xFreeHeapSpace being set but never used. */
	( void ) xFreeHeapSpace;
	( void ) xMinimumEverFreeHeapSpace;
}
/*-----------------------------------------------------------*/

void vAssertCalled( const char * pcFile, unsigned long ulLine )
{
volatile unsigned long ul = 0;

	( void ) pcFile;
	( void ) ulLine;

	taskENTER_CRITICAL();
	{
		/* Set ul to a non-zero value using the debugger to step out of this
		function. */
		while( ul == 0 )
		{
			portNOP();
		}
	}
	taskEXIT_CRITICAL();
}
/*-----------------------------------------------------------*/

void vApplicationTickHook( void )
{
	#if( mainSELECTED_APPLICATION == 1 )
	{
		/* The full demo includes a software timer demo/test that requires
		prodding periodically from the tick interrupt. */
		vTimerPeriodicISRTests();

		/* Call the periodic queue overwrite from ISR demo. */
		vQueueOverwritePeriodicISRDemo();

		/* Call the periodic event group from ISR demo. */
		vPeriodicEventGroupsProcessing();

		/* Use task notifications from an interrupt. */
		xNotifyTaskFromISR();

		/* Use mutexes from interrupts. */
		vInterruptSemaphorePeriodicTest();
	}
	#endif
}
/*-----------------------------------------------------------*/

#if 0

void *memcpy( void *pvDest, const void *pvSource, size_t xBytes )
{
/* The compiler used during development seems to err unless these volatiles are
included at -O3 optimisation.  */
volatile unsigned char *pcDest = ( volatile unsigned char * ) pvDest, *pcSource = ( volatile unsigned char * ) pvSource;
size_t x;

	/* Extremely crude standard library implementations in lieu of having a C
	library. */
	if( pvDest != pvSource )
	{
		for( x = 0; x < xBytes; x++ )
		{
			pcDest[ x ] = pcSource[ x ];
		}
	}

	return pvDest;
}
/*-----------------------------------------------------------*/

void *memset( void *pvDest, int iValue, size_t xBytes )
{
/* The compiler used during development seems to err unless these volatiles are
included at -O3 optimisation.  */
volatile unsigned char * volatile pcDest = ( volatile unsigned char * volatile ) pvDest;
volatile size_t x;

	/* Extremely crude standard library implementations in lieu of having a C
	library. */
	for( x = 0; x < xBytes; x++ )
	{
		pcDest[ x ] = ( unsigned char ) iValue;
	}

	return pvDest;
}
/*-----------------------------------------------------------*/

int memcmp( const void *pvMem1, const void *pvMem2, size_t xBytes )
{
const volatile unsigned char *pucMem1 = pvMem1, *pucMem2 = pvMem2;
volatile size_t x;

	/* Extremely crude standard library implementations in lieu of having a C
	library. */
	for( x = 0; x < xBytes; x++ )
	{
		if( pucMem1[ x ] != pucMem2[ x ] )
		{
			break;
		}
	}

	return xBytes - x;
}

#endif

/*-----------------------------------------------------------*/



void vInitialiseTimerForRunTimeStats( void )
{
XScuWdt_Config *pxWatchDogInstance;
uint32_t ulValue;
const uint32_t ulMaxDivisor = 0xff, ulDivisorShift = 0x08;

	 pxWatchDogInstance = XScuWdt_LookupConfig( XPAR_SCUWDT_0_DEVICE_ID );
	 XScuWdt_CfgInitialize( &xWatchDogInstance, pxWatchDogInstance, pxWatchDogInstance->BaseAddr );

	 ulValue = XScuWdt_GetControlReg( &xWatchDogInstance );
	 ulValue |= ulMaxDivisor << ulDivisorShift;
	 XScuWdt_SetControlReg( &xWatchDogInstance, ulValue );

	 XScuWdt_LoadWdt( &xWatchDogInstance, UINT_MAX );
	 XScuWdt_SetTimerMode( &xWatchDogInstance );
	 XScuWdt_Start( &xWatchDogInstance );
}




/*-----------------------------------------------------------*/

/* configUSE_STATIC_ALLOCATION is set to 1, so the application must provide an
implementation of vApplicationGetIdleTaskMemory() to provide the memory that is
used by the Idle task. */
void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize )
{
/* If the buffers to be provided to the Idle task are declared inside this
function then they must be declared static - otherwise they will be allocated on
the stack and so not exists after this function exits. */
static StaticTask_t xIdleTaskTCB;
static StackType_t uxIdleTaskStack[ configMINIMAL_STACK_SIZE ];

	/* Pass out a pointer to the StaticTask_t structure in which the Idle task's
	state will be stored. */
	*ppxIdleTaskTCBBuffer = &xIdleTaskTCB;

	/* Pass out the array that will be used as the Idle task's stack. */
	*ppxIdleTaskStackBuffer = uxIdleTaskStack;

	/* Pass out the size of the array pointed to by *ppxIdleTaskStackBuffer.
	Note that, as the array is necessarily of type StackType_t,
	configMINIMAL_STACK_SIZE is specified in words, not bytes. */
	*pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
}
/*-----------------------------------------------------------*/

/* configUSE_STATIC_ALLOCATION and configUSE_TIMERS are both set to 1, so the
application must provide an implementation of vApplicationGetTimerTaskMemory()
to provide the memory that is used by the Timer service task. */
void vApplicationGetTimerTaskMemory( StaticTask_t **ppxTimerTaskTCBBuffer, StackType_t **ppxTimerTaskStackBuffer, uint32_t *pulTimerTaskStackSize )
{
/* If the buffers to be provided to the Timer task are declared inside this
function then they must be declared static - otherwise they will be allocated on
the stack and so not exists after this function exits. */
static StaticTask_t xTimerTaskTCB;
static StackType_t uxTimerTaskStack[ configTIMER_TASK_STACK_DEPTH ];

	/* Pass out a pointer to the StaticTask_t structure in which the Timer
	task's state will be stored. */
	*ppxTimerTaskTCBBuffer = &xTimerTaskTCB;

	/* Pass out the array that will be used as the Timer task's stack. */
	*ppxTimerTaskStackBuffer = uxTimerTaskStack;

	/* Pass out the size of the array pointed to by *ppxTimerTaskStackBuffer.
	Note that, as the array is necessarily of type StackType_t,
	configMINIMAL_STACK_SIZE is specified in words, not bytes. */
	*pulTimerTaskStackSize = configTIMER_TASK_STACK_DEPTH;
}







