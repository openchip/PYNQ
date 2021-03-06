-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.1
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity trace_cntrl is
generic (
    C_S_AXI_TRACE_CNTRL_ADDR_WIDTH : INTEGER := 6;
    C_S_AXI_TRACE_CNTRL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    A_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    A_TVALID : IN STD_LOGIC;
    A_TREADY : OUT STD_LOGIC;
    A_TKEEP : IN STD_LOGIC_VECTOR (7 downto 0);
    A_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
    A_TUSER : IN STD_LOGIC_VECTOR (1 downto 0);
    A_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    A_TID : IN STD_LOGIC_VECTOR (4 downto 0);
    A_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    B_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    B_TVALID : OUT STD_LOGIC;
    B_TREADY : IN STD_LOGIC;
    B_TKEEP : OUT STD_LOGIC_VECTOR (7 downto 0);
    B_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    B_TUSER : OUT STD_LOGIC_VECTOR (1 downto 0);
    B_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    B_TID : OUT STD_LOGIC_VECTOR (4 downto 0);
    B_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    s_axi_trace_cntrl_AWVALID : IN STD_LOGIC;
    s_axi_trace_cntrl_AWREADY : OUT STD_LOGIC;
    s_axi_trace_cntrl_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_TRACE_CNTRL_ADDR_WIDTH-1 downto 0);
    s_axi_trace_cntrl_WVALID : IN STD_LOGIC;
    s_axi_trace_cntrl_WREADY : OUT STD_LOGIC;
    s_axi_trace_cntrl_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_TRACE_CNTRL_DATA_WIDTH-1 downto 0);
    s_axi_trace_cntrl_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_TRACE_CNTRL_DATA_WIDTH/8-1 downto 0);
    s_axi_trace_cntrl_ARVALID : IN STD_LOGIC;
    s_axi_trace_cntrl_ARREADY : OUT STD_LOGIC;
    s_axi_trace_cntrl_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_TRACE_CNTRL_ADDR_WIDTH-1 downto 0);
    s_axi_trace_cntrl_RVALID : OUT STD_LOGIC;
    s_axi_trace_cntrl_RREADY : IN STD_LOGIC;
    s_axi_trace_cntrl_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_TRACE_CNTRL_DATA_WIDTH-1 downto 0);
    s_axi_trace_cntrl_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_trace_cntrl_BVALID : OUT STD_LOGIC;
    s_axi_trace_cntrl_BREADY : IN STD_LOGIC;
    s_axi_trace_cntrl_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of trace_cntrl is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "trace_cntrl,hls_ip_2016_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=6.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.628000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=4,HLS_SYN_FF=631,HLS_SYN_LUT=706}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_st7_fsm_6 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_st8_fsm_7 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_st9_fsm_8 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_pp1_stg0_fsm_9 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_st12_fsm_10 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_28 : BOOLEAN;
    signal ap_ready : STD_LOGIC;
    signal data_compare_V : STD_LOGIC_VECTOR (63 downto 0);
    signal length_r : STD_LOGIC_VECTOR (31 downto 0);
    signal sample_rate : STD_LOGIC_VECTOR (31 downto 0);
    signal A_TDATA_blk_n : STD_LOGIC;
    signal ap_sig_cseq_ST_st8_fsm_7 : STD_LOGIC;
    signal ap_sig_62 : BOOLEAN;
    signal ap_sig_cseq_ST_pp1_stg0_fsm_9 : STD_LOGIC;
    signal ap_sig_69 : BOOLEAN;
    signal ap_reg_ppiten_pp1_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp1_it1 : STD_LOGIC := '0';
    signal tmp_5_fu_293_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal match_phi_fu_183_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal B_TDATA_blk_n : STD_LOGIC;
    signal or_cond_reg_534 : STD_LOGIC_VECTOR (0 downto 0);
    signal match_reg_179 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reg_191 : STD_LOGIC_VECTOR (30 downto 0);
    signal sample_rate_read_reg_407 : STD_LOGIC_VECTOR (31 downto 0);
    signal length_read_reg_413 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_232_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_reg_419 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_226_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal total_input_samples_reg_425 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_cseq_ST_st7_fsm_6 : STD_LOGIC;
    signal ap_sig_147 : BOOLEAN;
    signal A_temp_data_V_reg_430 : STD_LOGIC_VECTOR (63 downto 0);
    signal A_temp_keep_V_reg_435 : STD_LOGIC_VECTOR (7 downto 0);
    signal A_temp_strb_V_reg_440 : STD_LOGIC_VECTOR (7 downto 0);
    signal A_temp_user_V_reg_445 : STD_LOGIC_VECTOR (1 downto 0);
    signal A_temp_id_V_reg_450 : STD_LOGIC_VECTOR (4 downto 0);
    signal A_temp_dest_V_reg_455 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_4_fu_250_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_reg_520 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_cseq_ST_st9_fsm_8 : STD_LOGIC;
    signal ap_sig_171 : BOOLEAN;
    signal tmp_5_reg_525 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_175 : BOOLEAN;
    signal ap_sig_ioackin_B_TREADY : STD_LOGIC;
    signal i_1_fu_298_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal or_cond_fu_342_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal A_temp_last_V_fu_362_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal A_temp_last_V_reg_538 : STD_LOGIC_VECTOR (0 downto 0);
    signal sample_counter_fu_86 : STD_LOGIC_VECTOR (31 downto 0);
    signal sample_counter_1_fu_348_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal samples_fu_90 : STD_LOGIC_VECTOR (31 downto 0);
    signal samples_1_fu_367_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal A_temp_data_V_1_fu_94 : STD_LOGIC_VECTOR (63 downto 0);
    signal A_temp_keep_V_1_fu_98 : STD_LOGIC_VECTOR (7 downto 0);
    signal A_temp_strb_V_1_fu_102 : STD_LOGIC_VECTOR (7 downto 0);
    signal A_temp_user_V_1_fu_106 : STD_LOGIC_VECTOR (1 downto 0);
    signal A_temp_id_V_1_fu_110 : STD_LOGIC_VECTOR (4 downto 0);
    signal A_temp_dest_V_1_fu_114 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ioackin_B_TREADY : STD_LOGIC := '0';
    signal tmp_1_fu_236_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_2_fu_240_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_cast_fu_289_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_7_fu_337_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_245_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st12_fsm_10 : STD_LOGIC;
    signal ap_sig_372 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);

    component trace_cntrl_mul_32s_32s_32_7 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component trace_cntrl_trace_cntrl_s_axi IS
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
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        data_compare_V : OUT STD_LOGIC_VECTOR (63 downto 0);
        length_r : OUT STD_LOGIC_VECTOR (31 downto 0);
        sample_rate : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    trace_cntrl_trace_cntrl_s_axi_U : component trace_cntrl_trace_cntrl_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_TRACE_CNTRL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_TRACE_CNTRL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_trace_cntrl_AWVALID,
        AWREADY => s_axi_trace_cntrl_AWREADY,
        AWADDR => s_axi_trace_cntrl_AWADDR,
        WVALID => s_axi_trace_cntrl_WVALID,
        WREADY => s_axi_trace_cntrl_WREADY,
        WDATA => s_axi_trace_cntrl_WDATA,
        WSTRB => s_axi_trace_cntrl_WSTRB,
        ARVALID => s_axi_trace_cntrl_ARVALID,
        ARREADY => s_axi_trace_cntrl_ARREADY,
        ARADDR => s_axi_trace_cntrl_ARADDR,
        RVALID => s_axi_trace_cntrl_RVALID,
        RREADY => s_axi_trace_cntrl_RREADY,
        RDATA => s_axi_trace_cntrl_RDATA,
        RRESP => s_axi_trace_cntrl_RRESP,
        BVALID => s_axi_trace_cntrl_BVALID,
        BREADY => s_axi_trace_cntrl_BREADY,
        BRESP => s_axi_trace_cntrl_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        data_compare_V => data_compare_V,
        length_r => length_r,
        sample_rate => sample_rate);

    trace_cntrl_mul_32s_32s_32_7_U0 : component trace_cntrl_mul_32s_32s_32_7
    generic map (
        ID => 1,
        NUM_STAGE => 7,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => sample_rate,
        din1 => length_r,
        ce => ap_const_logic_1,
        dout => grp_fu_226_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_ioackin_B_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_B_TREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY))))))) then 
                    ap_reg_ioackin_B_TREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and not(((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175)) and (ap_const_logic_1 = B_TREADY)))) then 
                    ap_reg_ioackin_B_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ppiten_pp1_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (tmp_5_fu_293_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                    ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                    ap_reg_ppiten_pp1_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ppiten_pp1_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                    ap_reg_ppiten_pp1_it1 <= ap_const_logic_1;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (tmp_5_fu_293_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY))))))) then 
                    ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    A_temp_data_V_1_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                A_temp_data_V_1_fu_94 <= A_TDATA;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                A_temp_data_V_1_fu_94 <= A_temp_data_V_reg_430;
            end if; 
        end if;
    end process;

    A_temp_dest_V_1_fu_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                A_temp_dest_V_1_fu_114 <= A_TDEST;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                A_temp_dest_V_1_fu_114 <= A_temp_dest_V_reg_455;
            end if; 
        end if;
    end process;

    A_temp_id_V_1_fu_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                A_temp_id_V_1_fu_110 <= A_TID;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                A_temp_id_V_1_fu_110 <= A_temp_id_V_reg_450;
            end if; 
        end if;
    end process;

    A_temp_keep_V_1_fu_98_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                A_temp_keep_V_1_fu_98 <= A_TKEEP;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                A_temp_keep_V_1_fu_98 <= A_temp_keep_V_reg_435;
            end if; 
        end if;
    end process;

    A_temp_strb_V_1_fu_102_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                A_temp_strb_V_1_fu_102 <= A_TSTRB;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                A_temp_strb_V_1_fu_102 <= A_temp_strb_V_reg_440;
            end if; 
        end if;
    end process;

    A_temp_user_V_1_fu_106_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                A_temp_user_V_1_fu_106 <= A_TUSER;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                A_temp_user_V_1_fu_106 <= A_temp_user_V_reg_445;
            end if; 
        end if;
    end process;

    i_reg_191_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then 
                i_reg_191 <= i_1_fu_298_p2;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                i_reg_191 <= ap_const_lv31_0;
            end if; 
        end if;
    end process;

    match_reg_179_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))) and not((ap_const_lv1_0 = tmp_5_reg_525)))) then 
                match_reg_179 <= ap_const_lv1_0;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                match_reg_179 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    sample_counter_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))) and not((ap_const_lv1_0 = or_cond_fu_342_p2)))) then 
                sample_counter_fu_86 <= ap_const_lv32_1;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))) and (ap_const_lv1_0 = or_cond_fu_342_p2))) then 
                sample_counter_fu_86 <= sample_counter_1_fu_348_p2;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                sample_counter_fu_86 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    samples_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))) and not((ap_const_lv1_0 = or_cond_fu_342_p2)))) then 
                samples_fu_90 <= samples_1_fu_367_p2;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then 
                samples_fu_90 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7) and not((A_TVALID = ap_const_logic_0)))) then
                A_temp_data_V_reg_430 <= A_TDATA;
                A_temp_dest_V_reg_455 <= A_TDEST;
                A_temp_id_V_reg_450 <= A_TID;
                A_temp_keep_V_reg_435 <= A_TKEEP;
                A_temp_strb_V_reg_440 <= A_TSTRB;
                A_temp_user_V_reg_445 <= A_TUSER;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))) and not((ap_const_lv1_0 = or_cond_fu_342_p2)))) then
                A_temp_last_V_reg_538 <= A_temp_last_V_fu_362_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then
                length_read_reg_413 <= length_r;
                sample_rate_read_reg_407 <= sample_rate;
                tmp_reg_419 <= tmp_fu_232_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then
                or_cond_reg_534 <= or_cond_fu_342_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then
                tmp_4_reg_520 <= tmp_4_fu_250_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then
                tmp_5_reg_525 <= tmp_5_fu_293_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_6)) then
                total_input_samples_reg_425 <= grp_fu_226_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, A_TVALID, ap_reg_ppiten_pp1_it0, ap_reg_ppiten_pp1_it1, tmp_5_fu_293_p2, or_cond_reg_534, ap_sig_175, ap_sig_ioackin_B_TREADY, tmp_3_fu_245_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                ap_NS_fsm <= ap_ST_st3_fsm_2;
            when ap_ST_st3_fsm_2 => 
                ap_NS_fsm <= ap_ST_st4_fsm_3;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st5_fsm_4;
            when ap_ST_st5_fsm_4 => 
                ap_NS_fsm <= ap_ST_st6_fsm_5;
            when ap_ST_st6_fsm_5 => 
                ap_NS_fsm <= ap_ST_st7_fsm_6;
            when ap_ST_st7_fsm_6 => 
                ap_NS_fsm <= ap_ST_st8_fsm_7;
            when ap_ST_st8_fsm_7 => 
                if ((not((A_TVALID = ap_const_logic_0)) and (ap_const_lv1_0 = tmp_3_fu_245_p2))) then
                    ap_NS_fsm <= ap_ST_st8_fsm_7;
                elsif ((not((A_TVALID = ap_const_logic_0)) and not((ap_const_lv1_0 = tmp_3_fu_245_p2)))) then
                    ap_NS_fsm <= ap_ST_st9_fsm_8;
                else
                    ap_NS_fsm <= ap_ST_st8_fsm_7;
                end if;
            when ap_ST_st9_fsm_8 => 
                ap_NS_fsm <= ap_ST_pp1_stg0_fsm_9;
            when ap_ST_pp1_stg0_fsm_9 => 
                if (not(((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and (tmp_5_fu_293_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY))))))) then
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_9;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and (tmp_5_fu_293_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY)))))) then
                    ap_NS_fsm <= ap_ST_st12_fsm_10;
                else
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_9;
                end if;
            when ap_ST_st12_fsm_10 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;

    A_TDATA_blk_n_assign_proc : process(A_TVALID, ap_sig_cseq_ST_st8_fsm_7, ap_sig_cseq_ST_pp1_stg0_fsm_9, ap_reg_ppiten_pp1_it0, tmp_5_fu_293_p2, match_phi_fu_183_p4)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4)))) then 
            A_TDATA_blk_n <= A_TVALID;
        else 
            A_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    A_TREADY_assign_proc : process(A_TVALID, ap_sig_cseq_ST_st8_fsm_7, ap_sig_cseq_ST_pp1_stg0_fsm_9, ap_reg_ppiten_pp1_it0, ap_reg_ppiten_pp1_it1, tmp_5_fu_293_p2, match_phi_fu_183_p4, or_cond_reg_534, ap_sig_175, ap_sig_ioackin_B_TREADY)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7) and not((A_TVALID = ap_const_logic_0))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and not((((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175) or ((ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY))))))) then 
            A_TREADY <= ap_const_logic_1;
        else 
            A_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    A_temp_last_V_fu_362_p2 <= "1" when (samples_fu_90 = tmp_4_reg_520) else "0";
    B_TDATA <= A_temp_data_V_1_fu_94;

    B_TDATA_blk_n_assign_proc : process(B_TREADY, ap_sig_cseq_ST_pp1_stg0_fsm_9, ap_reg_ppiten_pp1_it1, or_cond_reg_534)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)))) then 
            B_TDATA_blk_n <= B_TREADY;
        else 
            B_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    B_TDEST <= A_temp_dest_V_1_fu_114;
    B_TID <= A_temp_id_V_1_fu_110;
    B_TKEEP <= A_temp_keep_V_1_fu_98;
    B_TLAST <= A_temp_last_V_reg_538;
    B_TSTRB <= A_temp_strb_V_1_fu_102;
    B_TUSER <= A_temp_user_V_1_fu_106;

    B_TVALID_assign_proc : process(ap_sig_cseq_ST_pp1_stg0_fsm_9, ap_reg_ppiten_pp1_it0, ap_reg_ppiten_pp1_it1, or_cond_reg_534, ap_sig_175, ap_reg_ioackin_B_TREADY)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = or_cond_reg_534)) and not(((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and ap_sig_175)) and (ap_const_logic_0 = ap_reg_ioackin_B_TREADY)))) then 
            B_TVALID <= ap_const_logic_1;
        else 
            B_TVALID <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_sig_cseq_ST_st12_fsm_10)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st12_fsm_10)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_sig_cseq_ST_st12_fsm_10)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st12_fsm_10)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    ap_sig_147_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_147 <= (ap_const_lv1_1 = ap_CS_fsm(6 downto 6));
    end process;


    ap_sig_171_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_171 <= (ap_const_lv1_1 = ap_CS_fsm(8 downto 8));
    end process;


    ap_sig_175_assign_proc : process(A_TVALID, tmp_5_fu_293_p2, match_phi_fu_183_p4)
    begin
                ap_sig_175 <= (not((tmp_5_fu_293_p2 = ap_const_lv1_0)) and (ap_const_lv1_0 = match_phi_fu_183_p4) and (A_TVALID = ap_const_logic_0));
    end process;


    ap_sig_28_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_28 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_372_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_372 <= (ap_const_lv1_1 = ap_CS_fsm(10 downto 10));
    end process;


    ap_sig_62_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_62 <= (ap_const_lv1_1 = ap_CS_fsm(7 downto 7));
    end process;


    ap_sig_69_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_69 <= (ap_const_lv1_1 = ap_CS_fsm(9 downto 9));
    end process;


    ap_sig_cseq_ST_pp1_stg0_fsm_9_assign_proc : process(ap_sig_69)
    begin
        if (ap_sig_69) then 
            ap_sig_cseq_ST_pp1_stg0_fsm_9 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp1_stg0_fsm_9 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st12_fsm_10_assign_proc : process(ap_sig_372)
    begin
        if (ap_sig_372) then 
            ap_sig_cseq_ST_st12_fsm_10 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st12_fsm_10 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_28)
    begin
        if (ap_sig_28) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st7_fsm_6_assign_proc : process(ap_sig_147)
    begin
        if (ap_sig_147) then 
            ap_sig_cseq_ST_st7_fsm_6 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st7_fsm_6 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st8_fsm_7_assign_proc : process(ap_sig_62)
    begin
        if (ap_sig_62) then 
            ap_sig_cseq_ST_st8_fsm_7 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st8_fsm_7 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st9_fsm_8_assign_proc : process(ap_sig_171)
    begin
        if (ap_sig_171) then 
            ap_sig_cseq_ST_st9_fsm_8 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st9_fsm_8 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_B_TREADY_assign_proc : process(B_TREADY, ap_reg_ioackin_B_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_B_TREADY)) then 
            ap_sig_ioackin_B_TREADY <= B_TREADY;
        else 
            ap_sig_ioackin_B_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    i_1_fu_298_p2 <= std_logic_vector(unsigned(i_reg_191) + unsigned(ap_const_lv31_1));
    i_cast_fu_289_p1 <= std_logic_vector(resize(unsigned(i_reg_191),32));

    match_phi_fu_183_p4_assign_proc : process(ap_sig_cseq_ST_pp1_stg0_fsm_9, ap_reg_ppiten_pp1_it1, match_reg_179, tmp_5_reg_525)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp1_stg0_fsm_9) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and not((ap_const_lv1_0 = tmp_5_reg_525)))) then 
            match_phi_fu_183_p4 <= ap_const_lv1_0;
        else 
            match_phi_fu_183_p4 <= match_reg_179;
        end if; 
    end process;

    or_cond_fu_342_p2 <= (tmp_7_fu_337_p2 or match_phi_fu_183_p4);
    sample_counter_1_fu_348_p2 <= std_logic_vector(unsigned(sample_counter_fu_86) + unsigned(ap_const_lv32_1));
    samples_1_fu_367_p2 <= std_logic_vector(unsigned(samples_fu_90) + unsigned(ap_const_lv32_1));
    tmp_1_fu_236_p1 <= A_TDATA(32 - 1 downto 0);
    tmp_2_fu_240_p2 <= (tmp_reg_419 and tmp_1_fu_236_p1);
    tmp_3_fu_245_p2 <= "1" when (tmp_2_fu_240_p2 = tmp_reg_419) else "0";
    tmp_4_fu_250_p2 <= std_logic_vector(signed(length_read_reg_413) + signed(ap_const_lv32_FFFFFFFF));
    tmp_5_fu_293_p2 <= "1" when (signed(i_cast_fu_289_p1) < signed(total_input_samples_reg_425)) else "0";
    tmp_7_fu_337_p2 <= "1" when (sample_counter_fu_86 = sample_rate_read_reg_407) else "0";
    tmp_fu_232_p1 <= data_compare_V(32 - 1 downto 0);
end behav;
