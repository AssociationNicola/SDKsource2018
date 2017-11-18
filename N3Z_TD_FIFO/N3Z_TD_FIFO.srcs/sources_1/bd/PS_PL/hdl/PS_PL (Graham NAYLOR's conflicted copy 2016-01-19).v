//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
//Date        : Fri Jan 15 13:29:57 2016
//Host        : graham-Latitude-E5500 running 64-bit Ubuntu 14.04.3 LTS
//Command     : generate_target PS_PL.bd
//Design      : PS_PL
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module PS_PL
   (adc_cal,
    adc_gain,
    attenuatoron,
    classd_hina,
    classd_hinb,
    classd_lina,
    classd_linb,
    conv,
    keepon,
    lcdcontrast,
    lcdctrl,
    lcddata,
    ledb,
    ledg,
    ledr,
    ptt,
    pwmaudio,
    rs232_from_bt,
    rs232_to_bt,
    rs232rx,
    rs232tx,
    rst_bb,
    sck,
    sclk_bt,
    sdoa,
    sdob,
    sfs_bt,
    srd_bt,
    std_bt,
    strobe,
    touchup,
    tx_low);
  output [0:0]adc_cal;
  output [3:0]adc_gain;
  output [0:0]attenuatoron;
  output [0:0]classd_hina;
  output [0:0]classd_hinb;
  output [0:0]classd_lina;
  output [0:0]classd_linb;
  output [0:0]conv;
  output [0:0]keepon;
  output [0:0]lcdcontrast;
  output [2:0]lcdctrl;
  output [7:0]lcddata;
  output [0:0]ledb;
  output [0:0]ledg;
  output [0:0]ledr;
  input [0:0]ptt;
  output [0:0]pwmaudio;
  input [0:0]rs232_from_bt;
  output [0:0]rs232_to_bt;
  input [0:0]rs232rx;
  output [0:0]rs232tx;
  output [0:0]rst_bb;
  output [0:0]sck;
  output [0:0]sclk_bt;
  input [0:0]sdoa;
  input [0:0]sdob;
  output [0:0]sfs_bt;
  output [0:0]srd_bt;
  input [0:0]std_bt;
  output [0:0]strobe;
  input [0:0]touchup;
  output [0:0]tx_low;

  wire JTAG_Monitor_0_TCK;
  wire JTAG_Monitor_0_TDI;
  wire JTAG_Monitor_0_TMS;
  wire clk_wiz_0_clk_out1;
  wire [0:0]n3_te0722_0_adc_cal;
  wire [3:0]n3_te0722_0_adc_gain;
  wire [0:0]n3_te0722_0_attenuatoron;
  wire [0:0]n3_te0722_0_classd_hina;
  wire [0:0]n3_te0722_0_classd_hinb;
  wire [0:0]n3_te0722_0_classd_lina;
  wire [0:0]n3_te0722_0_classd_linb;
  wire [0:0]n3_te0722_0_conv;
  wire [0:0]n3_te0722_0_keepon;
  wire [0:0]n3_te0722_0_lcdcontrast;
  wire [2:0]n3_te0722_0_lcdctrl;
  wire [7:0]n3_te0722_0_lcddata;
  wire [0:0]n3_te0722_0_ledb;
  wire [0:0]n3_te0722_0_ledg;
  wire [0:0]n3_te0722_0_ledr;
  wire [0:0]n3_te0722_0_pwmaudio;
  wire [0:0]n3_te0722_0_rs232_to_bt;
  wire [0:0]n3_te0722_0_rs232tx;
  wire [0:0]n3_te0722_0_rst_bb;
  wire [0:0]n3_te0722_0_sck;
  wire [0:0]n3_te0722_0_sclk_bt;
  wire [0:0]n3_te0722_0_sfs_bt;
  wire [0:0]n3_te0722_0_srd_bt;
  wire [0:0]n3_te0722_0_strobe;
  wire [0:0]n3_te0722_0_tx_low;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_RESET0_N;
  wire [0:0]ptt_1;
  wire [0:0]rs232_from_bt_1;
  wire [0:0]rs232rx_1;
  wire [0:0]sdoa_1;
  wire [0:0]sdob_1;
  wire [0:0]std_bt_1;
  wire [0:0]touchup_1;

  assign adc_cal[0] = n3_te0722_0_adc_cal;
  assign adc_gain[3:0] = n3_te0722_0_adc_gain;
  assign attenuatoron[0] = n3_te0722_0_attenuatoron;
  assign classd_hina[0] = n3_te0722_0_classd_hina;
  assign classd_hinb[0] = n3_te0722_0_classd_hinb;
  assign classd_lina[0] = n3_te0722_0_classd_lina;
  assign classd_linb[0] = n3_te0722_0_classd_linb;
  assign conv[0] = n3_te0722_0_conv;
  assign keepon[0] = n3_te0722_0_keepon;
  assign lcdcontrast[0] = n3_te0722_0_lcdcontrast;
  assign lcdctrl[2:0] = n3_te0722_0_lcdctrl;
  assign lcddata[7:0] = n3_te0722_0_lcddata;
  assign ledb[0] = n3_te0722_0_ledb;
  assign ledg[0] = n3_te0722_0_ledg;
  assign ledr[0] = n3_te0722_0_ledr;
  assign ptt_1 = ptt[0];
  assign pwmaudio[0] = n3_te0722_0_pwmaudio;
  assign rs232_from_bt_1 = rs232_from_bt[0];
  assign rs232_to_bt[0] = n3_te0722_0_rs232_to_bt;
  assign rs232rx_1 = rs232rx[0];
  assign rs232tx[0] = n3_te0722_0_rs232tx;
  assign rst_bb[0] = n3_te0722_0_rst_bb;
  assign sck[0] = n3_te0722_0_sck;
  assign sclk_bt[0] = n3_te0722_0_sclk_bt;
  assign sdoa_1 = sdoa[0];
  assign sdob_1 = sdob[0];
  assign sfs_bt[0] = n3_te0722_0_sfs_bt;
  assign srd_bt[0] = n3_te0722_0_srd_bt;
  assign std_bt_1 = std_bt[0];
  assign strobe[0] = n3_te0722_0_strobe;
  assign touchup_1 = touchup[0];
  assign tx_low[0] = n3_te0722_0_tx_low;
PS_PL_JTAG_Monitor_0_0 JTAG_Monitor_0
       (.TCK(JTAG_Monitor_0_TCK),
        .TDI(JTAG_Monitor_0_TDI),
        .TMS(JTAG_Monitor_0_TMS));
PS_PL_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(processing_system7_0_FCLK_CLK0),
        .clk_out1(clk_wiz_0_clk_out1),
        .resetn(processing_system7_0_FCLK_RESET0_N));
