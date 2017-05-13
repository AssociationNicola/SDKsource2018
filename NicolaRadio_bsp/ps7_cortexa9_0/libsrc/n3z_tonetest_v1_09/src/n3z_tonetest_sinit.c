/**
* @file n3z_tonetest_sinit.c
*
* The implementation of the n3z_tonetest driver's static initialzation
* functionality.
*
* @note
*
* None
*
*/
#ifndef __linux__
#include "xstatus.h"
#include "xparameters.h"
#include "n3z_tonetest.h"
extern n3z_tonetest_Config n3z_tonetest_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type n3z_tonetest_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
n3z_tonetest_Config *n3z_tonetest_LookupConfig(u16 DeviceId) {
    n3z_tonetest_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_N3Z_TONETEST_NUM_INSTANCES; Index++) {
        if (n3z_tonetest_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &n3z_tonetest_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int n3z_tonetest_Initialize(n3z_tonetest *InstancePtr, u16 DeviceId) {
    n3z_tonetest_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = n3z_tonetest_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return n3z_tonetest_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
