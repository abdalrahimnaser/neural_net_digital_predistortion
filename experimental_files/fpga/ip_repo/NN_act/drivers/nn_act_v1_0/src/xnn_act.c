// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xnn_act.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XNn_act_CfgInitialize(XNn_act *InstancePtr, XNn_act_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XNn_act_Set_params(XNn_act *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNn_act_WriteReg(InstancePtr->Bus_a_BaseAddress, XNN_ACT_BUS_A_ADDR_PARAMS_DATA, Data);
}

u32 XNn_act_Get_params(XNn_act *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNn_act_ReadReg(InstancePtr->Bus_a_BaseAddress, XNN_ACT_BUS_A_ADDR_PARAMS_DATA);
    return Data;
}