PS_PL_n3_te0722_0_0 n3_te0722_0
       (.adc_cal(n3_te0722_0_adc_cal),
        .adc_gain(n3_te0722_0_adc_gain),
        .attenuatoron(n3_te0722_0_attenuatoron),
        .classd_hina(n3_te0722_0_classd_hina),
        .classd_hinb(n3_te0722_0_classd_hinb),
        .classd_lina(n3_te0722_0_classd_lina),
        .classd_linb(n3_te0722_0_classd_linb),
        .clk(clk_wiz_0_clk_out1),
        .conv(n3_te0722_0_conv),
        .keepon(n3_te0722_0_keepon),
        .lcdcontrast(n3_te0722_0_lcdcontrast),
        .lcdctrl(n3_te0722_0_lcdctrl),
        .lcddata(n3_te0722_0_lcddata),
        .ledb(n3_te0722_0_ledb),
        .ledg(n3_te0722_0_ledg),
        .ledr(n3_te0722_0_ledr),
        .ptt(ptt_1),
        .pwmaudio(n3_te0722_0_pwmaudio),
        .rs232_from_bt(rs232_from_bt_1),
        .rs232_to_bt(n3_te0722_0_rs232_to_bt),
        .rs232rx(rs232rx_1),
        .rs232tx(n3_te0722_0_rs232tx),
        .rst_bb(n3_te0722_0_rst_bb),
        .sck(n3_te0722_0_sck),
        .sclk_bt(n3_te0722_0_sclk_bt),
        .sdoa(sdoa_1),
        .sdob(sdob_1),
        .sfs_bt(n3_te0722_0_sfs_bt),
        .srd_bt(n3_te0722_0_srd_bt),
        .std_bt(std_bt_1),
        .strobe(n3_te0722_0_strobe),
        .touchdown(JTAG_Monitor_0_TDI),
        .touchon(JTAG_Monitor_0_TCK),
        .touchselect(JTAG_Monitor_0_TMS),
        .touchup(touchup_1),
        .tx_low(n3_te0722_0_tx_low));
PS_PL_processing_system7_0_0 processing_system7_0
       (.FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N));
endmodule
