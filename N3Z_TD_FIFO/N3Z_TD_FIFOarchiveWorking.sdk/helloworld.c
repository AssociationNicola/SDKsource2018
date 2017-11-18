/*******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

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





#define AudioVolume  133
/* Initial AudioVolume was 133
 *
 */


/*#define printf            xil_printf    Smalller foot-print printf */





#include "xil_cache.h"

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


/************************** Variable Definitions *****************************/

/*
 * The following are declared globally so they are zeroed and so they are
 * easily accessible from a debugger
 */

 /* Device instance definitions
 */

XLlFifo DataFifo;
XLlFifo PSPLFifo;

static u32 *Buffer;

u32 DestinationBuffer[32 * WORD_SIZE];



int main()
{
	int i;
    int read_out =0;
    int keyval;
    int samplenumber;
    int DataValue;
    char from_keyboard[10];
    int numberofsamples;
    int read_in =0;
    static u32 ReceiveLength;
    static u32 DataStreamSpec;
    int Status;
    int Value;

    Buffer  = malloc(512 * sizeof(*Buffer));
    XLlFifo_Config *ConfigData;
    XLlFifo_Config *ConfigPSPL;

    u8 RecvChar;
    u32 CntrlRegister;

    CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

    	/* Enable TX and RX for the device */
    XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
    				((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
    				  XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));






    ConfigData=XLlFfio_LookupConfig(DataFIFO_DEV_ID);
    ConfigPSPL=XLlFfio_LookupConfig(PS_PLFIFO_DEV_ID);
    Status=XLlFifo_CfgInitialize(&DataFifo,ConfigData,ConfigData->BaseAddress);
    printf("Status Data Fifo%d\n\r",Status);
    printf("DataFifo pointer: %d\n\r",DataFifo);

    Status=XLlFifo_CfgInitialize(&PSPLFifo,ConfigPSPL,ConfigPSPL->BaseAddress);
    printf("Status PSPL Fifo%d\n\r",Status);


   read_out = 0;
    n3z_tonetest* InstancePtr = malloc(sizeof (n3z_tonetest));

    XLlFifo_Config *Config;
    /*Initialize axi interface to sysgen module
     *
     */

    Status=n3z_tonetest_Initialize(InstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);
    printf("Status tonetest  %d\n\r",Status);

    /*Set Audio volume to valid level
       *
       */

    n3z_tonetest_audiovolume_write(InstancePtr, AudioVolume);


    init_platform();



    XLlFifo_Initialize( &DataFifo, ConfigData->BaseAddress);
    XLlFifo_Initialize( &PSPLFifo, ConfigPSPL->BaseAddress);

    XLlFifo_IntClear(&DataFifo,0xffffffff);
    XLlFifo_IntClear(&PSPLFifo,0xffffffff);

    print("Reload a picoblaze? - 1=yes, 0=no \n\r");
    Value=GetValue();
   if (Value==1) {
	ReloadPico();
   }
    Value=1;
    while (Value!=13)
    {
        n3z_tonetest_values2recover_write(InstancePtr, 0x00000000);


        printf("Enter data stream to collect (0-3): \n");

            Value=0;
            	do
            	{
            	while (!XUartPs_IsReceiveData(UART_BASEADDR));

            			RecvChar = XUartPs_ReadReg(UART_BASEADDR,
            						    XUARTPS_FIFO_OFFSET);

            			if (('0' <= RecvChar) && ('9' >= RecvChar)) {
            						/* Convert to digit decimal value */
            						Value = Value*10+RecvChar - '0';
            					}
            	}
            	while (RecvChar!=13); /*until CR character*/

            	printf("You typed %d \n\r",Value);
				DataStreamSpec=Value*65536;

        printf("Enter number of values to collect: \n");

            Value=0;
            	do
            	{
            	while (!XUartPs_IsReceiveData(UART_BASEADDR));

            			RecvChar = XUartPs_ReadReg(UART_BASEADDR,
            						    XUARTPS_FIFO_OFFSET);

            			if (('0' <= RecvChar) && ('9' >= RecvChar)) {
            						/* Convert to digit decimal value */
            						Value = Value*10+RecvChar - '0';
            					}
            	}
            	while (RecvChar!=13); /*until line feed character*/

            	printf("You typed %d \n\r",Value);

				DataStreamSpec=DataStreamSpec+Value;



            	n3z_tonetest_values2recover_write(InstancePtr, DataStreamSpec);

        print("Hello World!\n\r");



    	do
		{
    		numberofsamples=XLlFifo_RxOccupancy(&DataFifo);
		}
		while (numberofsamples<Value);

    	print("Hello Data World\n\r");
    	printf("Receive Data Occupancy is %d\r\n",numberofsamples);


 /*       ReceiveLength = XLlFifo_RxGetLen(&DataFifo);
*/
    	ReceiveLength=Rx2Uart(&DataFifo);

        printf("Receive byte length is %d\r\n",ReceiveLength);

    }

    cleanup_platform();
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

	xil_printf(" Transmitting Data ... \r\n");

	/* Filling the buffer with data */
	for (i=0;i<no_word;i++)
		{
			if( XLlFifo_iTxVacancy(InstancePtr) ){
				XLlFifo_TxPutWord(InstancePtr,
					*(SourceAddr+i));
		}

	}

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
		*(DestinationAddr+i) = RxWord;
	}

	Status = XLlFifo_IsRxDone(InstancePtr);
	if(Status != TRUE){
		xil_printf("Failing in receive complete ... \r\n");
		return XST_FAILURE;
	}

	return ReceiveLength;		/* Change to return a useful number*/
}
/**********************************************
 * ***************************
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

int GetValue()
{
	int Value;
	u8 RecvChar;
           Value=0;
           	do
           	{
           	while (!XUartPs_IsReceiveData(UART_BASEADDR));

           			RecvChar = XUartPs_ReadReg(UART_BASEADDR,
           						    XUARTPS_FIFO_OFFSET);

           			if (('0' <= RecvChar) && ('9' >= RecvChar)) {
           						/* Convert to digit decimal value */
           						Value = Value*10+RecvChar - '0';
           					}
           	}
           	while (RecvChar!=13); /*until CR character*/

           	printf("You typed %d \n\r",Value);
return Value;
}

void ReloadPico()

{

	int i;
	int InstructionVal;
	u8 RecvChar;

	xil_printf("Now stream\n\r");
	for ( i=0; i < 2040; i++) {

	         InstructionVal=0;
	            	do
	            	{
	            	while (!XUartPs_IsReceiveData(UART_BASEADDR));

	            			RecvChar = XUartPs_ReadReg(UART_BASEADDR,
	            						    XUARTPS_FIFO_OFFSET);

	            			if (('0' <= RecvChar) && ('9' >= RecvChar)) {
	            						/* Convert to digit decimal value */
	            						InstructionVal = InstructionVal*10+RecvChar - '0';
	            					}
	            	}
	            	while (RecvChar!=10); /*until line feed character*/
	/*
	            	xil_printf("You sent %d \n\r",InstructionVal);
	*/



	          if( XLlFifo_iTxVacancy(&DataFifo) ){
					XLlFifo_TxPutWord(&DataFifo,InstructionVal);
	      }
	}

	XLlFifo_iTxSetLen(&DataFifo, 8160);
	while( !(XLlFifo_IsTxDone(&DataFifo)) ){

		}



}
