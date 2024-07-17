# Copyright (C) 2022 Xilinx, Inc
# SPDX-License-Identifier: BSD-3-Clause

## Constraints file for RFSoC4x2 base overlay Vivado project

# 156.25 MHz USER_MGT_SI570_CLOCK - CMAC input clock
#set_property PACKAGE_PIN AA34      [get_ports "diff_clock_rtl_clk_n"] ;# Bank 128 - MGTREFCLK0N_128 RFSoC4x2 GT CLK
#set_property PACKAGE_PIN AA33      [get_ports "diff_clock_rtl_clk_p"] ;# Bank 128 - MGTREFCLK0P_128 RFSoC4x2 GT CLK





#set_property PACKAGE_PIN AF16 [get_ports {outPulse}]
#set_property PACKAGE_PIN AG17 [get_ports {outPulse_1}]
#set_property PACKAGE_PIN AJ16 [get_ports {outPulse[2]}]
#set_property PACKAGE_PIN AK17 [get_ports {outPulse[3]}]
#set_property PACKAGE_PIN AF15 [get_ports {outPulse[4]}]
#set_property PACKAGE_PIN AF17 [get_ports {outPulse[5]}]
#set_property PACKAGE_PIN AH17 [get_ports {outPulse[6]}]
#set_property PACKAGE_PIN AK16 [get_ports {outPulse[7]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[7]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[6]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[5]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[4]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[3]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[2]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse}]
#set_property IOSTANDARD LVCMOS18 [get_ports {outPulse_1}]




