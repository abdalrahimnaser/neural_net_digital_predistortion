// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xnn_act.h"

extern XNn_act_Config XNn_act_ConfigTable[];

#ifdef SDT
XNn_act_Config *XNn_act_LookupConfig(UINTPTR BaseAddress) {
	XNn_act_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XNn_act_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XNn_act_ConfigTable[Index].Bus_a_BaseAddress == BaseAddress) {
			ConfigPtr = &XNn_act_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XNn_act_Initialize(XNn_act *InstancePtr, UINTPTR BaseAddress) {
	XNn_act_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XNn_act_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XNn_act_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XNn_act_Config *XNn_act_LookupConfig(u16 DeviceId) {
	XNn_act_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XNN_ACT_NUM_INSTANCES; Index++) {
		if (XNn_act_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XNn_act_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XNn_act_Initialize(XNn_act *InstancePtr, u16 DeviceId) {
	XNn_act_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XNn_act_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XNn_act_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

