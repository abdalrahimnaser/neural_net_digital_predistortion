-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nn_act is
generic (
    C_S_AXI_BUS_A_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_BUS_A_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    sigReIn_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    sigReIn_EN_A : OUT STD_LOGIC;
    sigReIn_WEN_A : OUT STD_LOGIC_VECTOR (15 downto 0);
    sigReIn_Din_A : OUT STD_LOGIC_VECTOR (127 downto 0);
    sigReIn_Dout_A : IN STD_LOGIC_VECTOR (127 downto 0);
    sigReIn_Clk_A : OUT STD_LOGIC;
    sigReIn_Rst_A : OUT STD_LOGIC;
    sigImIn_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    sigImIn_EN_A : OUT STD_LOGIC;
    sigImIn_WEN_A : OUT STD_LOGIC_VECTOR (15 downto 0);
    sigImIn_Din_A : OUT STD_LOGIC_VECTOR (127 downto 0);
    sigImIn_Dout_A : IN STD_LOGIC_VECTOR (127 downto 0);
    sigImIn_Clk_A : OUT STD_LOGIC;
    sigImIn_Rst_A : OUT STD_LOGIC;
    sigReOut_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    sigReOut_EN_A : OUT STD_LOGIC;
    sigReOut_WEN_A : OUT STD_LOGIC_VECTOR (15 downto 0);
    sigReOut_Din_A : OUT STD_LOGIC_VECTOR (127 downto 0);
    sigReOut_Dout_A : IN STD_LOGIC_VECTOR (127 downto 0);
    sigReOut_Clk_A : OUT STD_LOGIC;
    sigReOut_Rst_A : OUT STD_LOGIC;
    sigImOut_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    sigImOut_EN_A : OUT STD_LOGIC;
    sigImOut_WEN_A : OUT STD_LOGIC_VECTOR (15 downto 0);
    sigImOut_Din_A : OUT STD_LOGIC_VECTOR (127 downto 0);
    sigImOut_Dout_A : IN STD_LOGIC_VECTOR (127 downto 0);
    sigImOut_Clk_A : OUT STD_LOGIC;
    sigImOut_Rst_A : OUT STD_LOGIC;
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_BUS_A_ADDR_WIDTH-1 downto 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_BUS_A_DATA_WIDTH-1 downto 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_BUS_A_DATA_WIDTH/8-1 downto 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_BUS_A_ADDR_WIDTH-1 downto 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_BUS_A_DATA_WIDTH-1 downto 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of nn_act is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "nn_act_nn_act,hls_ip_2023_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu48dr-ffvg1517-2-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.986000,HLS_SYN_LAT=1,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=111,HLS_SYN_LUT=438,HLS_VERSION=2023_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv20_0 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    constant C_S_AXI_DATA_WIDTH : INTEGER := 32;
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_FFFF : STD_LOGIC_VECTOR (15 downto 0) := "1111111111111111";
    constant ap_const_lv20_1 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000001";
    constant ap_const_lv128_lc_1 : STD_LOGIC_VECTOR (127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal params : STD_LOGIC_VECTOR (31 downto 0);
    signal buffIdx : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    signal icmp_ln39_fu_120_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln39_reg_178 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal zext_ln55_fu_130_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln55_reg_184 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal select_ln58_fu_148_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal sigReIn_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal sigImIn_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal sigReOut_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal sigImOut_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal sigLen_fu_116_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal icmp_ln58_fu_136_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln64_fu_142_p2 : STD_LOGIC_VECTOR (19 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component nn_act_BUS_A_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        params : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    BUS_A_s_axi_U : component nn_act_BUS_A_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_BUS_A_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_BUS_A_DATA_WIDTH)
    port map (
        AWVALID => s_axi_BUS_A_AWVALID,
        AWREADY => s_axi_BUS_A_AWREADY,
        AWADDR => s_axi_BUS_A_AWADDR,
        WVALID => s_axi_BUS_A_WVALID,
        WREADY => s_axi_BUS_A_WREADY,
        WDATA => s_axi_BUS_A_WDATA,
        WSTRB => s_axi_BUS_A_WSTRB,
        ARVALID => s_axi_BUS_A_ARVALID,
        ARREADY => s_axi_BUS_A_ARREADY,
        ARADDR => s_axi_BUS_A_ARADDR,
        RVALID => s_axi_BUS_A_RVALID,
        RREADY => s_axi_BUS_A_RREADY,
        RDATA => s_axi_BUS_A_RDATA,
        RRESP => s_axi_BUS_A_RRESP,
        BVALID => s_axi_BUS_A_BVALID,
        BREADY => s_axi_BUS_A_BREADY,
        BRESP => s_axi_BUS_A_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        params => params);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;


    buffIdx_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                buffIdx <= ap_const_lv20_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    buffIdx <= select_ln58_fu_148_p3;
                end if; 
            end if;
        end if;
    end process;


    icmp_ln39_reg_178_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                icmp_ln39_reg_178 <= ap_const_lv1_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    icmp_ln39_reg_178 <= icmp_ln39_fu_120_p2;
                end if; 
            end if;
        end if;
    end process;


    zext_ln55_reg_184_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                zext_ln55_reg_184(0) <= '0';
                zext_ln55_reg_184(1) <= '0';
                zext_ln55_reg_184(2) <= '0';
                zext_ln55_reg_184(3) <= '0';
                zext_ln55_reg_184(4) <= '0';
                zext_ln55_reg_184(5) <= '0';
                zext_ln55_reg_184(6) <= '0';
                zext_ln55_reg_184(7) <= '0';
                zext_ln55_reg_184(8) <= '0';
                zext_ln55_reg_184(9) <= '0';
                zext_ln55_reg_184(10) <= '0';
                zext_ln55_reg_184(11) <= '0';
                zext_ln55_reg_184(12) <= '0';
                zext_ln55_reg_184(13) <= '0';
                zext_ln55_reg_184(14) <= '0';
                zext_ln55_reg_184(15) <= '0';
                zext_ln55_reg_184(16) <= '0';
                zext_ln55_reg_184(17) <= '0';
                zext_ln55_reg_184(18) <= '0';
                zext_ln55_reg_184(19) <= '0';
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                                        zext_ln55_reg_184(19 downto 0) <= zext_ln55_fu_130_p1(19 downto 0);
                end if; 
            end if;
        end if;
    end process;

    zext_ln55_reg_184(63 downto 20) <= "00000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln64_fu_142_p2 <= std_logic_vector(unsigned(buffIdx) + unsigned(ap_const_lv20_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    icmp_ln39_fu_120_p2 <= "1" when (sigLen_fu_116_p1 = ap_const_lv20_0) else "0";
    icmp_ln58_fu_136_p2 <= "1" when (buffIdx = sigLen_fu_116_p1) else "0";
    select_ln58_fu_148_p3 <= 
        ap_const_lv20_0 when (icmp_ln58_fu_136_p2(0) = '1') else 
        add_ln64_fu_142_p2;
    sigImIn_Addr_A <= std_logic_vector(shift_left(unsigned(sigImIn_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_4(31-1 downto 0)))));
    sigImIn_Addr_A_orig <= zext_ln55_fu_130_p1(32 - 1 downto 0);
    sigImIn_Clk_A <= ap_clk;
    sigImIn_Din_A <= ap_const_lv128_lc_1;

    sigImIn_EN_A_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sigImIn_EN_A <= ap_const_logic_1;
        else 
            sigImIn_EN_A <= ap_const_logic_0;
        end if; 
    end process;

    sigImIn_Rst_A <= ap_rst_n_inv;
    sigImIn_WEN_A <= ap_const_lv16_0;
    sigImOut_Addr_A <= std_logic_vector(shift_left(unsigned(sigImOut_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_4(31-1 downto 0)))));
    sigImOut_Addr_A_orig <= zext_ln55_reg_184(32 - 1 downto 0);
    sigImOut_Clk_A <= ap_clk;
    sigImOut_Din_A <= 
        ap_const_lv128_lc_1 when (icmp_ln39_reg_178(0) = '1') else 
        sigImIn_Dout_A;

    sigImOut_EN_A_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sigImOut_EN_A <= ap_const_logic_1;
        else 
            sigImOut_EN_A <= ap_const_logic_0;
        end if; 
    end process;

    sigImOut_Rst_A <= ap_rst_n_inv;

    sigImOut_WEN_A_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sigImOut_WEN_A <= ap_const_lv16_FFFF;
        else 
            sigImOut_WEN_A <= ap_const_lv16_0;
        end if; 
    end process;

    sigLen_fu_116_p1 <= params(20 - 1 downto 0);
    sigReIn_Addr_A <= std_logic_vector(shift_left(unsigned(sigReIn_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_4(31-1 downto 0)))));
    sigReIn_Addr_A_orig <= zext_ln55_fu_130_p1(32 - 1 downto 0);
    sigReIn_Clk_A <= ap_clk;
    sigReIn_Din_A <= ap_const_lv128_lc_1;

    sigReIn_EN_A_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sigReIn_EN_A <= ap_const_logic_1;
        else 
            sigReIn_EN_A <= ap_const_logic_0;
        end if; 
    end process;

    sigReIn_Rst_A <= ap_rst_n_inv;
    sigReIn_WEN_A <= ap_const_lv16_0;
    sigReOut_Addr_A <= std_logic_vector(shift_left(unsigned(sigReOut_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_4(31-1 downto 0)))));
    sigReOut_Addr_A_orig <= zext_ln55_reg_184(32 - 1 downto 0);
    sigReOut_Clk_A <= ap_clk;
    sigReOut_Din_A <= 
        ap_const_lv128_lc_1 when (icmp_ln39_reg_178(0) = '1') else 
        sigReIn_Dout_A;

    sigReOut_EN_A_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sigReOut_EN_A <= ap_const_logic_1;
        else 
            sigReOut_EN_A <= ap_const_logic_0;
        end if; 
    end process;

    sigReOut_Rst_A <= ap_rst_n_inv;

    sigReOut_WEN_A_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sigReOut_WEN_A <= ap_const_lv16_FFFF;
        else 
            sigReOut_WEN_A <= ap_const_lv16_0;
        end if; 
    end process;

    zext_ln55_fu_130_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(buffIdx),64));
end behav;
