#ifndef N3Z_TONETEST__H
#define N3Z_TONETEST__H
#ifdef __cplusplus
extern "C" {
#endif
/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "n3z_tonetest_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 n3z_tonetest_BaseAddress;
} n3z_tonetest_Config;
#endif
/**
* The n3z_tonetest driver instance data. The user is required to
* allocate a variable of this type for every n3z_tonetest device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 n3z_tonetest_BaseAddress;
    u32 IsReady;
} n3z_tonetest;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define n3z_tonetest_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define n3z_tonetest_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define n3z_tonetest_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define n3z_tonetest_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif
/************************** Function Prototypes *****************************/
#ifndef __linux__
int n3z_tonetest_Initialize(n3z_tonetest *InstancePtr, u16 DeviceId);
n3z_tonetest_Config* n3z_tonetest_LookupConfig(u16 DeviceId);
int n3z_tonetest_CfgInitialize(n3z_tonetest *InstancePtr, n3z_tonetest_Config *ConfigPtr);
#else
int n3z_tonetest_Initialize(n3z_tonetest *InstancePtr, const char* InstanceName);
int n3z_tonetest_Release(n3z_tonetest *InstancePtr);
#endif
/**
* Write to values2recover gateway of n3z_tonetest. Assignments are LSB-justified.
*
* @param	InstancePtr is the values2recover instance to operate on.
* @param	Data is value to be written to gateway values2recover.
*
* @return	None.
*
* @note    .
*
*/
void n3z_tonetest_values2recover_write(n3z_tonetest *InstancePtr, u32 Data);
/**
* Read from values2recover gateway of n3z_tonetest. Assignments are LSB-justified.
*
* @param	InstancePtr is the values2recover instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 n3z_tonetest_values2recover_read(n3z_tonetest *InstancePtr);
/**
* Write to audiovolume gateway of n3z_tonetest. Assignments are LSB-justified.
*
* @param	InstancePtr is the audiovolume instance to operate on.
* @param	Data is value to be written to gateway audiovolume.
*
* @return	None.
*
* @note    .
*
*/
void n3z_tonetest_audiovolume_write(n3z_tonetest *InstancePtr, u8 Data);
/**
* Read from audiovolume gateway of n3z_tonetest. Assignments are LSB-justified.
*
* @param	InstancePtr is the audiovolume instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 n3z_tonetest_audiovolume_read(n3z_tonetest *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
