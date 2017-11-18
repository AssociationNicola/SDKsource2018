//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
//Date        : Fri Jan 15 13:29:59 2016
//Host        : graham-Latitude-E5500 running 64-bit Ubuntu 14.04.3 LTS
//Command     : generate_target PS_PL_wrapper.bd
//Design      : PS_PL_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module PS_PL_wrapper
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

  wire [0:0]adc_cal;
  wire [3:0]adc_gain;
  wire [0:0]attenuatoron;
  wire [0:0]classd_hina;
  wire [0:0]classd_hinb;
  wire [0:0]classd_lina;
  wire [0:0]classd_linb;
  wire [0:0]conv;
  wire [0:0]keepon;
  wire [0:0]lcdcontrast;
  wire [2:0]lcdctrl;
  wire [7:0]lcddata;
  wire [0:0]ledb;
  wire [0:0]ledg;
  wire [0:0]ledr;
  wire [0:0]ptt;
  wire [0:0]pwmaudio;
  wire [0:0]rs232_from_bt;
  wire [0:0]rs232_to_bt;
  wire [0:0]rs232rx;
  wire [0:0]rs232tx;
  wire [0:0]rst_bb;
  wire [0:0]sck;
  wire [0:0]sclk_bt;
  wire [0:0]sdoa;
  wire [0:0]sdob;
  wire [0:0]sfs_bt;
  wire [0:0]srd_bt;
  wire [0:0]std_bt;
  wire [0:0]strobe;
  wire [0:0]touchup;
  wire [0:0]tx_low;

PS_PL PS_PL_i
       (.adc_cal(adc_cal),
        .adc_gain(adc_gain),
        .attenuatoron(attenuatoron),
        .classd_hina(classd_hina),
        .classd_hinb(classd_hinb),
        .classd_lina(classd_lina),
        .classd_linb(classd_linb),
        .conv(conv),
        .keepon(keepon),
        .lcdcontrast(lcdcontrast),
        .lcdctrl(lcdctrl),
        .lcddata(lcddata),
        .ledb(ledb),
        .ledg(ledg),
        .ledr(ledr),
        .ptt(ptt),
        .pwmaudio(pwmaudio),
        .rs232_from_bt(rs232_from_bt),
        .rs232_to_bt(rs232_to_bt),
        .rs232rx(rs232rx),
        .rs232tx(rs232tx),
        .rst_bb(rst_bb),
        .sck(sck),
        .sclk_bt(sclk_bt),
        .sdoa(sdoa),
        .sdob(sdob),
        .sfs_bt(sfs_bt),
        .srd_bt(srd_bt),
        .std_bt(std_bt),
        .strobe(strobe),
        .touchup(touchup),
        .tx_low(tx_low));
endmodule
