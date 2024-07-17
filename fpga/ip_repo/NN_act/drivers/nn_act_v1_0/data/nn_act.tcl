# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
# Tool Version Limit: 2023.10
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "XNn_act" \
        "NUM_INSTANCES" \
        "DEVICE_ID" \
        "C_S_AXI_BUS_A_BASEADDR" \
        "C_S_AXI_BUS_A_HIGHADDR"

    xdefine_config_file $drv_handle "xnn_act_g.c" "XNn_act" \
        "DEVICE_ID" \
        "C_S_AXI_BUS_A_BASEADDR"

    xdefine_canonical_xpars $drv_handle "xparameters.h" "XNn_act" \
        "DEVICE_ID" \
        "C_S_AXI_BUS_A_BASEADDR" \
        "C_S_AXI_BUS_A_HIGHADDR"
}

