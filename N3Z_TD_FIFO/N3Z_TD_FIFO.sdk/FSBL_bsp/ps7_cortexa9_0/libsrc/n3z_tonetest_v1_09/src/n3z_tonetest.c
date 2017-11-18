#include "n3z_tonetest.h"
#ifndef __linux__
int n3z_tonetest_CfgInitialize(n3z_tonetest *InstancePtr, n3z_tonetest_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->n3z_tonetest_BaseAddress = ConfigPtr->n3z_tonetest_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void n3z_tonetest_values2recover_write(n3z_tonetest *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    n3z_tonetest_WriteReg(InstancePtr->n3z_tonetest_BaseAddress, 0, Data);
}
u32 n3z_tonetest_values2recover_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 0);
    return Data;
}
void n3z_tonetest_n3zconfig_write(n3z_tonetest *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    n3z_tonetest_WriteReg(InstancePtr->n3z_tonetest_BaseAddress, 4, Data);
}
u32 n3z_tonetest_n3zconfig_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 4);
    return Data;
}
void n3z_tonetest_audiovolume_write(n3z_tonetest *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    n3z_tonetest_WriteReg(InstancePtr->n3z_tonetest_BaseAddress, 8, Data);
}
u32 n3z_tonetest_audiovolume_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 8);
    return Data;
}
u32 n3z_tonetest_adcgain_ave_peak_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 12);
    return Data;
}
u32 n3z_tonetest_plstatus_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 16);
    return Data;
}
u8 n3z_tonetest_starttoneamp_read(n3z_tonetest *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 20);
    return Data;
}
u32 n3z_tonetest_demodsignallevel_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 24);
    return Data;
}
u32 n3z_tonetest_txaudiolevel_read(n3z_tonetest *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = n3z_tonetest_ReadReg(InstancePtr->n3z_tonetest_BaseAddress, 28);
    return Data;
}
