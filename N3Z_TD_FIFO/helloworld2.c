/******************************************************************************
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



int main()
{
    int read_out =0;
    int keyval;
    int samplenumber;
    int DataValue;
    char from_keyboard[10];
    int numberofsamples;
    int read_in =0;
    static u32 ReceiveLength;
    int Status;
    Buffer  = malloc(512 * sizeof(*Buffer));


   read_out = 0;
    n3z_tonetest* InstancePtr = malloc(sizeof (n3z_tonetest));

    XLlFifo_Config *Config;
    /*Initialize axi interface to sysgen module
     *
     */

    Status=n3z_tonetest_Initialize(InstancePtr, XPAR_N3Z_TONETEST_0_DEVICE_ID);

    /*Set Audio volume to valid level
       *
       */

    n3z_tonetest_audiovolume_write(InstancePtr, AudioVolume);


    init_platform();



    XLlFifo_Initialize( &DataFifo, 0x43C10000);
    XLlFifo_Initialize( &PSPLFifo, 0x43C20000);

    XLlFifo_IntClear(&DataFifo,0xffffffff);
    XLlFifo_IntClear(&PSPLFifo,0xffffffff);

    Status = XLlFifo_Status(&DataFifo);

    xil_printf("%d\n\r",Status);
    xil_printf("Status %d\n\r",Status);
    print("Hello World!\n\r");
    printf("Status %d\n\r",Status);

       /* Wait for keyboard string

       scanf("%s",from_keyboard);

       xil_printf("Read %s\r\n",from_keyboard);



       print("Hello World with volume!\n\r");



       scanf("%d",keyval);



       xil_printf("Read %d\r\n",keyval);

       */

        ReceiveLength = XLlFifo_RxGetLen(&DataFifo);
        print("Hello World again2\n\r");

        printf("Receive byte length is %d\r\n",ReceiveLength);
        numberofsamples=4*ReceiveLength;


        XLlFifo_Read     (     &DataFifo,     Buffer,    4*ReceiveLength)     ;
        for (samplenumber=0; samplenumber<numberofsamples; samplenumber++ ) {
          printf("%d\r\n",Buffer[samplenumber]);

        }



    cleanup_platform();
    return 0;
}

