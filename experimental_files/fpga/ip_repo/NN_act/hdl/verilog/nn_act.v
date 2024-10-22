// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="nn_act_nn_act,hls_ip_2023_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.986000,HLS_SYN_LAT=1,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=111,HLS_SYN_LUT=438,HLS_VERSION=2023_2}" *)

module nn_act (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sigReIn_Addr_A,
        sigReIn_EN_A,
        sigReIn_WEN_A,
        sigReIn_Din_A,
        sigReIn_Dout_A,
        sigReIn_Clk_A,
        sigReIn_Rst_A,
        sigImIn_Addr_A,
        sigImIn_EN_A,
        sigImIn_WEN_A,
        sigImIn_Din_A,
        sigImIn_Dout_A,
        sigImIn_Clk_A,
        sigImIn_Rst_A,
        sigReOut_Addr_A,
        sigReOut_EN_A,
        sigReOut_WEN_A,
        sigReOut_Din_A,
        sigReOut_Dout_A,
        sigReOut_Clk_A,
        sigReOut_Rst_A,
        sigImOut_Addr_A,
        sigImOut_EN_A,
        sigImOut_WEN_A,
        sigImOut_Din_A,
        sigImOut_Dout_A,
        sigImOut_Clk_A,
        sigImOut_Rst_A,
        s_axi_BUS_A_AWVALID,
        s_axi_BUS_A_AWREADY,
        s_axi_BUS_A_AWADDR,
        s_axi_BUS_A_WVALID,
        s_axi_BUS_A_WREADY,
        s_axi_BUS_A_WDATA,
        s_axi_BUS_A_WSTRB,
        s_axi_BUS_A_ARVALID,
        s_axi_BUS_A_ARREADY,
        s_axi_BUS_A_ARADDR,
        s_axi_BUS_A_RVALID,
        s_axi_BUS_A_RREADY,
        s_axi_BUS_A_RDATA,
        s_axi_BUS_A_RRESP,
        s_axi_BUS_A_BVALID,
        s_axi_BUS_A_BREADY,
        s_axi_BUS_A_BRESP
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
parameter    C_S_AXI_BUS_A_DATA_WIDTH = 32;
parameter    C_S_AXI_BUS_A_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_BUS_A_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] sigReIn_Addr_A;
output   sigReIn_EN_A;
output  [15:0] sigReIn_WEN_A;
output  [127:0] sigReIn_Din_A;
input  [127:0] sigReIn_Dout_A;
output   sigReIn_Clk_A;
output   sigReIn_Rst_A;
output  [31:0] sigImIn_Addr_A;
output   sigImIn_EN_A;
output  [15:0] sigImIn_WEN_A;
output  [127:0] sigImIn_Din_A;
input  [127:0] sigImIn_Dout_A;
output   sigImIn_Clk_A;
output   sigImIn_Rst_A;
output  [31:0] sigReOut_Addr_A;
output   sigReOut_EN_A;
output  [15:0] sigReOut_WEN_A;
output  [127:0] sigReOut_Din_A;
input  [127:0] sigReOut_Dout_A;
output   sigReOut_Clk_A;
output   sigReOut_Rst_A;
output  [31:0] sigImOut_Addr_A;
output   sigImOut_EN_A;
output  [15:0] sigImOut_WEN_A;
output  [127:0] sigImOut_Din_A;
input  [127:0] sigImOut_Dout_A;
output   sigImOut_Clk_A;
output   sigImOut_Rst_A;
input   s_axi_BUS_A_AWVALID;
output   s_axi_BUS_A_AWREADY;
input  [C_S_AXI_BUS_A_ADDR_WIDTH - 1:0] s_axi_BUS_A_AWADDR;
input   s_axi_BUS_A_WVALID;
output   s_axi_BUS_A_WREADY;
input  [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_WDATA;
input  [C_S_AXI_BUS_A_WSTRB_WIDTH - 1:0] s_axi_BUS_A_WSTRB;
input   s_axi_BUS_A_ARVALID;
output   s_axi_BUS_A_ARREADY;
input  [C_S_AXI_BUS_A_ADDR_WIDTH - 1:0] s_axi_BUS_A_ARADDR;
output   s_axi_BUS_A_RVALID;
input   s_axi_BUS_A_RREADY;
output  [C_S_AXI_BUS_A_DATA_WIDTH - 1:0] s_axi_BUS_A_RDATA;
output  [1:0] s_axi_BUS_A_RRESP;
output   s_axi_BUS_A_BVALID;
input   s_axi_BUS_A_BREADY;
output  [1:0] s_axi_BUS_A_BRESP;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg sigReIn_EN_A;
reg sigImIn_EN_A;
reg sigReOut_EN_A;
reg[15:0] sigReOut_WEN_A;
reg sigImOut_EN_A;
reg[15:0] sigImOut_WEN_A;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [31:0] params;
reg   [19:0] buffIdx;
wire   [0:0] icmp_ln50_fu_120_p2;
reg   [0:0] icmp_ln50_reg_178;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln66_fu_130_p1;
reg   [63:0] zext_ln66_reg_184;
wire    ap_block_pp0_stage0;
wire   [19:0] select_ln69_fu_148_p3;
wire   [31:0] sigReIn_Addr_A_orig;
wire   [31:0] sigImIn_Addr_A_orig;
wire   [31:0] sigReOut_Addr_A_orig;
wire   [31:0] sigImOut_Addr_A_orig;
wire   [19:0] sigLen_fu_116_p1;
wire   [0:0] icmp_ln69_fu_136_p2;
wire   [19:0] add_ln75_fu_142_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 buffIdx = 20'd0;
#0 icmp_ln50_reg_178 = 1'd0;
#0 zext_ln66_reg_184 = 64'd0;
end

nn_act_BUS_A_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_BUS_A_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_BUS_A_DATA_WIDTH ))
BUS_A_s_axi_U(
    .AWVALID(s_axi_BUS_A_AWVALID),
    .AWREADY(s_axi_BUS_A_AWREADY),
    .AWADDR(s_axi_BUS_A_AWADDR),
    .WVALID(s_axi_BUS_A_WVALID),
    .WREADY(s_axi_BUS_A_WREADY),
    .WDATA(s_axi_BUS_A_WDATA),
    .WSTRB(s_axi_BUS_A_WSTRB),
    .ARVALID(s_axi_BUS_A_ARVALID),
    .ARREADY(s_axi_BUS_A_ARREADY),
    .ARADDR(s_axi_BUS_A_ARADDR),
    .RVALID(s_axi_BUS_A_RVALID),
    .RREADY(s_axi_BUS_A_RREADY),
    .RDATA(s_axi_BUS_A_RDATA),
    .RRESP(s_axi_BUS_A_RRESP),
    .BVALID(s_axi_BUS_A_BVALID),
    .BREADY(s_axi_BUS_A_BREADY),
    .BRESP(s_axi_BUS_A_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .params(params)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        buffIdx <= 20'd0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            buffIdx <= select_ln69_fu_148_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        icmp_ln50_reg_178 <= 1'd0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            icmp_ln50_reg_178 <= icmp_ln50_fu_120_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
                zext_ln66_reg_184[0] <= 1'b0;
        zext_ln66_reg_184[1] <= 1'b0;
        zext_ln66_reg_184[2] <= 1'b0;
        zext_ln66_reg_184[3] <= 1'b0;
        zext_ln66_reg_184[4] <= 1'b0;
        zext_ln66_reg_184[5] <= 1'b0;
        zext_ln66_reg_184[6] <= 1'b0;
        zext_ln66_reg_184[7] <= 1'b0;
        zext_ln66_reg_184[8] <= 1'b0;
        zext_ln66_reg_184[9] <= 1'b0;
        zext_ln66_reg_184[10] <= 1'b0;
        zext_ln66_reg_184[11] <= 1'b0;
        zext_ln66_reg_184[12] <= 1'b0;
        zext_ln66_reg_184[13] <= 1'b0;
        zext_ln66_reg_184[14] <= 1'b0;
        zext_ln66_reg_184[15] <= 1'b0;
        zext_ln66_reg_184[16] <= 1'b0;
        zext_ln66_reg_184[17] <= 1'b0;
        zext_ln66_reg_184[18] <= 1'b0;
        zext_ln66_reg_184[19] <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                        zext_ln66_reg_184[19 : 0] <= zext_ln66_fu_130_p1[19 : 0];
        end
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sigImIn_EN_A = 1'b1;
    end else begin
        sigImIn_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sigImOut_EN_A = 1'b1;
    end else begin
        sigImOut_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sigImOut_WEN_A = 16'd65535;
    end else begin
        sigImOut_WEN_A = 16'd0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sigReIn_EN_A = 1'b1;
    end else begin
        sigReIn_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sigReOut_EN_A = 1'b1;
    end else begin
        sigReOut_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sigReOut_WEN_A = 16'd65535;
    end else begin
        sigReOut_WEN_A = 16'd0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln75_fu_142_p2 = (buffIdx + 20'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign icmp_ln50_fu_120_p2 = ((sigLen_fu_116_p1 == 20'd0) ? 1'b1 : 1'b0);

assign icmp_ln69_fu_136_p2 = ((buffIdx == sigLen_fu_116_p1) ? 1'b1 : 1'b0);

assign select_ln69_fu_148_p3 = ((icmp_ln69_fu_136_p2[0:0] == 1'b1) ? 20'd0 : add_ln75_fu_142_p2);

assign sigImIn_Addr_A = sigImIn_Addr_A_orig << 32'd4;

assign sigImIn_Addr_A_orig = zext_ln66_fu_130_p1;

assign sigImIn_Clk_A = ap_clk;

assign sigImIn_Din_A = 128'd0;

assign sigImIn_Rst_A = ap_rst_n_inv;

assign sigImIn_WEN_A = 16'd0;

assign sigImOut_Addr_A = sigImOut_Addr_A_orig << 32'd4;

assign sigImOut_Addr_A_orig = zext_ln66_reg_184;

assign sigImOut_Clk_A = ap_clk;

assign sigImOut_Din_A = ((icmp_ln50_reg_178[0:0] == 1'b1) ? 128'd0 : sigImIn_Dout_A);

assign sigImOut_Rst_A = ap_rst_n_inv;

assign sigLen_fu_116_p1 = params[19:0];

assign sigReIn_Addr_A = sigReIn_Addr_A_orig << 32'd4;

assign sigReIn_Addr_A_orig = zext_ln66_fu_130_p1;

assign sigReIn_Clk_A = ap_clk;

assign sigReIn_Din_A = 128'd0;

assign sigReIn_Rst_A = ap_rst_n_inv;

assign sigReIn_WEN_A = 16'd0;

assign sigReOut_Addr_A = sigReOut_Addr_A_orig << 32'd4;

assign sigReOut_Addr_A_orig = zext_ln66_reg_184;

assign sigReOut_Clk_A = ap_clk;

assign sigReOut_Din_A = ((icmp_ln50_reg_178[0:0] == 1'b1) ? 128'd0 : sigReIn_Dout_A);

assign sigReOut_Rst_A = ap_rst_n_inv;

assign zext_ln66_fu_130_p1 = buffIdx;

always @ (posedge ap_clk) begin
    zext_ln66_reg_184[63:20] <= 44'b00000000000000000000000000000000000000000000;
end

endmodule //nn_act
