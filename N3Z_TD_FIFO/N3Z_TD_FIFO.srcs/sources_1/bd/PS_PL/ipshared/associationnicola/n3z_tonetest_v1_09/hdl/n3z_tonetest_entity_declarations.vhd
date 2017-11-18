-------------------------------------------------------------------
-- System Generator version 2016.2 VHDL source file.
--
-- Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_5415befb51 is
  port (
    in0 : in std_logic_vector((13 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((8 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    in5 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_5415befb51;
architecture behavior of sysgen_concat_5415befb51
is
  signal in0_1_23: unsigned((13 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((8 - 1) downto 0);
  signal in4_1_39: boolean;
  signal in5_1_43: boolean;
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= ((in4) = "1");
  in5_1_43 <= ((in5) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & boolean_to_vector(in4_1_39) & boolean_to_vector(in5_1_43));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_777e3bf1fb is
  port (
    in0 : in std_logic_vector((4 - 1) downto 0);
    in1 : in std_logic_vector((3 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_777e3bf1fb;
architecture behavior of sysgen_concat_777e3bf1fb
is
  signal in0_1_23: unsigned((4 - 1) downto 0);
  signal in1_1_27: unsigned((3 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_6f3f039edd is
  port (
    in0 : in std_logic_vector((4 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_6f3f039edd;
architecture behavior of sysgen_concat_6f3f039edd
is
  signal in0_1_23: unsigned((4 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((1 - 1) downto 0);
  signal in4_1_39: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_d104d974bd is
  port (
    in0 : in std_logic_vector((3 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_d104d974bd;
architecture behavior of sysgen_concat_d104d974bd
is
  signal in0_1_23: unsigned((3 - 1) downto 0);
  signal in1_1_27: boolean;
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal in3_1_35: boolean;
  signal y_2_1_concat: unsigned((13 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= ((in1) = "1");
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= ((in3) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & boolean_to_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & boolean_to_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_a1f626190f is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((4 - 1) downto 0);
    in3 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_a1f626190f;
architecture behavior of sysgen_concat_a1f626190f
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((4 - 1) downto 0);
  signal in3_1_35: unsigned((18 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_ad7d5ccd72 is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_ad7d5ccd72;
architecture behavior of sysgen_concat_ad7d5ccd72
is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_5a627205b8 is
  port (
    in0 : in std_logic_vector((4 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_5a627205b8;
architecture behavior of sysgen_concat_5a627205b8
is
  signal in0_1_23: unsigned((4 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((20 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_070b4565d5 is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    in3 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_070b4565d5;
architecture behavior of sysgen_concat_070b4565d5
is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal in3_1_35: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_5e580550d8 is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_5e580550d8;
architecture behavior of sysgen_constant_5e580550d8
is
begin
  op <= "111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_ed2983513d is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_ed2983513d;
architecture behavior of sysgen_constant_ed2983513d
is
begin
  op <= "0000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_c00788aea8 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_c00788aea8;
architecture behavior of sysgen_constant_c00788aea8
is
begin
  op <= "00001010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_aa73bd71eb is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_aa73bd71eb;
architecture behavior of sysgen_constant_aa73bd71eb
is
begin
  op <= "0";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_43831abc60 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_43831abc60;
architecture behavior of sysgen_constant_43831abc60
is
begin
  op <= "0000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_90e08939e1 is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_90e08939e1;
architecture behavior of sysgen_constant_90e08939e1
is
begin
  op <= "00";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

--$Header: /devl/xcs/repo/env/Jobs/sysgen/src/xbs/blocks/xlconvert/hdl/xlconvert.vhd,v 1.1 2004/11/22 00:17:30 rosty Exp $
---------------------------------------------------------------------
--
--  Filename      : xlconvert.vhd
--
--  Description   : VHDL description of a fixed point converter block that
--                  converts the input to a new output type.

--
---------------------------------------------------------------------


---------------------------------------------------------------------
--
--  Entity        : xlconvert
--
--  Architecture  : behavior
--
--  Description   : Top level VHDL description of fixed point conver block.
--
---------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity convert_func_call_n3z_tonetest_xlconvert is
    generic (
        din_width    : integer := 16;            -- Width of input
        din_bin_pt   : integer := 4;             -- Binary point of input
        din_arith    : integer := xlUnsigned;    -- Type of arith of input
        dout_width   : integer := 8;             -- Width of output
        dout_bin_pt  : integer := 2;             -- Binary point of output
        dout_arith   : integer := xlUnsigned;    -- Type of arith of output
        quantization : integer := xlTruncate;    -- xlRound or xlTruncate
        overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        result : out std_logic_vector (dout_width-1 downto 0));
end convert_func_call_n3z_tonetest_xlconvert ;

architecture behavior of convert_func_call_n3z_tonetest_xlconvert is
begin
    -- Convert to output type and do saturation arith.
    result <= convert_type(din, din_width, din_bin_pt, din_arith,
                           dout_width, dout_bin_pt, dout_arith,
                           quantization, overflow);
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity n3z_tonetest_xlconvert  is
    generic (
        din_width    : integer := 16;            -- Width of input
        din_bin_pt   : integer := 4;             -- Binary point of input
        din_arith    : integer := xlUnsigned;    -- Type of arith of input
        dout_width   : integer := 8;             -- Width of output
        dout_bin_pt  : integer := 2;             -- Binary point of output
        dout_arith   : integer := xlUnsigned;    -- Type of arith of output
        en_width     : integer := 1;
        en_bin_pt    : integer := 0;
        en_arith     : integer := xlUnsigned;
        bool_conversion : integer :=0;           -- if one, convert ufix_1_0 to
                                                 -- bool
        latency      : integer := 0;             -- Ouput delay clk cycles
        quantization : integer := xlTruncate;    -- xlRound or xlTruncate
        overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        en  : in std_logic_vector (en_width-1 downto 0);
        ce  : in std_logic;
        clr : in std_logic;
        clk : in std_logic;
        dout : out std_logic_vector (dout_width-1 downto 0));

end n3z_tonetest_xlconvert ;

architecture behavior of n3z_tonetest_xlconvert  is

    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;

    component convert_func_call_n3z_tonetest_xlconvert 
        generic (
            din_width    : integer := 16;            -- Width of input
            din_bin_pt   : integer := 4;             -- Binary point of input
            din_arith    : integer := xlUnsigned;    -- Type of arith of input
            dout_width   : integer := 8;             -- Width of output
            dout_bin_pt  : integer := 2;             -- Binary point of output
            dout_arith   : integer := xlUnsigned;    -- Type of arith of output
            quantization : integer := xlTruncate;    -- xlRound or xlTruncate
            overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
        port (
            din : in std_logic_vector (din_width-1 downto 0);
            result : out std_logic_vector (dout_width-1 downto 0));
    end component;


    -- synthesis translate_off
--    signal real_din, real_dout : real;    -- For debugging info ports
    -- synthesis translate_on
    signal result : std_logic_vector(dout_width-1 downto 0);
    signal internal_ce : std_logic;

begin

    -- Debugging info for internal full precision variables
    -- synthesis translate_off
--     real_din <= to_real(din, din_bin_pt, din_arith);
--     real_dout <= to_real(dout, dout_bin_pt, dout_arith);
    -- synthesis translate_on

    internal_ce <= ce and en(0);

    bool_conversion_generate : if (bool_conversion = 1)
    generate
      result <= din;
    end generate; --bool_conversion_generate

    std_conversion_generate : if (bool_conversion = 0)
    generate
      -- Workaround for XST bug
      convert : convert_func_call_n3z_tonetest_xlconvert 
        generic map (
          din_width   => din_width,
          din_bin_pt  => din_bin_pt,
          din_arith   => din_arith,
          dout_width  => dout_width,
          dout_bin_pt => dout_bin_pt,
          dout_arith  => dout_arith,
          quantization => quantization,
          overflow     => overflow)
        port map (
          din => din,
          result => result);
    end generate; --std_conversion_generate

    latency_test : if (latency > 0) generate
        reg : synth_reg
            generic map (
              width => dout_width,
              latency => latency
            )
            port map (
              i => result,
              ce => internal_ce,
              clr => clr,
              clk => clk,
              o => dout
            );
    end generate;

    latency0 : if (latency = 0)
    generate
        dout <= result;
    end generate latency0;

end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlregister.vhd
--
--  Description   : VHDL description of an arbitrary wide register.
--                  Unlike the delay block, an initial value is
--                  specified and is considered valid at the start
--                  of simulation.  The register is only one word
--                  deep.
--
--  Mod. History  : Removed valid bit logic from wrapper.
--                : Changed VHDL to use a bit_vector generic for its
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity n3z_tonetest_xlregister is

   generic (d_width          : integer := 5;          -- Width of d input
            init_value       : bit_vector := b"00");  -- Binary init value string

   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));

end n3z_tonetest_xlregister;

architecture behavior of n3z_tonetest_xlregister is

   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component; -- end synth_reg_w_init

   -- synthesis translate_off
   signal real_d, real_q           : real;    -- For debugging info ports
   -- synthesis translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;

begin

   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;

   -- Synthesizable behavioral model
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);

end architecture behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity n3z_tonetest_xldelay is
   generic(width        : integer := -1;
           latency      : integer := -1;
           reg_retiming : integer :=  0;
           reset        : integer :=  0);
   port(d       : in std_logic_vector (width-1 downto 0);
        ce      : in std_logic;
        clk     : in std_logic;
        en      : in std_logic;
        rst     : in std_logic;
        q       : out std_logic_vector (width-1 downto 0));

end n3z_tonetest_xldelay;

architecture behavior of n3z_tonetest_xldelay is
   component synth_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component; -- end component synth_reg

   component synth_reg_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component;

   signal internal_ce  : std_logic;

begin
   internal_ce  <= ce and en;

   srl_delay: if ((reg_retiming = 0) and (reset = 0)) or (latency < 1) generate
     synth_reg_srl_inst : synth_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => '0',
         clk => clk,
         o   => q);
   end generate srl_delay;

   reg_delay: if ((reg_retiming = 1) or (reset = 1)) and (latency >= 1) generate
     synth_reg_reg_inst : synth_reg_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => rst,
         clk => clk,
         o   => q);
   end generate reg_delay;
end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_inverter_5105f17b7b is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_inverter_5105f17b7b;
architecture behavior of sysgen_inverter_5105f17b7b
is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= boolean_to_vector(internal_ip_12_1_bitnot);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_inverter_a35fcdf048 is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_inverter_a35fcdf048;
architecture behavior of sysgen_inverter_a35fcdf048
is
  signal ip_1_26: unsigned((1 - 1) downto 0);
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => "0");
  signal op_mem_22_20_front_din: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_back: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: unsigned((1 - 1) downto 0);
begin
  ip_1_26 <= std_logic_vector_to_unsigned(ip);
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(ip_1_26));
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(internal_ip_12_1_bitnot);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_inverter_4e357e05b1 is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_inverter_4e357e05b1;
architecture behavior of sysgen_inverter_4e357e05b1
is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_front_din <= internal_ip_12_1_bitnot;
  op_mem_22_20_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_22_20_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_cddbae5b41 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_cddbae5b41;
architecture behavior of sysgen_logical_cddbae5b41
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (2 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    '0',
    '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(1);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        for i in 1 downto 1 loop 
          latency_pipe_5_26(i) <= latency_pipe_5_26(i-1);
        end loop;
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_222ceed782 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_222ceed782;
architecture behavior of sysgen_logical_222ceed782
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => "0");
  signal latency_pipe_5_26_front_din: std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26_back: std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= latency_pipe_5_26_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_e45b646e6b is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_e45b646e6b;
architecture behavior of sysgen_logical_e45b646e6b
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_7eb4d35172 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_7eb4d35172;
architecture behavior of sysgen_logical_7eb4d35172
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_d2cee2c8ad is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_d2cee2c8ad;
architecture behavior of sysgen_logical_d2cee2c8ad
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_78a6f25df3 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_78a6f25df3;
architecture behavior of sysgen_logical_78a6f25df3
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_6a992bfb4c is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    d2 : in std_logic_vector((32 - 1) downto 0);
    d3 : in std_logic_vector((32 - 1) downto 0);
    d4 : in std_logic_vector((32 - 1) downto 0);
    d5 : in std_logic_vector((32 - 1) downto 0);
    d6 : in std_logic_vector((32 - 1) downto 0);
    d7 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_6a992bfb4c;
architecture behavior of sysgen_mux_6a992bfb4c
is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal d2_1_30: std_logic_vector((32 - 1) downto 0);
  signal d3_1_33: std_logic_vector((32 - 1) downto 0);
  signal d4_1_36: std_logic_vector((32 - 1) downto 0);
  signal d5_1_39: std_logic_vector((32 - 1) downto 0);
  signal d6_1_42: std_logic_vector((32 - 1) downto 0);
  signal d7_1_45: std_logic_vector((32 - 1) downto 0);
  type array_type_pipe_28_22 is array (0 to (1 - 1)) of std_logic_vector((32 - 1) downto 0);
  signal pipe_28_22: array_type_pipe_28_22 := (
    0 => "00000000000000000000000000000000");
  signal pipe_28_22_front_din: std_logic_vector((32 - 1) downto 0);
  signal pipe_28_22_back: std_logic_vector((32 - 1) downto 0);
  signal pipe_28_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  pipe_28_22_back <= pipe_28_22(0);
  proc_pipe_28_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_28_22_push_front_pop_back_en = '1')) then
        pipe_28_22(0) <= pipe_28_22_front_din;
      end if;
    end if;
  end process proc_pipe_28_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when "100" =>
        unregy_join_6_1 <= d4_1_36;
      when "101" =>
        unregy_join_6_1 <= d5_1_39;
      when "110" =>
        unregy_join_6_1 <= d6_1_42;
      when others =>
        unregy_join_6_1 <= d7_1_45;
    end case;
  end process proc_switch_6_1;
  pipe_28_22_front_din <= unregy_join_6_1;
  pipe_28_22_push_front_pop_back_en <= '1';
  y <= pipe_28_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_b3f130dff9 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_b3f130dff9;
architecture behavior of sysgen_mux_b3f130dff9
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_c3014f6b16 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_c3014f6b16;
architecture behavior of sysgen_mux_c3014f6b16
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic;
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => '0');
  signal pipe_16_22_front_din: std_logic;
  signal pipe_16_22_back: std_logic;
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(pipe_16_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_d547233a22 is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    d4 : in std_logic_vector((1 - 1) downto 0);
    d5 : in std_logic_vector((1 - 1) downto 0);
    d6 : in std_logic_vector((1 - 1) downto 0);
    d7 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_d547233a22;
architecture behavior of sysgen_mux_d547233a22
is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  signal d4_1_36: std_logic;
  signal d5_1_39: std_logic;
  signal d6_1_42: std_logic;
  signal d7_1_45: std_logic;
  type array_type_pipe_28_22 is array (0 to (1 - 1)) of std_logic;
  signal pipe_28_22: array_type_pipe_28_22 := (
    0 => '0');
  signal pipe_28_22_front_din: std_logic;
  signal pipe_28_22_back: std_logic;
  signal pipe_28_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  d4_1_36 <= d4(0);
  d5_1_39 <= d5(0);
  d6_1_42 <= d6(0);
  d7_1_45 <= d7(0);
  pipe_28_22_back <= pipe_28_22(0);
  proc_pipe_28_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_28_22_push_front_pop_back_en = '1')) then
        pipe_28_22(0) <= pipe_28_22_front_din;
      end if;
    end if;
  end process proc_pipe_28_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when "100" =>
        unregy_join_6_1 <= d4_1_36;
      when "101" =>
        unregy_join_6_1 <= d5_1_39;
      when "110" =>
        unregy_join_6_1 <= d6_1_42;
      when others =>
        unregy_join_6_1 <= d7_1_45;
    end case;
  end process proc_switch_6_1;
  pipe_28_22_front_din <= unregy_join_6_1;
  pipe_28_22_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(pipe_28_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_8fc09b2680 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_8fc09b2680;
architecture behavior of sysgen_mux_8fc09b2680
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000");
  signal pipe_16_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_bce6d4f7b3 is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_bce6d4f7b3;
architecture behavior of sysgen_reinterpret_bce6d4f7b3
is
  signal input_port_1_40: unsigned((16 - 1) downto 0);
  signal output_port_5_5_force: signed((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_8b540ca26d is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_8b540ca26d;
architecture behavior of sysgen_reinterpret_8b540ca26d
is
  signal input_port_1_40: signed((16 - 1) downto 0);
  signal output_port_5_5_force: unsigned((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_70903483da is
  port (
    input_port : in std_logic_vector((18 - 1) downto 0);
    output_port : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_70903483da;
architecture behavior of sysgen_reinterpret_70903483da
is
  signal input_port_1_40: signed((18 - 1) downto 0);
  signal output_port_5_5_force: unsigned((18 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_0aab830ee0 is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_0aab830ee0;
architecture behavior of sysgen_reinterpret_0aab830ee0
is
  signal input_port_1_40: unsigned((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_15640a82da is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_15640a82da;
architecture behavior of sysgen_relational_15640a82da
is
  signal a_1_31: unsigned((16 - 1) downto 0);
  signal b_1_34: unsigned((16 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_eb56806bdd is
  port (
    a : in std_logic_vector((6 - 1) downto 0);
    b : in std_logic_vector((6 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_eb56806bdd;
architecture behavior of sysgen_relational_eb56806bdd
is
  signal a_1_31: unsigned((6 - 1) downto 0);
  signal b_1_34: unsigned((6 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_18_3_rel <= a_1_31 > b_1_34;
  op_mem_37_22_front_din <= result_18_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_a8082771c2 is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_a8082771c2;
architecture behavior of sysgen_relational_a8082771c2
is
  signal a_1_31: unsigned((8 - 1) downto 0);
  signal b_1_34: unsigned((8 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlslice.vhd
--
--  Description   : VHDL description of a block that sets the output to a
--                  specified range of the input bits. The output is always
--                  set to an unsigned type with it's binary point at zero.
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity n3z_tonetest_xlslice is
    generic (
        new_msb      : integer := 9;           -- position of new msb
        new_lsb      : integer := 1;           -- position of new lsb
        x_width      : integer := 16;          -- Width of x input
        y_width      : integer := 8);          -- Width of y output
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end n3z_tonetest_xlslice;

architecture behavior of n3z_tonetest_xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_73376b6c30 is
  port (
    in0 : in std_logic_vector((15 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_73376b6c30;
architecture behavior of sysgen_concat_73376b6c30
is
  signal in0_1_23: unsigned((15 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e539002db5 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e539002db5;
architecture behavior of sysgen_constant_e539002db5
is
begin
  op <= "1";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_a9615b3741 is
  port (
    op : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_a9615b3741;
architecture behavior of sysgen_constant_a9615b3741
is
begin
  op <= "10011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_counter_d6d8543bb8 is
  port (
    rst : in std_logic_vector((1 - 1) downto 0);
    en : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_counter_d6d8543bb8;
architecture behavior of sysgen_counter_d6d8543bb8
is
  signal rst_1_40: boolean;
  signal en_1_45: boolean;
  signal count_reg_20_23: unsigned((1 - 1) downto 0) := "0";
  signal count_reg_20_23_rst: std_logic;
  signal count_reg_20_23_en: std_logic;
  signal rel_34_8: boolean;
  signal rst_limit_join_34_5: boolean;
  signal rst_limit_join_33_3: boolean;
  signal bool_44_4: boolean;
  signal rst_limit_join_44_1: boolean;
  signal count_reg_join_44_1: unsigned((2 - 1) downto 0);
  signal count_reg_join_44_1_en: std_logic;
  signal count_reg_join_44_1_rst: std_logic;
begin
  rst_1_40 <= ((rst) = "1");
  en_1_45 <= ((en) = "1");
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (count_reg_20_23_rst = '1')) then
        count_reg_20_23 <= "0";
      elsif ((ce = '1') and (count_reg_20_23_en = '1')) then 
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("1");
      end if;
    end if;
  end process proc_count_reg_20_23;
  rel_34_8 <= count_reg_20_23 = std_logic_vector_to_unsigned("1");
  proc_if_34_5: process (rel_34_8)
  is
  begin
    if rel_34_8 then
      rst_limit_join_34_5 <= true;
    else 
      rst_limit_join_34_5 <= false;
    end if;
  end process proc_if_34_5;
  proc_if_33_3: process (en_1_45, rst_limit_join_34_5)
  is
  begin
    if en_1_45 then
      rst_limit_join_33_3 <= rst_limit_join_34_5;
    else 
      rst_limit_join_33_3 <= false;
    end if;
  end process proc_if_33_3;
  bool_44_4 <= rst_1_40 or rst_limit_join_33_3;
  proc_if_44_1: process (bool_44_4, count_reg_20_23, en_1_45, rst_limit_join_33_3)
  is
  begin
    if bool_44_4 then
      count_reg_join_44_1_rst <= '1';
    elsif en_1_45 then
      count_reg_join_44_1_rst <= '0';
    else 
      count_reg_join_44_1_rst <= '0';
    end if;
    if en_1_45 then
      count_reg_join_44_1_en <= '1';
    else 
      count_reg_join_44_1_en <= '0';
    end if;
    if bool_44_4 then
      rst_limit_join_44_1 <= false;
    elsif en_1_45 then
      rst_limit_join_44_1 <= rst_limit_join_33_3;
    else 
      rst_limit_join_44_1 <= rst_limit_join_33_3;
    end if;
  end process proc_if_44_1;
  count_reg_20_23_rst <= count_reg_join_44_1_rst;
  count_reg_20_23_en <= count_reg_join_44_1_en;
  op <= unsigned_to_std_logic_vector(count_reg_20_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_ef59dabc43 is
  port (
    a : in std_logic_vector((6 - 1) downto 0);
    b : in std_logic_vector((5 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_ef59dabc43;
architecture behavior of sysgen_relational_ef59dabc43
is
  signal a_1_31: unsigned((6 - 1) downto 0);
  signal b_1_34: unsigned((5 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal cast_22_17: unsigned((6 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  cast_22_17 <= u2u_cast(b_1_34, 0, 6, 0);
  result_22_3_rel <= a_1_31 >= cast_22_17;
  op_mem_37_22_front_din <= result_22_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_7ce6ed9657 is
  port (
    b : in std_logic_vector((20 - 1) downto 0);
    q : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_7ce6ed9657;
architecture behavior of sysgen_accum_7ce6ed9657
is
  signal b_17_24: unsigned((20 - 1) downto 0);
  signal accum_reg_39_23: unsigned((24 - 1) downto 0) := "000000000000000000000000";
  signal cast_49_42: unsigned((24 - 1) downto 0);
begin
  b_17_24 <= std_logic_vector_to_unsigned(b);
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        accum_reg_39_23 <= accum_reg_39_23 + cast_49_42;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  cast_49_42 <= u2u_cast(b_17_24, 0, 24, 0);
  q <= unsigned_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_ade4088759 is
  port (
    op : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_ade4088759;
architecture behavior of sysgen_constant_ade4088759
is
begin
  op <= "00101010101010101010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_173715c57c is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_173715c57c;
architecture behavior of sysgen_constant_173715c57c
is
begin
  op <= "111100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_22d21fabad is
  port (
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_22d21fabad;
architecture behavior of sysgen_relational_22d21fabad
is
  signal a_1_31: unsigned((9 - 1) downto 0);
  signal b_1_34: unsigned((9 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_20_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_20_3_rel <= a_1_31 <= b_1_34;
  op_mem_37_22_front_din <= result_20_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_e7013a6c42 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_e7013a6c42;
architecture behavior of sysgen_logical_e7013a6c42
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_3097dd369f is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((14 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_3097dd369f;
architecture behavior of sysgen_concat_3097dd369f
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((14 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_2780f822c8 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_2780f822c8;
architecture behavior of sysgen_constant_2780f822c8
is
begin
  op <= "0100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e5b787ccc8 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e5b787ccc8;
architecture behavior of sysgen_constant_e5b787ccc8
is
begin
  op <= "1000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_a9bcc6fcd1 is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_a9bcc6fcd1;
architecture behavior of sysgen_relational_a9bcc6fcd1
is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_16_3_rel <= a_1_31 < b_1_34;
  op_mem_37_22_front_din <= result_16_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_fd8438917a is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_fd8438917a;
architecture behavior of sysgen_relational_fd8438917a
is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_18_3_rel <= a_1_31 > b_1_34;
  op_mem_37_22_front_din <= result_18_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_8327f19d3f is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_8327f19d3f;
architecture behavior of sysgen_concat_8327f19d3f
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((2 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_3468eb371a is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((14 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_3468eb371a;
architecture behavior of sysgen_concat_3468eb371a
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((14 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_727dcb5418 is
  port (
    op : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_727dcb5418;
architecture behavior of sysgen_constant_727dcb5418
is
begin
  op <= "00000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_701f520abc is
  port (
    a : in std_logic_vector((14 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    en : in std_logic_vector((1 - 1) downto 0);
    s : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_701f520abc;
architecture behavior of sysgen_addsub_701f520abc
is
  signal a_17_32: unsigned((14 - 1) downto 0);
  signal b_17_35: unsigned((16 - 1) downto 0);
  signal en_17_38: boolean;
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of unsigned((16 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000");
  signal op_mem_91_20_front_din: unsigned((16 - 1) downto 0);
  signal op_mem_91_20_back: unsigned((16 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: unsigned((17 - 1) downto 0);
  signal cast_69_22: unsigned((17 - 1) downto 0);
  signal internal_s_69_5_addsub: unsigned((17 - 1) downto 0);
  signal cast_internal_s_83_3_convert: unsigned((16 - 1) downto 0);
  signal cout_mem_shift_join_113_3: unsigned((1 - 1) downto 0);
  signal cout_mem_shift_join_113_3_en: std_logic;
  signal op_mem_shift_join_113_3: unsigned((16 - 1) downto 0);
  signal op_mem_shift_join_113_3_en: std_logic;
begin
  a_17_32 <= std_logic_vector_to_unsigned(a);
  b_17_35 <= std_logic_vector_to_unsigned(b);
  en_17_38 <= ((en) = "1");
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= u2u_cast(a_17_32, 0, 17, 0);
  cast_69_22 <= u2u_cast(b_17_35, 0, 17, 0);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= u2u_cast(internal_s_69_5_addsub, 0, 16, 0);
  proc_if_113_3: process (cast_internal_s_83_3_convert, en_17_38)
  is
  begin
    if en_17_38 then
      cout_mem_shift_join_113_3_en <= '1';
    else 
      cout_mem_shift_join_113_3_en <= '0';
    end if;
    if en_17_38 then
      op_mem_shift_join_113_3_en <= '1';
    else 
      op_mem_shift_join_113_3_en <= '0';
    end if;
    op_mem_shift_join_113_3 <= cast_internal_s_83_3_convert;
  end process proc_if_113_3;
  op_mem_91_20_front_din <= op_mem_shift_join_113_3;
  op_mem_91_20_push_front_pop_back_en <= op_mem_shift_join_113_3_en;
  cout_mem_92_22_front_din <= cout_mem_shift_join_113_3;
  cout_mem_92_22_push_front_pop_back_en <= cout_mem_shift_join_113_3_en;
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= unsigned_to_std_logic_vector(op_mem_91_20_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_da2aa58f7c is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    s : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_da2aa58f7c;
architecture behavior of sysgen_addsub_da2aa58f7c
is
  signal a_17_32: unsigned((16 - 1) downto 0);
  signal b_17_35: unsigned((16 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of unsigned((16 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000");
  signal op_mem_91_20_front_din: unsigned((16 - 1) downto 0);
  signal op_mem_91_20_back: unsigned((16 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: unsigned((17 - 1) downto 0);
  signal cast_69_22: unsigned((17 - 1) downto 0);
  signal internal_s_69_5_addsub: unsigned((17 - 1) downto 0);
  signal cast_internal_s_83_3_convert: unsigned((16 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_unsigned(a);
  b_17_35 <= std_logic_vector_to_unsigned(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= u2u_cast(a_17_32, 0, 17, 0);
  cast_69_22 <= u2u_cast(b_17_35, 0, 17, 0);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= u2u_cast(internal_s_69_5_addsub, 0, 16, 0);
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= unsigned_to_std_logic_vector(cast_internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

--$Header: /devl/xcs/repo/env/Jobs/sysgen/src/xbs/hdl_pkg/xlpassthrough.vhd,v 1.1 2005/07/11 00:50:55 alexc Exp $
---------------------------------------------------------------------
--
--  Filename      : xlpassthrough.vhd
--
--  Created       : 07/09/05
--
--  Description   : VHDL description of a passthrough block
--
---------------------------------------------------------------------


---------------------------------------------------------------------
--
--  Entity        : xlpassthrough
--
--  Architecture  : passthrough_arch
--
--  Description   : Top level VHDL description of passthrough block. 
--
---------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

entity xlpassthrough is
    generic (
        din_width    : integer := 16;            -- Width of input
        dout_width   : integer := 16             -- Width of output
        );
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        dout : out std_logic_vector (dout_width-1 downto 0));
end xlpassthrough;

architecture passthrough_arch of xlpassthrough is
begin
  dout <= din;
end passthrough_arch;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_dbb3cb7125 is
  port (
    in0 : in std_logic_vector((4 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_dbb3cb7125;
architecture behavior of sysgen_concat_dbb3cb7125
is
  signal in0_1_23: unsigned((4 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: boolean;
  signal in4_1_39: boolean;
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= ((in3) = "1");
  in4_1_39 <= ((in4) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & boolean_to_vector(in3_1_35) & boolean_to_vector(in4_1_39));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

--
-------------------------------------------------------------------------------------------
-- Copyright © 2010-2012, Xilinx, Inc.
-- This file contains confidential and proprietary information of Xilinx, Inc. and is
-- protected under U.S. and international copyright and other intellectual property laws.
-------------------------------------------------------------------------------------------
--
-- Disclaimer:
-- This disclaimer is not a license and does not grant any rights to the materials
-- distributed herewith. Except as otherwise provided in a valid license issued to
-- you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
-- MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
-- DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
-- INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
-- OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
-- (whether in contract or tort, including negligence, or under any other theory
-- of liability) for any loss or damage of any kind or nature related to, arising
-- under or in connection with these materials, including for any direct, or any
-- indirect, special, incidental, or consequential loss or damage (including loss
-- of data, profits, goodwill, or any type of loss or damage suffered as a result
-- of any action brought by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-safe, or for use in any
-- application requiring fail-safe performance, such as life-support or safety
-- devices or systems, Class III medical devices, nuclear facilities, applications
-- related to the deployment of airbags, or any other applications that could lead
-- to death, personal injury, or severe property or environmental damage
-- (individually and collectively, "Critical Applications"). Customer assumes the
-- sole risk and liability of any use of Xilinx products in Critical Applications,
-- subject only to applicable laws and regulations governing limitations on product
-- liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------------------
--
-- KCPSM6 - PicoBlaze for Spartan-6 and Virtex-6 devices.
--
-- Start of design entry - 14th May 2010.
--         Alpha Version - 20th July 2010.
--           Version 1.0 - 30th September 2010. 
--           Version 1.1 - 9th February 2011. 
--                         Correction to parity computation logic.
--           Version 1.2 - 4th October 2012. 
--                         Addition of WebTalk information.
--
-- Ken Chapman
-- Xilinx Ltd
-- Benchmark House
-- 203 Brooklands Road
-- Weybridge
-- Surrey KT13 ORH
-- United Kingdom
--
-- chapman@xilinx.com
--
-------------------------------------------------------------------------------------------
--
-- Format of this file.
--
-- The module defines the implementation of the logic using Xilinx primitives.
-- These ensure predictable synthesis results and maximise the density of the implementation. 
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
-- 
-------------------------------------------------------------------------------------------
--
-- Library declarations
--
-- Standard IEEE libraries
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library unisim;
use unisim.vcomponents.all;
--
-------------------------------------------------------------------------------------------
--
-- Main Entity for kcpsm6
--CE added for System Generator and scratch increased to 256 and ISR to $FFF (GN)
--
entity kcpsm6 is
  generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";
                  interrupt_vector : std_logic_vector(11 downto 0) := X"FFF";
           scratch_pad_memory_size : integer := 256);
  port (                   address : out std_logic_vector(11 downto 0);
                       instruction : in std_logic_vector(17 downto 0);
                       bram_enable : out std_logic;
                           in_port : in std_logic_vector(7 downto 0);
                          out_port : out std_logic_vector(7 downto 0);
                           port_id : out std_logic_vector(7 downto 0);
                      write_strobe : out std_logic;
                    k_write_strobe : out std_logic;
                       read_strobe : out std_logic;
                         interrupt : in std_logic;
                     interrupt_ack : out std_logic;
                             sleep : in std_logic;
                             reset : in std_logic;
                               clk : in std_logic;
						ce : in std_logic );
  end kcpsm6;
--
-------------------------------------------------------------------------------------------
--
-- Start of Main Architecture for kcpsm6
--	 
architecture low_level_definition of kcpsm6 is
--
-------------------------------------------------------------------------------------------
--
-- Signals used in kcpsm6
--
-------------------------------------------------------------------------------------------
--
-- State Machine and Interrupt
--	 
signal          t_state_value : std_logic_vector(2 downto 1);
signal                t_state : std_logic_vector(2 downto 1);
signal              run_value : std_logic;
signal                    run : std_logic;
signal   internal_reset_value : std_logic;
signal         internal_reset : std_logic;
signal             sync_sleep : std_logic;
signal        int_enable_type : std_logic;
signal interrupt_enable_value : std_logic;
signal       interrupt_enable : std_logic;
signal         sync_interrupt : std_logic;
signal active_interrupt_value : std_logic;
signal       active_interrupt : std_logic;

--
-- Arithmetic and Logical Functions
--	 
signal      arith_logical_sel : std_logic_vector(2 downto 0);
signal         arith_carry_in : std_logic;
signal      arith_carry_value : std_logic;
signal            arith_carry : std_logic;
signal     half_arith_logical : std_logic_vector(7 downto 0);
signal     logical_carry_mask : std_logic_vector(7 downto 0);
signal    carry_arith_logical : std_logic_vector(7 downto 0);
signal    arith_logical_value : std_logic_vector(7 downto 0);
signal   arith_logical_result : std_logic_vector(7 downto 0);
--
-- Shift and Rotate Functions
--	 
signal     shift_rotate_value : std_logic_vector(7 downto 0);
signal    shift_rotate_result : std_logic_vector(7 downto 0);
signal           shift_in_bit : std_logic;
--
-- ALU structure
--	 
signal             alu_result : std_logic_vector(7 downto 0);
signal      alu_mux_sel_value : std_logic_vector(1 downto 0);
signal            alu_mux_sel : std_logic_vector(1 downto 0);
--
-- Strobes
--	
signal            strobe_type : std_logic;
signal     write_strobe_value : std_logic;
signal   k_write_strobe_value : std_logic;
signal      read_strobe_value : std_logic;
--
-- Flags
--	
signal       flag_enable_type : std_logic;
signal      flag_enable_value : std_logic;
signal            flag_enable : std_logic; 
signal           lower_parity : std_logic;
signal       lower_parity_sel : std_logic;
signal     carry_lower_parity : std_logic;
signal           upper_parity : std_logic;
signal                 parity : std_logic;
signal      shift_carry_value : std_logic;
signal            shift_carry : std_logic;
signal       carry_flag_value : std_logic;
signal             carry_flag : std_logic;

signal    use_zero_flag_value : std_logic;
signal          use_zero_flag : std_logic;
signal    drive_carry_in_zero : std_logic;
signal          carry_in_zero : std_logic;
signal             lower_zero : std_logic;
signal         lower_zero_sel : std_logic;
signal       carry_lower_zero : std_logic;
signal            middle_zero : std_logic;
signal        middle_zero_sel : std_logic;
signal      carry_middle_zero : std_logic;
signal         upper_zero_sel : std_logic;
signal        zero_flag_value : std_logic;
signal              zero_flag : std_logic;
--
-- Scratch Pad Memory
--	 
signal       spm_enable_value : std_logic;
signal             spm_enable : std_logic;
signal           spm_ram_data : std_logic_vector(7 downto 0);
signal               spm_data : std_logic_vector(7 downto 0);
--
-- Registers
--	 
signal           regbank_type : std_logic;
signal             bank_value : std_logic;
signal                   bank : std_logic;
signal          loadstar_type : std_logic;
signal         sx_addr4_value : std_logic;
signal   register_enable_type : std_logic;
signal  register_enable_value : std_logic;
signal        register_enable : std_logic;
signal                sx_addr : std_logic_vector(4 downto 0);
signal                sy_addr : std_logic_vector(4 downto 0);
signal                     sx : std_logic_vector(7 downto 0);
signal                     sy : std_logic_vector(7 downto 0);
--
-- Second Operand 
--	 
signal               sy_or_kk : std_logic_vector(7 downto 0);
--
-- Program Counter 
--	 
signal       pc_move_is_valid : std_logic;
signal              move_type : std_logic;
signal           returni_type : std_logic;
signal                pc_mode : std_logic_vector(2 downto 0);
signal        register_vector : std_logic_vector(11 downto 0);
signal                half_pc : std_logic_vector(11 downto 0);
signal               carry_pc : std_logic_vector(10 downto 0);
signal               pc_value : std_logic_vector(11 downto 0);
signal                     pc : std_logic_vector(11 downto 0);
signal              pc_vector : std_logic_vector(11 downto 0);
--
-- Program Counter Stack 
--	 
signal             push_stack : std_logic;
signal              pop_stack : std_logic;
signal           stack_memory : std_logic_vector(11 downto 0);
signal          return_vector : std_logic_vector(11 downto 0);
signal       stack_carry_flag : std_logic;
signal      shadow_carry_flag : std_logic;
signal        stack_zero_flag : std_logic;
signal      shadow_zero_value : std_logic;
signal       shadow_zero_flag : std_logic;
signal             stack_bank : std_logic;
signal            shadow_bank : std_logic;
signal              stack_bit : std_logic;
signal            special_bit : std_logic;
signal     half_pointer_value : std_logic_vector(4 downto 0);
signal     feed_pointer_value : std_logic_vector(4 downto 0);
signal    stack_pointer_carry : std_logic_vector(4 downto 0);
signal    stack_pointer_value : std_logic_vector(4 downto 0);
signal          stack_pointer : std_logic_vector(4 downto 0);
--
--
--
--**********************************************************************************
--
-- Signals between these *** lines are only made visible during simulation 
--
--synthesis translate off
--
signal kcpsm6_opcode : string(1 to 19):= "LOAD s0, s0        ";
signal kcpsm6_status : string(1 to 16):= "A,NZ,NC,ID,Reset";
signal        sim_s0 : std_logic_vector(7 downto 0);
signal        sim_s1 : std_logic_vector(7 downto 0);
signal        sim_s2 : std_logic_vector(7 downto 0);
signal        sim_s3 : std_logic_vector(7 downto 0);
signal        sim_s4 : std_logic_vector(7 downto 0);
signal        sim_s5 : std_logic_vector(7 downto 0);
signal        sim_s6 : std_logic_vector(7 downto 0);
signal        sim_s7 : std_logic_vector(7 downto 0);
signal        sim_s8 : std_logic_vector(7 downto 0);
signal        sim_s9 : std_logic_vector(7 downto 0);
signal        sim_sA : std_logic_vector(7 downto 0);
signal        sim_sB : std_logic_vector(7 downto 0);
signal        sim_sC : std_logic_vector(7 downto 0);
signal        sim_sD : std_logic_vector(7 downto 0);
signal        sim_sE : std_logic_vector(7 downto 0);
signal        sim_sF : std_logic_vector(7 downto 0);
signal     sim_spm00 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm01 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm02 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm03 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm04 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm05 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm06 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm07 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm08 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm09 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm0A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm0B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm0C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm0D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm0E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm0F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm10 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm11 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm12 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm13 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm14 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm15 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm16 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm17 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm18 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm19 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm1A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm1B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm1C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm1D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm1E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm1F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm20 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm21 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm22 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm23 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm24 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm25 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm26 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm27 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm28 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm29 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm2A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm2B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm2C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm2D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm2E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm2F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm30 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm31 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm32 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm33 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm34 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm35 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm36 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm37 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm38 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm39 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm3A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm3B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm3C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm3D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm3E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm3F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm40 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm41 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm42 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm43 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm44 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm45 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm46 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm47 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm48 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm49 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm4A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm4B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm4C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm4D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm4E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm4F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm50 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm51 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm52 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm53 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm54 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm55 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm56 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm57 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm58 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm59 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm5A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm5B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm5C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm5D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm5E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm5F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm60 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm61 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm62 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm63 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm64 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm65 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm66 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm67 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm68 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm69 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm6A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm6B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm6C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm6D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm6E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm6F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm70 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm71 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm72 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm73 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm74 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm75 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm76 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm77 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm78 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm79 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm7A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm7B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm7C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm7D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm7E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm7F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm80 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm81 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm82 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm83 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm84 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm85 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm86 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm87 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm88 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm89 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm8A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm8B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm8C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm8D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm8E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm8F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm90 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm91 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm92 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm93 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm94 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm95 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm96 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm97 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm98 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm99 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm9A : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm9B : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm9C : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm9D : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm9E : std_logic_vector(7 downto 0) := X"00";
signal     sim_spm9F : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA0 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA1 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA2 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA3 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA4 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA5 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA6 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA7 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA8 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmA9 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmAA : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmAB : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmAC : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmAD : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmAE : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmAF : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB0 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB1 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB2 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB3 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB4 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB5 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB6 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB7 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB8 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmB9 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmBA : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmBB : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmBC : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmBD : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmBE : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmBF : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC0 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC1 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC2 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC3 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC4 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC5 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC6 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC7 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC8 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmC9 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmCA : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmCB : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmCC : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmCD : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmCE : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmCF : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD0 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD1 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD2 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD3 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD4 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD5 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD6 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD7 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD8 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmD9 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmDA : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmDB : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmDC : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmDD : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmDE : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmDF : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE0 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE1 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE2 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE3 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE4 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE5 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE6 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE7 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE8 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmE9 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmEA : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmEB : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmEC : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmED : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmEE : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmEF : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF0 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF1 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF2 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF3 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF4 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF5 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF6 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF7 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF8 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmF9 : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmFA : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmFB : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmFC : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmFD : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmFE : std_logic_vector(7 downto 0) := X"00";
signal     sim_spmFF : std_logic_vector(7 downto 0) := X"00";
--
--synthesis translate on
--
--**********************************************************************************
--
--
-------------------------------------------------------------------------------------------
--
-- WebTalk Attributes
--

attribute CORE_GENERATION_INFO : string;
attribute CORE_GENERATION_INFO of low_level_definition : ARCHITECTURE IS 
    "kcpsm6,kcpsm6_v1_2,{component_name=kcpsm6}";

--
-- Attributes to guide mapping of logic into Slices.
--

attribute hblknm : string; 
attribute hblknm of                reset_lut : label is "kcpsm6_control";
attribute hblknm of                 run_flop : label is "kcpsm6_control";
attribute hblknm of      internal_reset_flop : label is "kcpsm6_control";
attribute hblknm of              t_state_lut : label is "kcpsm6_control";
attribute hblknm of            t_state1_flop : label is "kcpsm6_control";
attribute hblknm of            t_state2_flop : label is "kcpsm6_control";
attribute hblknm of     active_interrupt_lut : label is "kcpsm6_control";
attribute hblknm of    active_interrupt_flop : label is "kcpsm6_control";
attribute hblknm of            sx_addr4_flop : label is "kcpsm6_control";
attribute hblknm of        arith_carry_xorcy : label is "kcpsm6_control";
attribute hblknm of         arith_carry_flop : label is "kcpsm6_control";

attribute hblknm of           zero_flag_flop : label is "kcpsm6_flags";
attribute hblknm of          carry_flag_flop : label is "kcpsm6_flags";
attribute hblknm of           carry_flag_lut : label is "kcpsm6_flags";
attribute hblknm of           lower_zero_lut : label is "kcpsm6_flags";
attribute hblknm of          middle_zero_lut : label is "kcpsm6_flags";
attribute hblknm of           upper_zero_lut : label is "kcpsm6_flags";
attribute hblknm of          init_zero_muxcy : label is "kcpsm6_flags";
attribute hblknm of         lower_zero_muxcy : label is "kcpsm6_flags";
attribute hblknm of        middle_zero_muxcy : label is "kcpsm6_flags";
attribute hblknm of         upper_zero_muxcy : label is "kcpsm6_flags";

attribute hblknm of      int_enable_type_lut : label is "kcpsm6_decode0";
attribute hblknm of            move_type_lut : label is "kcpsm6_decode0";
attribute hblknm of     pc_move_is_valid_lut : label is "kcpsm6_decode0";
attribute hblknm of     interrupt_enable_lut : label is "kcpsm6_decode0";
attribute hblknm of    interrupt_enable_flop : label is "kcpsm6_decode0";

attribute hblknm of          alu_decode1_lut : label is "kcpsm6_decode1";
attribute hblknm of        alu_mux_sel1_flop : label is "kcpsm6_decode1";
attribute hblknm of          shift_carry_lut : label is "kcpsm6_decode1";
attribute hblknm of         shift_carry_flop : label is "kcpsm6_decode1";
attribute hblknm of        use_zero_flag_lut : label is "kcpsm6_decode1";
attribute hblknm of       use_zero_flag_flop : label is "kcpsm6_decode1";
attribute hblknm of       interrupt_ack_flop : label is "kcpsm6_decode1";
attribute hblknm of    shadow_zero_flag_flop : label is "kcpsm6_decode1";

attribute hblknm of          alu_decode0_lut : label is "kcpsm6_decode2";
attribute hblknm of        alu_mux_sel0_flop : label is "kcpsm6_decode2";
attribute hblknm of          alu_decode2_lut : label is "kcpsm6_decode2";
attribute hblknm of         lower_parity_lut : label is "kcpsm6_decode2";
attribute hblknm of             parity_muxcy : label is "kcpsm6_decode2";
attribute hblknm of         upper_parity_lut : label is "kcpsm6_decode2";
attribute hblknm of             parity_xorcy : label is "kcpsm6_decode2";
attribute hblknm of          sync_sleep_flop : label is "kcpsm6_decode2";
attribute hblknm of      sync_interrupt_flop : label is "kcpsm6_decode2";

attribute hblknm of             push_pop_lut : label is "kcpsm6_stack1";	
attribute hblknm of         regbank_type_lut : label is "kcpsm6_stack1";	
attribute hblknm of                 bank_lut : label is "kcpsm6_stack1";	
attribute hblknm of                bank_flop : label is "kcpsm6_stack1";	

attribute hblknm of register_enable_type_lut : label is "kcpsm6_strobes";	
attribute hblknm of      register_enable_lut : label is "kcpsm6_strobes";	
attribute hblknm of         flag_enable_flop : label is "kcpsm6_strobes";	
attribute hblknm of     register_enable_flop : label is "kcpsm6_strobes";	
attribute hblknm of           spm_enable_lut : label is "kcpsm6_strobes";	
attribute hblknm of      k_write_strobe_flop : label is "kcpsm6_strobes";	
attribute hblknm of          spm_enable_flop : label is "kcpsm6_strobes";	
attribute hblknm of          read_strobe_lut : label is "kcpsm6_strobes";	
attribute hblknm of        write_strobe_flop : label is "kcpsm6_strobes";	
attribute hblknm of         read_strobe_flop : label is "kcpsm6_strobes";	

attribute hblknm of            stack_ram_low : label is "kcpsm6_stack_ram0";	
attribute hblknm of   shadow_carry_flag_flop : label is "kcpsm6_stack_ram0";	
attribute hblknm of          stack_zero_flop : label is "kcpsm6_stack_ram0";	
attribute hblknm of         shadow_bank_flop : label is "kcpsm6_stack_ram0";	
attribute hblknm of           stack_bit_flop : label is "kcpsm6_stack_ram0";	
attribute hblknm of           stack_ram_high : label is "kcpsm6_stack_ram1";	

attribute hblknm of          lower_reg_banks : label is "kcpsm6_reg0";	
attribute hblknm of          upper_reg_banks : label is "kcpsm6_reg1";	
attribute hblknm of             pc_mode1_lut : label is "kcpsm6_vector1";	
attribute hblknm of             pc_mode2_lut : label is "kcpsm6_vector1";	

--
-------------------------------------------------------------------------------------------
--	
-- Start of kcpsm6 circuit description
--
-- Summary of all primitives defined.
--
--     29 x LUT6             79 LUTs (plus 1 LUT will be required to form a GND signal)
--     50 x LUT6_2
--     48 x FD               82 flip-flops
--     20 x FDR       (Depending on the value of 'hwbuild' up)
--      0 x FDS       (to eight FDR will be replaced by FDS  )          
--     14 x FDRE
--     29 x MUXCY
--     27 x XORCY
--      4 x RAM32M    (16 LUTs)
--
--      2 x RAM64M   or  8 x RAM128X1S   or  8 x RAM256X1S
--       (8 LUTs)          (16 LUTs)           (32 LUTs)
--
-------------------------------------------------------------------------------------------
--	
begin

  --
  -------------------------------------------------------------------------------------------
  --
  -- Perform check of generic to report error as soon as possible.
  --
  -------------------------------------------------------------------------------------------
  --

  assert ((scratch_pad_memory_size = 64) 
       or (scratch_pad_memory_size = 128)
       or (scratch_pad_memory_size = 256))
  report "Invalid 'scratch_pad_memory_size'. Please set to 64, 128 or 256."
  severity FAILURE;

  --
  -------------------------------------------------------------------------------------------
  --
  -- State Machine and Control 
  --
  --
  --     1 x LUT6
  --     4 x LUT6_2
  --     9 x FD
  --
  -------------------------------------------------------------------------------------------
  --

  reset_lut: LUT6_2
  generic map (INIT => X"FFFFF55500000EEE")
  port map( I0 => run,
            I1 => internal_reset,
            I2 => stack_pointer_carry(4),
            I3 => t_state(2),
            I4 => reset,
            I5 => '1',
            O5 => run_value,
            O6 => internal_reset_value);

  run_flop: FD
  port map (  D => run_value,
              Q => run,
              C => clk);

  internal_reset_flop: FD
  port map (  D => internal_reset_value,
              Q => internal_reset,
              C => clk);

  sync_sleep_flop: FD
  port map (  D => sleep,
              Q => sync_sleep,
              C => clk);

  t_state_lut: LUT6_2
  generic map (INIT => X"0083000B00C4004C")
  port map( I0 => t_state(1),
            I1 => t_state(2),
            I2 => sync_sleep,
            I3 => internal_reset,
            I4 => special_bit,
            I5 => '1',
            O5 => t_state_value(1),
            O6 => t_state_value(2));

  t_state1_flop: FD
  port map (  D => t_state_value(1),
              Q => t_state(1),
              C => clk);

  t_state2_flop: FD
  port map (  D => t_state_value(2),
              Q => t_state(2),
              C => clk);


  int_enable_type_lut: LUT6_2
  generic map (INIT => X"0010000000000800")
  port map( I0 => instruction(13),
            I1 => instruction(14),
            I2 => instruction(15),
            I3 => instruction(16),
            I4 => instruction(17),
            I5 => '1',
            O5 => loadstar_type,
            O6 => int_enable_type);

  interrupt_enable_lut: LUT6
  generic map (INIT => X"000000000000CAAA")
  port map( I0 => interrupt_enable,
            I1 => instruction(0),
            I2 => int_enable_type,
            I3 => t_state(1),
            I4 => active_interrupt,
            I5 => internal_reset,
             O => interrupt_enable_value);                     

  interrupt_enable_flop: FD
  port map (  D => interrupt_enable_value,
              Q => interrupt_enable,
              C => clk);

  sync_interrupt_flop: FD
  port map (  D => interrupt,
              Q => sync_interrupt,
              C => clk);

  active_interrupt_lut: LUT6_2
  generic map (INIT => X"CC33FF0080808080")
  port map( I0 => interrupt_enable,
            I1 => t_state(2),
            I2 => sync_interrupt,
            I3 => bank,
            I4 => loadstar_type,
            I5 => '1',
            O5 => active_interrupt_value, 
            O6 => sx_addr4_value);

  active_interrupt_flop: FD
  port map (  D => active_interrupt_value,
              Q => active_interrupt,
              C => clk);

  interrupt_ack_flop: FD
  port map (  D => active_interrupt,
              Q => interrupt_ack,
              C => clk);


  --
  -------------------------------------------------------------------------------------------
  --
  -- Decoders 
  --
  --
  --     2 x LUT6
  --    10 x LUT6_2
  --     2 x FD
  --     6 x FDR
  --
  -------------------------------------------------------------------------------------------
  --

  --
  -- Decoding for Program Counter and Stack
  --

  pc_move_is_valid_lut: LUT6
  generic map (INIT => X"5A3CFFFF00000000")
  port map( I0 => carry_flag,
            I1 => zero_flag,
            I2 => instruction(14),
            I3 => instruction(15),
            I4 => instruction(16),
            I5 => instruction(17),
             O => pc_move_is_valid);

  move_type_lut: LUT6_2
  generic map (INIT => X"7777027700000200")
  port map( I0 => instruction(12),
            I1 => instruction(13),
            I2 => instruction(14),
            I3 => instruction(15),
            I4 => instruction(16),
            I5 => '1',
            O5 => returni_type,
            O6 => move_type);

  pc_mode1_lut: LUT6_2
  generic map (INIT => X"0000F000000023FF")
  port map( I0 => instruction(12),
            I1 => returni_type,
            I2 => move_type,
            I3 => pc_move_is_valid,
            I4 => active_interrupt,
            I5 => '1',
            O5 => pc_mode(0),
            O6 => pc_mode(1));

  pc_mode2_lut: LUT6
  generic map (INIT => X"FFFFFFFF00040000")
  port map( I0 => instruction(12),
            I1 => instruction(14),
            I2 => instruction(15),
            I3 => instruction(16),
            I4 => instruction(17),
            I5 => active_interrupt,
             O => pc_mode(2));

  push_pop_lut: LUT6_2
  generic map (INIT => X"FFFF100000002000")
  port map( I0 => instruction(12),
            I1 => instruction(13),
            I2 => move_type,
            I3 => pc_move_is_valid,
            I4 => active_interrupt,
            I5 => '1',
            O5 => pop_stack,
            O6 => push_stack);

  --
  -- Decoding for ALU
  --

  alu_decode0_lut: LUT6_2
  generic map (INIT => X"03CA000004200000")
  port map( I0 => instruction(13),
            I1 => instruction(14),
            I2 => instruction(15),
            I3 => instruction(16),
            I4 => '1',
            I5 => '1',
            O5 => alu_mux_sel_value(0),
            O6 => arith_logical_sel(0));

  alu_mux_sel0_flop: FD
  port map (  D => alu_mux_sel_value(0),
              Q => alu_mux_sel(0),
              C => clk);

  alu_decode1_lut: LUT6_2
  generic map (INIT => X"7708000000000F00")
  port map( I0 => carry_flag,
            I1 => instruction(13),
            I2 => instruction(14),
            I3 => instruction(15),
            I4 => instruction(16),
            I5 => '1',
            O5 => alu_mux_sel_value(1),
            O6 => arith_carry_in);                     

  alu_mux_sel1_flop: FD
  port map (  D => alu_mux_sel_value(1),
              Q => alu_mux_sel(1),
              C => clk);


  alu_decode2_lut: LUT6_2
  generic map (INIT => X"D000000002000000")
  port map( I0 => instruction(14),
            I1 => instruction(15),
            I2 => instruction(16),
            I3 => '1',
            I4 => '1',
            I5 => '1',
            O5 => arith_logical_sel(1),
            O6 => arith_logical_sel(2));

  --
  -- Decoding for strobes and enables
  --

  register_enable_type_lut: LUT6_2
  generic map (INIT => X"00013F3F0010F7CE")
  port map( I0 => instruction(13),
            I1 => instruction(14),
            I2 => instruction(15),
            I3 => instruction(16),
            I4 => instruction(17),
            I5 => '1',
            O5 => flag_enable_type,
            O6 => register_enable_type);

  register_enable_lut: LUT6_2
  generic map (INIT => X"C0CC0000A0AA0000")
  port map( I0 => flag_enable_type,
            I1 => register_enable_type,
            I2 => instruction(12),
            I3 => instruction(17),
            I4 => t_state(1),
            I5 => '1',
            O5 => flag_enable_value,
            O6 => register_enable_value);

  flag_enable_flop: FDR
  port map (  D => flag_enable_value,
              Q => flag_enable,
              R => active_interrupt,
              C => clk);

  register_enable_flop: FDR
  port map (  D => register_enable_value,
              Q => register_enable,
              R => active_interrupt,
              C => clk);

  spm_enable_lut: LUT6_2
  generic map (INIT => X"8000000020000000")
  port map( I0 => instruction(13),
            I1 => instruction(14),
            I2 => instruction(17),
            I3 => strobe_type,
            I4 => t_state(1),
            I5 => '1',
            O5 => k_write_strobe_value,
            O6 => spm_enable_value);

  k_write_strobe_flop: FDR
  port map (  D => k_write_strobe_value,
              Q => k_write_strobe,
              R => active_interrupt,
              C => clk);

  spm_enable_flop: FDR
  port map (  D => spm_enable_value,
              Q => spm_enable,
              R => active_interrupt,
              C => clk);

  read_strobe_lut: LUT6_2
  generic map (INIT => X"4000000001000000")
  port map( I0 => instruction(13),
            I1 => instruction(14),
            I2 => instruction(17),
            I3 => strobe_type,
            I4 => t_state(1),
            I5 => '1',
            O5 => read_strobe_value,
            O6 => write_strobe_value);

  write_strobe_flop: FDR
  port map (  D => write_strobe_value,
              Q => write_strobe,
              R => active_interrupt,
              C => clk);

  read_strobe_flop: FDR
  port map (  D => read_strobe_value,
              Q => read_strobe,
              R => active_interrupt,
              C => clk);

  --
  -------------------------------------------------------------------------------------------
  --
  -- Register bank control
  --
  --
  --     2 x LUT6
  --     1 x FDR
  --     1 x FD
  --
  -------------------------------------------------------------------------------------------
  --
  regbank_type_lut: LUT6
  generic map (INIT => X"0080020000000000")
  port map( I0 => instruction(12),
            I1 => instruction(13),
            I2 => instruction(14),
            I3 => instruction(15),
            I4 => instruction(16),
            I5 => instruction(17),
             O => regbank_type);

  bank_lut: LUT6
  generic map (INIT => X"ACACFF00FF00FF00")
  port map( I0 => instruction(0),
            I1 => shadow_bank,
            I2 => instruction(16),
            I3 => bank,
            I4 => regbank_type,
            I5 => t_state(1),
             O => bank_value);                     

  bank_flop: FDR
  port map (  D => bank_value,
              Q => bank,
              R => internal_reset,
              C => clk);

  sx_addr4_flop: FD
  port map (  D => sx_addr4_value,
              Q => sx_addr(4),
              C => clk);

  sx_addr(3 downto 0) <= instruction(11 downto 8);
  sy_addr <= bank & instruction(7 downto 4);

  --
  -------------------------------------------------------------------------------------------
  --
  -- Flags
  --
  --
  --     3 x LUT6
  --     5 x LUT6_2
  --     3 x FD
  --     2 x FDRE
  --     2 x XORCY
  --     5 x MUXCY
  --
  -------------------------------------------------------------------------------------------
  --

  arith_carry_xorcy: XORCY
  port map( LI => '0',
            CI => carry_arith_logical(7),
             O => arith_carry_value);

  arith_carry_flop: FD
  port map (  D => arith_carry_value,
              Q => arith_carry,
              C => clk);

  lower_parity_lut: LUT6_2
  generic map (INIT => X"0000000087780000")
  port map( I0 => instruction(13),
            I1 => carry_flag,
            I2 => arith_logical_result(0),
            I3 => arith_logical_result(1),
            I4 => '1',
            I5 => '1',
            O5 => lower_parity,
            O6 => lower_parity_sel);  
                   
  parity_muxcy: MUXCY
  port map( DI => lower_parity,
            CI => '0',                     
             S => lower_parity_sel,
             O => carry_lower_parity);

  upper_parity_lut: LUT6
  generic map (INIT => X"6996966996696996")
  port map( I0 => arith_logical_result(2),
            I1 => arith_logical_result(3),
            I2 => arith_logical_result(4),
            I3 => arith_logical_result(5),
            I4 => arith_logical_result(6),
            I5 => arith_logical_result(7),
             O => upper_parity);                     

  parity_xorcy: XORCY
  port map( LI => upper_parity,
            CI => carry_lower_parity,
             O => parity);

  shift_carry_lut: LUT6
  generic map (INIT => X"FFFFAACCF0F0F0F0")
  port map( I0 => sx(0),
            I1 => sx(7),
            I2 => shadow_carry_flag,
            I3 => instruction(3),
            I4 => instruction(7),
            I5 => instruction(16),
             O => shift_carry_value);                     

  shift_carry_flop: FD
  port map (  D => shift_carry_value,
              Q => shift_carry,
              C => clk);

  carry_flag_lut: LUT6_2
  generic map (INIT => X"3333AACCF0AA0000")
  port map( I0 => shift_carry,
            I1 => arith_carry,
            I2 => parity,
            I3 => instruction(14),
            I4 => instruction(15),
            I5 => instruction(16),
            O5 => drive_carry_in_zero,
            O6 => carry_flag_value);  

  carry_flag_flop: FDRE
  port map (  D => carry_flag_value,
              Q => carry_flag,
             CE => flag_enable,
              R => internal_reset,
              C => clk);

  init_zero_muxcy: MUXCY
  port map( DI => drive_carry_in_zero,
            CI => '0',
             S => carry_flag_value,
             O => carry_in_zero);

  use_zero_flag_lut: LUT6_2
  generic map (INIT => X"A280000000F000F0")
  port map( I0 => instruction(13),
            I1 => instruction(14),
            I2 => instruction(15),
            I3 => instruction(16),
            I4 => '1',
            I5 => '1',
            O5 => strobe_type,
            O6 => use_zero_flag_value);                     

  use_zero_flag_flop: FD
  port map (  D => use_zero_flag_value,
              Q => use_zero_flag,
              C => clk);

  lower_zero_lut: LUT6_2
  generic map (INIT => X"0000000000000001")
  port map( I0 => alu_result(0),
            I1 => alu_result(1),
            I2 => alu_result(2),
            I3 => alu_result(3),
            I4 => alu_result(4),
            I5 => '1',
            O5 => lower_zero,
            O6 => lower_zero_sel);                     

  lower_zero_muxcy: MUXCY
  port map( DI => lower_zero,
            CI => carry_in_zero,
             S => lower_zero_sel,
             O => carry_lower_zero);

  middle_zero_lut: LUT6_2
  generic map (INIT => X"0000000D00000000")
  port map( I0 => use_zero_flag,
            I1 => zero_flag,
            I2 => alu_result(5),
            I3 => alu_result(6),
            I4 => alu_result(7),
            I5 => '1',
            O5 => middle_zero,
            O6 => middle_zero_sel);                     

  middle_zero_muxcy: MUXCY
  port map( DI => middle_zero,
            CI => carry_lower_zero,                     
             S => middle_zero_sel,
             O => carry_middle_zero);

  upper_zero_lut: LUT6
  generic map (INIT => X"FBFF000000000000")
  port map( I0 => instruction(14),
            I1 => instruction(15),
            I2 => instruction(16),
            I3 => '1',
            I4 => '1',
            I5 => '1',
             O => upper_zero_sel);                     

  upper_zero_muxcy: MUXCY
  port map( DI => shadow_zero_flag,
            CI => carry_middle_zero,                    
             S => upper_zero_sel,
             O => zero_flag_value);

  zero_flag_flop: FDRE
  port map (  D => zero_flag_value,
              Q => zero_flag,
             CE => flag_enable,
              R => internal_reset,
              C => clk);

  --
  -------------------------------------------------------------------------------------------
  --
  -- 12-bit Program Address Generation 
  --
  -------------------------------------------------------------------------------------------
  --

  --
  -- Prepare 12-bit vector from the sX and sY register outputs.
  --

  register_vector <= sx(3 downto 0) & sy;


  address_loop: for i in 0 to 11 generate
    attribute hblknm : string;                      
    attribute hblknm of            pc_flop : label is "kcpsm6_pc" & integer'image(i/4);	
    attribute hblknm of return_vector_flop : label is "kcpsm6_stack_ram" & integer'image((i+4)/8);	  

  begin

    --
    -------------------------------------------------------------------------------------------
    --
    -- Selection of vector to load program counter
    --
    -- instruction(12)
    --              0  Constant aaa from instruction(11:0)
    --              1  Return vector from stack 
    --
    -- 'aaa' is used during 'JUMP aaa', 'JUMP c, aaa', 'CALL aaa' and 'CALL c, aaa'.
    -- Return vector is used during 'RETURN', 'RETURN c', 'RETURN&LOAD' and 'RETURNI'.
    --
    --     6 x LUT6_2
    --     12 x FD
    --
    -------------------------------------------------------------------------------------------
    --

    --
    -- Pipeline output of the stack memory
    --

    return_vector_flop: FD
    port map (  D => stack_memory(i),
                Q => return_vector(i),
                C => clk);

    --
    -- Multiplex instruction constant address and output from stack.
    -- 2 bits per LUT so only generate when 'i' is even.
    --

    output_data: if (i rem 2)=0 generate
      attribute hblknm : string;                      
      attribute hblknm of pc_vector_mux_lut : label is "kcpsm6_vector" & integer'image(i/8);	
    begin

      pc_vector_mux_lut: LUT6_2
      generic map (INIT => X"FF00F0F0CCCCAAAA")
      port map( I0 => instruction(i),
                I1 => return_vector(i),
                I2 => instruction(i+1),
                I3 => return_vector(i+1),
                I4 => instruction(12),
                I5 => '1',
                O5 => pc_vector(i),
                O6 => pc_vector(i+1));

    end generate output_data;

    --
    -------------------------------------------------------------------------------------------
    --
    -- Program Counter
    --
    -- Reset by internal_reset has highest priority.
    -- Enabled by t_state(1) has second priority.
    --
    -- The function performed is defined by pc_mode(2:0).
    --
    -- pc_mode (2) (1) (0) 
    --          0   0   1  pc+1 for normal program flow.
    --          1   0   0  Forces interrupt vector value (+0) during active interrupt.
    --                     The vector is defined by a generic with default value FF0 hex.
    --          1   1   0  register_vector (+0) for 'JUMP (sX, sY)' and 'CALL (sX, sY)'.
    --          0   1   0  pc_vector (+0) for 'JUMP/CALL aaa' and 'RETURNI'.
    --          0   1   1  pc_vector+1 for 'RETURN'.
    --
    -- Note that pc_mode(0) is High during operations that require an increment to occur.
    -- The LUT6 associated with the LSB must invert pc or pc_vector in these cases and 
    -- pc_mode(0) also has to be connected to the start of the carry chain.
    --
    -- 3 Slices 
    --     12 x LUT6
    --     11 x MUXCY
    --     12 x XORCY
    --     12 x FDRE
    --
    -------------------------------------------------------------------------------------------
    --


    pc_flop: FDRE
    port map (  D => pc_value(i),
                Q => pc(i),
                R => internal_reset,
               CE => t_state(1),
                C => clk);


    lsb_pc: if i=0 generate
      attribute hblknm : string;                      
      attribute hblknm of pc_xorcy : label is "kcpsm6_pc" & integer'image(i/4);	
      attribute hblknm of pc_muxcy : label is "kcpsm6_pc" & integer'image(i/4);	
    begin

      --
      -- Logic of LSB must invert selected value when pc_mode(0) is High.
      -- The interrupt vector is defined by a generic.
      --

      low_int_vector: if interrupt_vector(i)='0' generate
        attribute hblknm : string;                      
        attribute hblknm of pc_lut : label is "kcpsm6_pc" & integer'image(i/4);	
      begin

        pc_lut: LUT6
        generic map (INIT => X"00AA000033CC0F00")
        port map( I0 => register_vector(i),
                  I1 => pc_vector(i),
                  I2 => pc(i),
                  I3 => pc_mode(0),
                  I4 => pc_mode(1),
                  I5 => pc_mode(2), 
                   O => half_pc(i));

      end generate low_int_vector;

      high_int_vector: if interrupt_vector(i)='1' generate
        attribute hblknm : string;                      
        attribute hblknm of pc_lut : label is "kcpsm6_pc" & integer'image(i/4);	
      begin
    
        pc_lut: LUT6
        generic map (INIT => X"00AA00FF33CC0F00")
        port map( I0 => register_vector(i),
                  I1 => pc_vector(i),
                  I2 => pc(i),
                  I3 => pc_mode(0),
                  I4 => pc_mode(1),
                  I5 => pc_mode(2), 
                   O => half_pc(i));

      end generate high_int_vector;

      --
      -- pc_mode(0) connected to first MUXCY and carry input is '0'
      --

      pc_xorcy: XORCY
      port map( LI => half_pc(i),
                CI => '0',
                 O => pc_value(i));

      pc_muxcy: MUXCY
      port map( DI => pc_mode(0),
                CI => '0',
                 S => half_pc(i),
                 O => carry_pc(i));

    end generate lsb_pc;

    upper_pc: if i>0 generate
      attribute hblknm : string;                      
      attribute hblknm of pc_xorcy : label is "kcpsm6_pc" & integer'image(i/4);	
    begin

      --
      -- Logic of upper section selects required value.
      -- The interrupt vector is defined by a generic.
      --

      low_int_vector: if interrupt_vector(i)='0' generate
        attribute hblknm : string;                      
        attribute hblknm of pc_lut : label is "kcpsm6_pc" & integer'image(i/4);	
      begin
    
        pc_lut: LUT6
        generic map (INIT => X"00AA0000CCCCF000")
        port map( I0 => register_vector(i),
                  I1 => pc_vector(i),
                  I2 => pc(i),
                  I3 => pc_mode(0),
                  I4 => pc_mode(1),
                  I5 => pc_mode(2), 
                   O => half_pc(i));

      end generate low_int_vector;

      high_int_vector: if interrupt_vector(i)='1' generate
        attribute hblknm : string;                      
        attribute hblknm of pc_lut : label is "kcpsm6_pc" & integer'image(i/4);	
      begin
    
        pc_lut: LUT6
        generic map (INIT => X"00AA00FFCCCCF000")
        port map( I0 => register_vector(i),
                  I1 => pc_vector(i),
                  I2 => pc(i),
                  I3 => pc_mode(0),
                  I4 => pc_mode(1),
                  I5 => pc_mode(2), 
                   O => half_pc(i));

      end generate high_int_vector;

      --
      -- Carry chain implementing remainder of increment function
      --
      pc_xorcy: XORCY
      port map( LI => half_pc(i),
                CI => carry_pc(i-1),
                 O => pc_value(i));


      --
      -- No MUXCY required at the top of the chain
      --
      mid_pc: if i<11 generate
        attribute hblknm : string;                      
        attribute hblknm of pc_muxcy : label is "kcpsm6_pc" & integer'image(i/4);	
      begin

        pc_muxcy: MUXCY
        port map( DI => '0',
                  CI => carry_pc(i-1),
                   S => half_pc(i),
                   O => carry_pc(i));

      end generate mid_pc;

    end generate upper_pc;


    --
    -------------------------------------------------------------------------------------------
    --

  end generate address_loop;



  --
  -------------------------------------------------------------------------------------------
  --
  -- Stack 
  --  Preserves upto 31 nested values of the Program Counter during CALL and RETURN.
  --  Also preserves flags and bank selection during interrupt.
  --
  --     2 x RAM32M 
  --     4 x FD
  --     5 x FDR
  --     1 x LUT6
  --     4 x LUT6_2
  --     5 x XORCY
  --     5 x MUXCY
  --
  -------------------------------------------------------------------------------------------
  --

  shadow_carry_flag_flop: FD
  port map (  D => stack_carry_flag,
              Q => shadow_carry_flag,
              C => clk);

  stack_zero_flop: FD
  port map (  D => stack_zero_flag,
              Q => shadow_zero_value,
              C => clk);

  shadow_zero_flag_flop: FD
  port map (  D => shadow_zero_value,
              Q => shadow_zero_flag,
              C => clk);

  shadow_bank_flop: FD
  port map (  D => stack_bank,
              Q => shadow_bank,
              C => clk);

  stack_bit_flop: FD
  port map (  D => stack_bit,
              Q => special_bit,
              C => clk);

  stack_ram_low : RAM32M
  generic map (INIT_A => X"0000000000000000", 
               INIT_B => X"0000000000000000", 
               INIT_C => X"0000000000000000", 
               INIT_D => X"0000000000000000") 
  port map ( DOA(0) => stack_carry_flag, 
             DOA(1) => stack_zero_flag,
             DOB(0) => stack_bank,
             DOB(1) => stack_bit,
                DOC => stack_memory(1 downto 0), 
                DOD => stack_memory(3 downto 2),
              ADDRA => stack_pointer(4 downto 0), 
              ADDRB => stack_pointer(4 downto 0), 
              ADDRC => stack_pointer(4 downto 0), 
              ADDRD => stack_pointer(4 downto 0),
             DIA(0) => carry_flag, 
             DIA(1) => zero_flag,
             DIB(0) => bank,
             DIB(1) => run, 
                DIC => pc(1 downto 0),
                DID => pc(3 downto 2),
                 WE => t_state(1), 
               WCLK => clk );

  stack_ram_high : RAM32M
  generic map (INIT_A => X"0000000000000000", 
               INIT_B => X"0000000000000000", 
               INIT_C => X"0000000000000000", 
               INIT_D => X"0000000000000000") 
  port map (    DOA => stack_memory(5 downto 4), 
                DOB => stack_memory(7 downto 6),
                DOC => stack_memory(9 downto 8),
                DOD => stack_memory(11 downto 10),
              ADDRA => stack_pointer(4 downto 0), 
              ADDRB => stack_pointer(4 downto 0), 
              ADDRC => stack_pointer(4 downto 0), 
              ADDRD => stack_pointer(4 downto 0),
                DIA => pc(5 downto 4),
                DIB => pc(7 downto 6),
                DIC => pc(9 downto 8),
                DID => pc(11 downto 10),
                 WE => t_state(1),  
               WCLK => clk );


  stack_loop: for i in 0 to 4 generate
  begin



    lsb_stack: if i=0 generate
    attribute hblknm : string;                      
    attribute hblknm of pointer_flop      : label is "kcpsm6_stack" & integer'image(i/4);	
    attribute hblknm of stack_pointer_lut : label is "kcpsm6_stack" & integer'image(i/4);
    attribute hblknm of stack_xorcy       : label is "kcpsm6_stack" & integer'image(i/4);
    attribute hblknm of stack_muxcy       : label is "kcpsm6_stack" & integer'image(i/4);
    begin

      pointer_flop: FDR
      port map (  D => stack_pointer_value(i),
                  Q => stack_pointer(i),
                  R => internal_reset,
                  C => clk);

      stack_pointer_lut: LUT6_2
      generic map (INIT => X"001529AAAAAAAAAA")
      port map( I0 => stack_pointer(i),
                I1 => pop_stack,
                I2 => push_stack,
                I3 => t_state(1),
                I4 => t_state(2),
                I5 => '1', 
                O5 => feed_pointer_value(i),
                O6 => half_pointer_value(i));

      stack_xorcy: XORCY
      port map( LI => half_pointer_value(i),
                CI => '0',
                 O => stack_pointer_value(i));

      stack_muxcy: MUXCY
      port map( DI => feed_pointer_value(i),
                CI => '0',
                 S => half_pointer_value(i),
                 O => stack_pointer_carry(i));

    end generate lsb_stack;

    upper_stack: if i>0 generate
    attribute hblknm : string;                      
    attribute hblknm of pointer_flop      : label is "kcpsm6_stack" & integer'image(i/4);	
    attribute hblknm of stack_pointer_lut : label is "kcpsm6_stack" & integer'image(i/4);
    attribute hblknm of stack_xorcy       : label is "kcpsm6_stack" & integer'image(i/4);
    attribute hblknm of stack_muxcy       : label is "kcpsm6_stack" & integer'image(i/4);
    begin

      pointer_flop: FDR
      port map (  D => stack_pointer_value(i),
                  Q => stack_pointer(i),
                  R => internal_reset,
                  C => clk);

      stack_pointer_lut: LUT6_2
      generic map (INIT => X"002A252AAAAAAAAA")
      port map( I0 => stack_pointer(i),
                I1 => pop_stack,
                I2 => push_stack,
                I3 => t_state(1),
                I4 => t_state(2),
                I5 => '1', 
                O5 => feed_pointer_value(i),
                O6 => half_pointer_value(i));

      stack_xorcy: XORCY
      port map( LI => half_pointer_value(i),
                CI => stack_pointer_carry(i-1),
                 O => stack_pointer_value(i));

      stack_muxcy: MUXCY
      port map( DI => feed_pointer_value(i),
                CI => stack_pointer_carry(i-1),
                 S => half_pointer_value(i),
                 O => stack_pointer_carry(i));

    end generate upper_stack;

  end generate stack_loop;


  --
  -------------------------------------------------------------------------------------------
  --
  -- 8-bit Data Path 
  --
  -------------------------------------------------------------------------------------------
  --

  data_path_loop: for i in 0 to 7 generate
    attribute hblknm : string;                      
    attribute hblknm of  arith_logical_lut : label is "kcpsm6_add" & integer'image(i/4);	
    attribute hblknm of arith_logical_flop : label is "kcpsm6_add" & integer'image(i/4);	
    attribute hblknm of        alu_mux_lut : label is "kcpsm6_alu" & integer'image(i/4);	
  begin

    --
    -------------------------------------------------------------------------------------------
    --
    -- Selection of second operand to ALU and port_id
    --
    -- instruction(12)
    --           0  Register sY
    --           1  Constant kk 
    --
    --     4 x LUT6_2
    --
    -------------------------------------------------------------------------------------------
    --
    --
    -- 2 bits per LUT so only generate when 'i' is even
    --

    output_data: if (i rem 2)=0 generate
      attribute hblknm : string;                      
      attribute hblknm of sy_kk_mux_lut : label is "kcpsm6_port_id";	
    begin

      sy_kk_mux_lut: LUT6_2
      generic map (INIT => X"FF00F0F0CCCCAAAA")
      port map( I0 => sy(i),
                I1 => instruction(i),
                I2 => sy(i+1),
                I3 => instruction(i+1),
                I4 => instruction(12),
                I5 => '1',
                O5 => sy_or_kk(i),
                O6 => sy_or_kk(i+1));

    end generate output_data;

    --
    -------------------------------------------------------------------------------------------
    --
    -- Selection of out_port value
    --
    -- instruction(13)
    --              0  Register sX
    --              1  Constant kk from instruction(11:4)
    --
    --     4 x LUT6_2
    --
    -------------------------------------------------------------------------------------------
    --
    --
    -- 2 bits per LUT so only generate when 'i' is even
    --

    second_operand: if (i rem 2)=0 generate
      attribute hblknm : string;                      
      attribute hblknm of out_port_lut : label is "kcpsm6_out_port";	
    begin

      out_port_lut: LUT6_2
      generic map (INIT => X"FF00F0F0CCCCAAAA")
      port map( I0 => sx(i),
                I1 => instruction(i+4),
                I2 => sx(i+1),
                I3 => instruction(i+5),
                I4 => instruction(13),
                I5 => '1',
                O5 => out_port(i),
                O6 => out_port(i+1));

    end generate second_operand;

    --
    -------------------------------------------------------------------------------------------
    --
    -- Arithmetic and Logical operations
    --
    -- Definition of....
    --    ADD and SUB also used for ADDCY, SUBCY, COMPARE and COMPARECY.
    --    LOAD, AND, OR and XOR also used for LOAD*, RETURN&LOAD, TEST and TESTCY.
    --
    -- arith_logical_sel (2) (1) (0)
    --                    0   0   0  - LOAD
    --                    0   0   1  - AND
    --                    0   1   0  - OR
    --                    0   1   1  - XOR
    --                    1   X   0  - SUB
    --                    1   X   1  - ADD
    --
    -- Includes pipeline stage.
    --
    -- 2 Slices
    --     8 x LUT6_2
    --     8 x MUXCY
    --     8 x XORCY
    --     8 x FD
    --
    -------------------------------------------------------------------------------------------
    --

    arith_logical_lut: LUT6_2
    generic map (INIT => X"69696E8ACCCC0000")
    port map( I0 => sy_or_kk(i),
              I1 => sx(i),
              I2 => arith_logical_sel(0),
              I3 => arith_logical_sel(1),
              I4 => arith_logical_sel(2),
              I5 => '1',
              O5 => logical_carry_mask(i),
              O6 => half_arith_logical(i));

    arith_logical_flop: FD
    port map ( D => arith_logical_value(i),
               Q => arith_logical_result(i),
               C => clk);

    lsb_arith_logical: if i=0 generate
      attribute hblknm : string;                      
      attribute hblknm of arith_logical_muxcy : label is "kcpsm6_add" & integer'image(i/4);	
      attribute hblknm of arith_logical_xorcy : label is "kcpsm6_add" & integer'image(i/4);	
    begin
      --
      -- Carry input to first MUXCY and XORCY
      --
      arith_logical_muxcy: MUXCY
      port map( DI => logical_carry_mask(i),
                CI => arith_carry_in,
                 S => half_arith_logical(i),
                 O => carry_arith_logical(i));

      arith_logical_xorcy: XORCY
      port map( LI => half_arith_logical(i),
                CI => arith_carry_in,
                 O => arith_logical_value(i));

    end generate lsb_arith_logical;

    upper_arith_logical: if i>0 generate
      attribute hblknm : string;                      
      attribute hblknm of arith_logical_muxcy : label is "kcpsm6_add" & integer'image(i/4);	
      attribute hblknm of arith_logical_xorcy : label is "kcpsm6_add" & integer'image(i/4);	
    begin
      --
      -- Main carry chain  
      --
      arith_logical_muxcy: MUXCY
      port map( DI => logical_carry_mask(i),
                CI => carry_arith_logical(i-1),
                 S => half_arith_logical(i),
                 O => carry_arith_logical(i));

      arith_logical_xorcy: XORCY
      port map( LI => half_arith_logical(i),
                CI => carry_arith_logical(i-1),
                 O => arith_logical_value(i));

    end generate upper_arith_logical;


    --
    -------------------------------------------------------------------------------------------
    --
    -- Shift and Rotate operations
    --
    -- Definition of SL0, SL1, SLX, SLA, RL, SR0, SR1, SRX, SRA, and RR 
    --
    -- instruction (3) (2) (1) (0)
    --              0   1   1   0  - SL0
    --              0   1   1   1  - SL1
    --              0   1   0   0  - SLX         
    --              0   0   0   0  - SLA
    --              0   0   1   0  - RL
    --              1   1   1   0  - SR0
    --              1   1   1   1  - SR1
    --              1   0   1   0  - SRX
    --              1   0   0   0  - SRA
    --              1   1   0   0  - RR
    --
    -- instruction(3) 
    --             0 - Left
    --             1 - Right
    --
    -- instruction (2) (1)  Bit shifted in 
    --              0   0   Carry_flag
    --              0   1   sX(7)
    --              1   0   sX(0)
    --              1   1   instruction(0)
    --
    -- Includes pipeline stage.
    --
    --     4 x LUT6_2
    --     1 x LUT6
    --     8 x FD
    --
    -------------------------------------------------------------------------------------------
    --

    low_hwbuild: if hwbuild(i)='0' generate
      attribute hblknm : string;                      
      attribute hblknm of shift_rotate_flop : label is "kcpsm6_sandr";	
    begin
      --
      -- Reset Flip-flop to form '0' for this bit of HWBUILD 
      --
      shift_rotate_flop: FDR
      port map ( D => shift_rotate_value(i),
                 Q => shift_rotate_result(i),
                 R => instruction(7),
                 C => clk);

    end generate low_hwbuild;

    high_hwbuild: if hwbuild(i)='1' generate
      attribute hblknm : string;                      
      attribute hblknm of shift_rotate_flop : label is "kcpsm6_sandr";	
    begin
      --
      -- Set Flip-flop to form '1' for this bit of HWBUILD 
      --
      shift_rotate_flop: FDS
      port map ( D => shift_rotate_value(i),
                 Q => shift_rotate_result(i),
                 S => instruction(7),
                 C => clk);

    end generate high_hwbuild;


    lsb_shift_rotate: if i=0 generate
      attribute hblknm : string;                      
      attribute hblknm of shift_rotate_lut : label is "kcpsm6_sandr";
      attribute hblknm of    shift_bit_lut : label is "kcpsm6_decode1";
    begin
      --
      -- Select bit to be shifted or rotated into result
      --
      shift_bit_lut: LUT6
      generic map (INIT => X"BFBC8F8CB3B08380")
      port map( I0 => instruction(0),
                I1 => instruction(1),
                I2 => instruction(2),
                I3 => carry_flag,
                I4 => sx(0),
                I5 => sx(7),
                 O => shift_in_bit);

      --
      -- Define lower bits of result
      --
      shift_rotate_lut: LUT6_2
      generic map (INIT => X"FF00F0F0CCCCAAAA")
      port map( I0 => shift_in_bit,
                I1 => sx(i+1),
                I2 => sx(i),
                I3 => sx(i+2),
                I4 => instruction(3),
                I5 => '1',
                O5 => shift_rotate_value(i),
                O6 => shift_rotate_value(i+1));

    end generate lsb_shift_rotate;


    mid_shift_rotate: if i=2 or i=4 generate
      attribute hblknm : string;                      
      attribute hblknm of shift_rotate_lut : label is "kcpsm6_sandr";
    begin
      --
      -- Define middle bits of result
      --
      shift_rotate_lut: LUT6_2
      generic map (INIT => X"FF00F0F0CCCCAAAA")
      port map( I0 => sx(i-1),
                I1 => sx(i+1),
                I2 => sx(i),
                I3 => sx(i+2),
                I4 => instruction(3),
                I5 => '1',
                O5 => shift_rotate_value(i),
                O6 => shift_rotate_value(i+1));

    end generate mid_shift_rotate;

    msb_shift_rotate: if i=6 generate
      attribute hblknm : string;                      
      attribute hblknm of shift_rotate_lut : label is "kcpsm6_sandr";
    begin
      --
      -- Define upper bits of result
      --
      shift_rotate_lut: LUT6_2
      generic map (INIT => X"FF00F0F0CCCCAAAA")
      port map( I0 => sx(i-1),
                I1 => sx(i+1),
                I2 => sx(i),
                I3 => shift_in_bit,
                I4 => instruction(3),
                I5 => '1',
                O5 => shift_rotate_value(i),
                O6 => shift_rotate_value(i+1));

    end generate msb_shift_rotate;

    --
    -------------------------------------------------------------------------------------------
    --
    -- Multiplex outputs from ALU functions, scratch pad memory and input port.
    --
    -- alu_mux_sel (1) (0)  
    --              0   0  Arithmetic and Logical Instructions
    --              0   1  Shift and Rotate Instructions
    --              1   0  Input Port
    --              1   1  Scratch Pad Memory
    --
    --     8 x LUT6
    --
    -------------------------------------------------------------------------------------------
    --

    alu_mux_lut: LUT6
    generic map (INIT => X"FF00F0F0CCCCAAAA")
    port map( I0 => arith_logical_result(i),
              I1 => shift_rotate_result(i),
              I2 => in_port(i),
              I3 => spm_data(i),
              I4 => alu_mux_sel(0),
              I5 => alu_mux_sel(1),
               O => alu_result(i));

    --
    -------------------------------------------------------------------------------------------
    --
    -- Scratchpad Memory with output register.
    --
    -- The size of the scratch pad memory is defined by the 'scratch_pad_memory_size' generic.
    -- The default size is 64 bytes the same as KCPSM3 but this can be increased to 128 or 256 
    -- bytes at an additional cost of 2 and 6 Slices.
    --
    --
    -- 8 x RAM256X1S (256 bytes).
    -- 8 x RAM128X1S (128 bytes).
    -- 2 x RAM64M    (64 bytes).
    --
    -- 8 x FD.
    --
    -------------------------------------------------------------------------------------------
    --


    small_spm: if scratch_pad_memory_size = 64 generate
      attribute hblknm : string;                      
      attribute hblknm of spm_flop : label is "kcpsm6_spm" & integer'image(i/4);	
    begin

      spm_flop: FD
      port map ( D => spm_ram_data(i),
                 Q => spm_data(i),
                 C => clk);

      small_spm_ram: if (i=0 or i=4) generate
        attribute hblknm of spm_ram  : label is "kcpsm6_spm" & integer'image(i/4);	
      begin

        spm_ram: RAM64M
        generic map ( INIT_A => X"0000000000000000",
                      INIT_B => X"0000000000000000",
                      INIT_C => X"0000000000000000",
                      INIT_D => X"0000000000000000") 
        port map (   DOA => spm_ram_data(i),
                     DOB => spm_ram_data(i+1),
                     DOC => spm_ram_data(i+2),
                     DOD => spm_ram_data(i+3),
                   ADDRA => sy_or_kk(5 downto 0),
                   ADDRB => sy_or_kk(5 downto 0),
                   ADDRC => sy_or_kk(5 downto 0),
                   ADDRD => sy_or_kk(5 downto 0),
                     DIA => sx(i),
                     DIB => sx(i+1),
                     DIC => sx(i+2),
                     DID => sx(i+3),
                      WE => spm_enable,
                    WCLK => clk );

      end generate small_spm_ram;

    end generate small_spm;


    medium_spm: if scratch_pad_memory_size = 128 generate
      attribute hblknm : string;                      
      attribute hblknm of spm_ram  : label is "kcpsm6_spm" & integer'image(i/2);	
      attribute hblknm of spm_flop : label is "kcpsm6_spm" & integer'image(i/2);	
    begin

      spm_ram: RAM128X1S
      generic map(INIT => X"00000000000000000000000000000000")
      port map (       D => sx(i),
                      WE => spm_enable,
                    WCLK => clk,
                      A0 => sy_or_kk(0),
                      A1 => sy_or_kk(1),
                      A2 => sy_or_kk(2),
                      A3 => sy_or_kk(3),
                      A4 => sy_or_kk(4),
                      A5 => sy_or_kk(5),
                      A6 => sy_or_kk(6),
                       O => spm_ram_data(i));

      spm_flop: FD
      port map ( D => spm_ram_data(i),
                 Q => spm_data(i),
                 C => clk);

    end generate medium_spm;


    large_spm: if scratch_pad_memory_size = 256 generate
      attribute hblknm : string;                      
      attribute hblknm of spm_ram  : label is "kcpsm6_spm" & integer'image(i);	
      attribute hblknm of spm_flop : label is "kcpsm6_spm" & integer'image(i);	
    begin

      spm_ram: RAM256X1S
      generic map(INIT => X"0000000000000000000000000000000000000000000000000000000000000000")
      port map (       D => sx(i),
                      WE => spm_enable,
                    WCLK => clk,
                       A => sy_or_kk,
                       O => spm_ram_data(i));

      spm_flop: FD
      port map ( D => spm_ram_data(i),
                 Q => spm_data(i),
                 C => clk);

    end generate large_spm;

    --
    -------------------------------------------------------------------------------------------
    --

  end generate data_path_loop;




  --
  -------------------------------------------------------------------------------------------
  --
  -- Two Banks of 16 General Purpose Registers.
  --
  -- sx_addr - Address for sX is formed by bank select and instruction[11:8]
  -- sy_addr - Address for sY is formed by bank select and instruction[7:4]
  --
  -- 2 Slices
  --     2 x RAM32M
  --
  -------------------------------------------------------------------------------------------
  --

  lower_reg_banks : RAM32M
  generic map (INIT_A => X"0000000000000000", 
               INIT_B => X"0000000000000000", 
               INIT_C => X"0000000000000000", 
               INIT_D => X"0000000000000000") 
  port map (    DOA => sy(1 downto 0), 
                DOB => sx(1 downto 0),
                DOC => sy(3 downto 2),
                DOD => sx(3 downto 2),
              ADDRA => sy_addr, 
              ADDRB => sx_addr, 
              ADDRC => sy_addr, 
              ADDRD => sx_addr, 
                DIA => alu_result(1 downto 0),
                DIB => alu_result(1 downto 0),
                DIC => alu_result(3 downto 2),
                DID => alu_result(3 downto 2),
                 WE => register_enable, 
               WCLK => clk );

  upper_reg_banks : RAM32M
  generic map (INIT_A => X"0000000000000000", 
               INIT_B => X"0000000000000000", 
               INIT_C => X"0000000000000000", 
               INIT_D => X"0000000000000000") 
  port map (    DOA => sy(5 downto 4), 
                DOB => sx(5 downto 4),
                DOC => sy(7 downto 6),
                DOD => sx(7 downto 6),
              ADDRA => sy_addr, 
              ADDRB => sx_addr, 
              ADDRC => sy_addr, 
              ADDRD => sx_addr, 
                DIA => alu_result(5 downto 4),
                DIB => alu_result(5 downto 4),
                DIC => alu_result(7 downto 6),
                DID => alu_result(7 downto 6),
                 WE => register_enable, 
               WCLK => clk );




  --
  -------------------------------------------------------------------------------------------
  --
  -- Connections to KCPSM6 outputs.
  --
  -------------------------------------------------------------------------------------------
  --


  address <= pc;
  bram_enable <= t_state(2);
 
  --
  -------------------------------------------------------------------------------------------
  --
  -- Connections KCPSM6 Outputs.
  --
  -------------------------------------------------------------------------------------------
  --

  port_id <= sy_or_kk;

--
-------------------------------------------------------------------------------------------
--
-- End of description for kcpsm6 macro.
--
-------------------------------------------------------------------------------------------
--
-- *****************************************************
-- * Code for simulation purposes only after this line *
-- *****************************************************
--
--
-- Disassemble the instruction codes to form a text string for display.
-- Determine status of reset and flags and present in the form of a text string.
-- Provide signals to simulate the contents of each register and scratch pad memory 
-- location.
--
-------------------------------------------------------------------------------------------
--
  --All of this section is ignored during synthesis.
  --synthesis translate off

  simulation: process (clk, instruction, carry_flag, zero_flag, bank, interrupt_enable)

  --
  -- Variables for contents of each register in each bank
  --
  variable bank_a_s0 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s1 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s2 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s3 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s4 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s5 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s6 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s7 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s8 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_s9 : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_sa : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_sb : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_sc : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_sd : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_se : std_logic_vector(7 downto 0) := X"00";
  variable bank_a_sf : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s0 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s1 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s2 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s3 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s4 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s5 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s6 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s7 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s8 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_s9 : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_sa : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_sb : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_sc : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_sd : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_se : std_logic_vector(7 downto 0) := X"00";
  variable bank_b_sf : std_logic_vector(7 downto 0) := X"00";
  --
  -- Temporary variables for instruction decoding
  --
  variable     sx_decode : string(1 to 2);   -- sX register specification
  variable     sy_decode : string(1 to 2);   -- sY register specification
  variable     kk_decode : string(1 to 2);   -- constant value kk, pp or ss
  variable    aaa_decode : string(1 to 3);   -- address value aaa
  --
  -----------------------------------------------------------------------------------------
  --
  -- Function to convert 4-bit binary nibble to hexadecimal character
  --
  -----------------------------------------------------------------------------------------
  --
  function hexcharacter (nibble: std_logic_vector(3 downto 0))
  return character is
  variable hex: character;
  begin
    case nibble is
      when "0000" => hex := '0';
      when "0001" => hex := '1';
      when "0010" => hex := '2';
      when "0011" => hex := '3';
      when "0100" => hex := '4';
      when "0101" => hex := '5';
      when "0110" => hex := '6';
      when "0111" => hex := '7';
      when "1000" => hex := '8';
      when "1001" => hex := '9';
      when "1010" => hex := 'A';
      when "1011" => hex := 'B';
      when "1100" => hex := 'C';
      when "1101" => hex := 'D';
      when "1110" => hex := 'E';
      when "1111" => hex := 'F';
      when others => hex := 'x';
    end case;
    return hex;
  end hexcharacter;
  --
  -----------------------------------------------------------------------------------------
  --
  begin
     
    -- decode first register sX
    sx_decode(1) := 's';
    sx_decode(2) := hexcharacter(instruction(11 downto 8));             

    -- decode second register sY
    sy_decode(1) := 's';
    sy_decode(2) := hexcharacter(instruction(7 downto 4));  

    -- decode constant value
    kk_decode(1) := hexcharacter(instruction(7 downto 4));
    kk_decode(2) := hexcharacter(instruction(3 downto 0));

    -- address value
    aaa_decode(1) := hexcharacter(instruction(11 downto 8));
    aaa_decode(2) := hexcharacter(instruction(7 downto 4));
    aaa_decode(3) := hexcharacter(instruction(3 downto 0));

    -- decode instruction
    case instruction(17 downto 12) is
      when "000000" => kcpsm6_opcode <= "LOAD " & sx_decode & ", " & sy_decode & "        ";
      when "000001" => kcpsm6_opcode <= "LOAD " & sx_decode & ", " & kk_decode & "        ";
      when "010110" => kcpsm6_opcode <= "STAR " & sx_decode & ", " & sy_decode & "        ";
      when "000010" => kcpsm6_opcode <= "AND " & sx_decode & ", " & sy_decode & "         ";
      when "000011" => kcpsm6_opcode <= "AND " & sx_decode & ", " & kk_decode & "         ";
      when "000100" => kcpsm6_opcode <= "OR " & sx_decode & ", " & sy_decode & "          ";
      when "000101" => kcpsm6_opcode <= "OR " & sx_decode & ", " & kk_decode & "          ";
      when "000110" => kcpsm6_opcode <= "XOR " & sx_decode & ", " & sy_decode & "         ";
      when "000111" => kcpsm6_opcode <= "XOR " & sx_decode & ", " & kk_decode & "         ";
      when "001100" => kcpsm6_opcode <= "TEST " & sx_decode & ", " & sy_decode & "        ";
      when "001101" => kcpsm6_opcode <= "TEST " & sx_decode & ", " & kk_decode & "        ";
      when "001110" => kcpsm6_opcode <= "TESTCY " & sx_decode & ", " & sy_decode & "      ";
      when "001111" => kcpsm6_opcode <= "TESTCY " & sx_decode & ", " & kk_decode & "      ";
      when "010000" => kcpsm6_opcode <= "ADD " & sx_decode & ", " & sy_decode & "         ";
      when "010001" => kcpsm6_opcode <= "ADD " & sx_decode & ", " & kk_decode & "         ";
      when "010010" => kcpsm6_opcode <= "ADDCY " & sx_decode & ", " & sy_decode & "       ";
      when "010011" => kcpsm6_opcode <= "ADDCY " & sx_decode & ", " & kk_decode & "       ";
      when "011000" => kcpsm6_opcode <= "SUB " & sx_decode & ", " & sy_decode & "         ";
      when "011001" => kcpsm6_opcode <= "SUB " & sx_decode & ", " & kk_decode & "         ";
      when "011010" => kcpsm6_opcode <= "SUBCY " & sx_decode & ", " & sy_decode & "       ";
      when "011011" => kcpsm6_opcode <= "SUBCY " & sx_decode & ", " & kk_decode & "       ";
      when "011100" => kcpsm6_opcode <= "COMPARE " & sx_decode & ", " & sy_decode & "     ";
      when "011101" => kcpsm6_opcode <= "COMPARE " & sx_decode & ", " & kk_decode & "     ";
      when "011110" => kcpsm6_opcode <= "COMPARECY " & sx_decode & ", " & sy_decode & "   ";
      when "011111" => kcpsm6_opcode <= "COMPARECY " & sx_decode & ", " & kk_decode & "   ";
      when "010100" =>
        if instruction(7) = '1' then
          kcpsm6_opcode <= "HWBUILD " & sx_decode & "         ";
         else
          case instruction(3 downto 0) is
            when "0110" => kcpsm6_opcode <= "SL0 " & sx_decode & "             ";
            when "0111" => kcpsm6_opcode <= "SL1 " & sx_decode & "             ";
            when "0100" => kcpsm6_opcode <= "SLX " & sx_decode & "             ";
            when "0000" => kcpsm6_opcode <= "SLA " & sx_decode & "             ";
            when "0010" => kcpsm6_opcode <= "RL " & sx_decode & "              ";
            when "1110" => kcpsm6_opcode <= "SR0 " & sx_decode & "             ";
            when "1111" => kcpsm6_opcode <= "SR1 " & sx_decode & "             ";
            when "1010" => kcpsm6_opcode <= "SRX " & sx_decode & "             ";
            when "1000" => kcpsm6_opcode <= "SRA " & sx_decode & "             ";
            when "1100" => kcpsm6_opcode <= "RR " & sx_decode & "              ";
            when others => kcpsm6_opcode <= "Invalid Instruction";
          end case;
         end if;
      when "101100" => kcpsm6_opcode <= "OUTPUT " & sx_decode & ", (" & sy_decode & ")    ";
      when "101101" => kcpsm6_opcode <= "OUTPUT " & sx_decode & ", " & kk_decode & "      ";
      when "101011" => kcpsm6_opcode <= "OUTPUTK " & aaa_decode(1) & aaa_decode(2)
                                                          & ", " & aaa_decode(3) & "      ";
      when "001000" => kcpsm6_opcode <= "INPUT " & sx_decode & ", (" & sy_decode & ")     ";
      when "001001" => kcpsm6_opcode <= "INPUT " & sx_decode & ", " & kk_decode & "       ";
      when "101110" => kcpsm6_opcode <= "STORE " & sx_decode & ", (" & sy_decode & ")     ";
      when "101111" => kcpsm6_opcode <= "STORE " & sx_decode & ", " & kk_decode & "       ";
      when "001010" => kcpsm6_opcode <= "FETCH " & sx_decode & ", (" & sy_decode & ")     ";
      when "001011" => kcpsm6_opcode <= "FETCH " & sx_decode & ", " & kk_decode & "       ";
      when "100010" => kcpsm6_opcode <= "JUMP " & aaa_decode & "           ";
      when "110010" => kcpsm6_opcode <= "JUMP Z, " & aaa_decode & "        ";
      when "110110" => kcpsm6_opcode <= "JUMP NZ, " & aaa_decode & "       ";
      when "111010" => kcpsm6_opcode <= "JUMP C, " & aaa_decode & "        ";
      when "111110" => kcpsm6_opcode <= "JUMP NC, " & aaa_decode & "       ";
      when "100110" => kcpsm6_opcode <= "JUMP@ (" & sx_decode & ", " & sy_decode & ")     ";
      when "100000" => kcpsm6_opcode <= "CALL " & aaa_decode & "           ";
      when "110000" => kcpsm6_opcode <= "CALL Z, " & aaa_decode & "        ";
      when "110100" => kcpsm6_opcode <= "CALL NZ, " & aaa_decode & "       ";
      when "111000" => kcpsm6_opcode <= "CALL C, " & aaa_decode & "        ";
      when "111100" => kcpsm6_opcode <= "CALL NC, " & aaa_decode & "       ";
      when "100100" => kcpsm6_opcode <= "CALL@ (" & sx_decode & ", " & sy_decode & ")     ";
      when "100101" => kcpsm6_opcode <= "RETURN             ";
      when "110001" => kcpsm6_opcode <= "RETURN Z           ";
      when "110101" => kcpsm6_opcode <= "RETURN NZ          ";
      when "111001" => kcpsm6_opcode <= "RETURN C           ";
      when "111101" => kcpsm6_opcode <= "RETURN NC          ";
      when "100001" => kcpsm6_opcode <= "LOAD&RETURN " & sx_decode & ", " & kk_decode & " ";
      when "101001" =>
        case instruction(0) is
          when '0' => kcpsm6_opcode <= "RETURNI DISABLE    ";
          when '1' => kcpsm6_opcode <= "RETURNI ENABLE     ";
          when others => kcpsm6_opcode <= "Invalid Instruction";
        end case;
      when "101000" =>
        case instruction(0) is
          when '0' => kcpsm6_opcode <= "DISABLE INTERRUPT  ";
          when '1' => kcpsm6_opcode <= "ENABLE INTERRUPT   ";
          when others => kcpsm6_opcode <= "Invalid Instruction";
        end case;
      when "110111" =>
        case instruction(0) is
          when '0' => kcpsm6_opcode <= "REGBANK A          ";
          when '1' => kcpsm6_opcode <= "REGBANK B          ";
          when others => kcpsm6_opcode <= "Invalid Instruction";
        end case;
      when others => kcpsm6_opcode <= "Invalid Instruction";
    end case;



    -- Flag status information
    
    if zero_flag = '0' then
      kcpsm6_status(3 to 5) <= "NZ,";
     else
      kcpsm6_status(3 to 5) <= " Z,";
    end if;

    if carry_flag = '0' then
      kcpsm6_status(6 to 8) <= "NC,";
     else
      kcpsm6_status(6 to 8) <= " C,";
    end if;

    if interrupt_enable = '0' then
      kcpsm6_status(9 to 10) <= "ID";
     else
      kcpsm6_status(9 to 10) <= "IE";
    end if;

    -- Operational status 

    if clk'event and clk = '1' then 
      if internal_reset = '1' then
        kcpsm6_status(11 to 16) <= ",Reset";
       else
        if sync_sleep = '1' and t_state = "00" then
          kcpsm6_status(11 to 16) <= ",Sleep";
         else
          kcpsm6_status(11 to 16) <= "      ";
        end if;
      end if;
    end if;


    -- Simulation of register contents
    if clk'event and clk = '1' then 
      if register_enable = '1' then
        case sx_addr is
          when "00000" => bank_a_s0 := alu_result;
          when "00001" => bank_a_s1 := alu_result;
          when "00010" => bank_a_s2 := alu_result;
          when "00011" => bank_a_s3 := alu_result;
          when "00100" => bank_a_s4 := alu_result;
          when "00101" => bank_a_s5 := alu_result;
          when "00110" => bank_a_s6 := alu_result;
          when "00111" => bank_a_s7 := alu_result;
          when "01000" => bank_a_s8 := alu_result;
          when "01001" => bank_a_s9 := alu_result;
          when "01010" => bank_a_sa := alu_result;
          when "01011" => bank_a_sb := alu_result;
          when "01100" => bank_a_sc := alu_result;
          when "01101" => bank_a_sd := alu_result;
          when "01110" => bank_a_se := alu_result;
          when "01111" => bank_a_sf := alu_result;
          when "10000" => bank_b_s0 := alu_result;
          when "10001" => bank_b_s1 := alu_result;
          when "10010" => bank_b_s2 := alu_result;
          when "10011" => bank_b_s3 := alu_result;
          when "10100" => bank_b_s4 := alu_result;
          when "10101" => bank_b_s5 := alu_result;
          when "10110" => bank_b_s6 := alu_result;
          when "10111" => bank_b_s7 := alu_result;
          when "11000" => bank_b_s8 := alu_result;
          when "11001" => bank_b_s9 := alu_result;
          when "11010" => bank_b_sa := alu_result;
          when "11011" => bank_b_sb := alu_result;
          when "11100" => bank_b_sc := alu_result;
          when "11101" => bank_b_sd := alu_result;
          when "11110" => bank_b_se := alu_result;
          when "11111" => bank_b_sf := alu_result;
          when others => null;
        end case;
      end if;

      --simulation of scratch pad memory contents
      if spm_enable = '1' then
        case sy_or_kk is
          when "00000000" => sim_spm00 <= sx;
          when "00000001" => sim_spm01 <= sx;
          when "00000010" => sim_spm02 <= sx;
          when "00000011" => sim_spm03 <= sx;
          when "00000100" => sim_spm04 <= sx;
          when "00000101" => sim_spm05 <= sx;
          when "00000110" => sim_spm06 <= sx;
          when "00000111" => sim_spm07 <= sx;
          when "00001000" => sim_spm08 <= sx;
          when "00001001" => sim_spm09 <= sx;
          when "00001010" => sim_spm0A <= sx;
          when "00001011" => sim_spm0B <= sx;
          when "00001100" => sim_spm0C <= sx;
          when "00001101" => sim_spm0D <= sx;
          when "00001110" => sim_spm0E <= sx;
          when "00001111" => sim_spm0F <= sx;
          when "00010000" => sim_spm10 <= sx;
          when "00010001" => sim_spm11 <= sx;
          when "00010010" => sim_spm12 <= sx;
          when "00010011" => sim_spm13 <= sx;
          when "00010100" => sim_spm14 <= sx;
          when "00010101" => sim_spm15 <= sx;
          when "00010110" => sim_spm16 <= sx;
          when "00010111" => sim_spm17 <= sx;
          when "00011000" => sim_spm18 <= sx;
          when "00011001" => sim_spm19 <= sx;
          when "00011010" => sim_spm1A <= sx;
          when "00011011" => sim_spm1B <= sx;
          when "00011100" => sim_spm1C <= sx;
          when "00011101" => sim_spm1D <= sx;
          when "00011110" => sim_spm1E <= sx;
          when "00011111" => sim_spm1F <= sx;
          when "00100000" => sim_spm20 <= sx;
          when "00100001" => sim_spm21 <= sx;
          when "00100010" => sim_spm22 <= sx;
          when "00100011" => sim_spm23 <= sx;
          when "00100100" => sim_spm24 <= sx;
          when "00100101" => sim_spm25 <= sx;
          when "00100110" => sim_spm26 <= sx;
          when "00100111" => sim_spm27 <= sx;
          when "00101000" => sim_spm28 <= sx;
          when "00101001" => sim_spm29 <= sx;
          when "00101010" => sim_spm2A <= sx;
          when "00101011" => sim_spm2B <= sx;
          when "00101100" => sim_spm2C <= sx;
          when "00101101" => sim_spm2D <= sx;
          when "00101110" => sim_spm2E <= sx;
          when "00101111" => sim_spm2F <= sx;
          when "00110000" => sim_spm30 <= sx;
          when "00110001" => sim_spm31 <= sx;
          when "00110010" => sim_spm32 <= sx;
          when "00110011" => sim_spm33 <= sx;
          when "00110100" => sim_spm34 <= sx;
          when "00110101" => sim_spm35 <= sx;
          when "00110110" => sim_spm36 <= sx;
          when "00110111" => sim_spm37 <= sx;
          when "00111000" => sim_spm38 <= sx;
          when "00111001" => sim_spm39 <= sx;
          when "00111010" => sim_spm3A <= sx;
          when "00111011" => sim_spm3B <= sx;
          when "00111100" => sim_spm3C <= sx;
          when "00111101" => sim_spm3D <= sx;
          when "00111110" => sim_spm3E <= sx;
          when "00111111" => sim_spm3F <= sx;
          when "01000000" => sim_spm40 <= sx;
          when "01000001" => sim_spm41 <= sx;
          when "01000010" => sim_spm42 <= sx;
          when "01000011" => sim_spm43 <= sx;
          when "01000100" => sim_spm44 <= sx;
          when "01000101" => sim_spm45 <= sx;
          when "01000110" => sim_spm46 <= sx;
          when "01000111" => sim_spm47 <= sx;
          when "01001000" => sim_spm48 <= sx;
          when "01001001" => sim_spm49 <= sx;
          when "01001010" => sim_spm4A <= sx;
          when "01001011" => sim_spm4B <= sx;
          when "01001100" => sim_spm4C <= sx;
          when "01001101" => sim_spm4D <= sx;
          when "01001110" => sim_spm4E <= sx;
          when "01001111" => sim_spm4F <= sx;
          when "01010000" => sim_spm50 <= sx;
          when "01010001" => sim_spm51 <= sx;
          when "01010010" => sim_spm52 <= sx;
          when "01010011" => sim_spm53 <= sx;
          when "01010100" => sim_spm54 <= sx;
          when "01010101" => sim_spm55 <= sx;
          when "01010110" => sim_spm56 <= sx;
          when "01010111" => sim_spm57 <= sx;
          when "01011000" => sim_spm58 <= sx;
          when "01011001" => sim_spm59 <= sx;
          when "01011010" => sim_spm5A <= sx;
          when "01011011" => sim_spm5B <= sx;
          when "01011100" => sim_spm5C <= sx;
          when "01011101" => sim_spm5D <= sx;
          when "01011110" => sim_spm5E <= sx;
          when "01011111" => sim_spm5F <= sx;
          when "01100000" => sim_spm60 <= sx;
          when "01100001" => sim_spm61 <= sx;
          when "01100010" => sim_spm62 <= sx;
          when "01100011" => sim_spm63 <= sx;
          when "01100100" => sim_spm64 <= sx;
          when "01100101" => sim_spm65 <= sx;
          when "01100110" => sim_spm66 <= sx;
          when "01100111" => sim_spm67 <= sx;
          when "01101000" => sim_spm68 <= sx;
          when "01101001" => sim_spm69 <= sx;
          when "01101010" => sim_spm6A <= sx;
          when "01101011" => sim_spm6B <= sx;
          when "01101100" => sim_spm6C <= sx;
          when "01101101" => sim_spm6D <= sx;
          when "01101110" => sim_spm6E <= sx;
          when "01101111" => sim_spm6F <= sx;
          when "01110000" => sim_spm70 <= sx;
          when "01110001" => sim_spm71 <= sx;
          when "01110010" => sim_spm72 <= sx;
          when "01110011" => sim_spm73 <= sx;
          when "01110100" => sim_spm74 <= sx;
          when "01110101" => sim_spm75 <= sx;
          when "01110110" => sim_spm76 <= sx;
          when "01110111" => sim_spm77 <= sx;
          when "01111000" => sim_spm78 <= sx;
          when "01111001" => sim_spm79 <= sx;
          when "01111010" => sim_spm7A <= sx;
          when "01111011" => sim_spm7B <= sx;
          when "01111100" => sim_spm7C <= sx;
          when "01111101" => sim_spm7D <= sx;
          when "01111110" => sim_spm7E <= sx;
          when "01111111" => sim_spm7F <= sx;
          when "10000000" => sim_spm80 <= sx;
          when "10000001" => sim_spm81 <= sx;
          when "10000010" => sim_spm82 <= sx;
          when "10000011" => sim_spm83 <= sx;
          when "10000100" => sim_spm84 <= sx;
          when "10000101" => sim_spm85 <= sx;
          when "10000110" => sim_spm86 <= sx;
          when "10000111" => sim_spm87 <= sx;
          when "10001000" => sim_spm88 <= sx;
          when "10001001" => sim_spm89 <= sx;
          when "10001010" => sim_spm8A <= sx;
          when "10001011" => sim_spm8B <= sx;
          when "10001100" => sim_spm8C <= sx;
          when "10001101" => sim_spm8D <= sx;
          when "10001110" => sim_spm8E <= sx;
          when "10001111" => sim_spm8F <= sx;
          when "10010000" => sim_spm90 <= sx;
          when "10010001" => sim_spm91 <= sx;
          when "10010010" => sim_spm92 <= sx;
          when "10010011" => sim_spm93 <= sx;
          when "10010100" => sim_spm94 <= sx;
          when "10010101" => sim_spm95 <= sx;
          when "10010110" => sim_spm96 <= sx;
          when "10010111" => sim_spm97 <= sx;
          when "10011000" => sim_spm98 <= sx;
          when "10011001" => sim_spm99 <= sx;
          when "10011010" => sim_spm9A <= sx;
          when "10011011" => sim_spm9B <= sx;
          when "10011100" => sim_spm9C <= sx;
          when "10011101" => sim_spm9D <= sx;
          when "10011110" => sim_spm9E <= sx;
          when "10011111" => sim_spm9F <= sx;
          when "10100000" => sim_spma0 <= sx;
          when "10100001" => sim_spmA1 <= sx;
          when "10100010" => sim_spmA2 <= sx;
          when "10100011" => sim_spmA3 <= sx;
          when "10100100" => sim_spmA4 <= sx;
          when "10100101" => sim_spmA5 <= sx;
          when "10100110" => sim_spmA6 <= sx;
          when "10100111" => sim_spmA7 <= sx;
          when "10101000" => sim_spmA8 <= sx;
          when "10101001" => sim_spmA9 <= sx;
          when "10101010" => sim_spmAA <= sx;
          when "10101011" => sim_spmAB <= sx;
          when "10101100" => sim_spmAC <= sx;
          when "10101101" => sim_spmAD <= sx;
          when "10101110" => sim_spmAE <= sx;
          when "10101111" => sim_spmAF <= sx;
          when "10110000" => sim_spmB0 <= sx;
          when "10110001" => sim_spmB1 <= sx;
          when "10110010" => sim_spmB2 <= sx;
          when "10110011" => sim_spmB3 <= sx;
          when "10110100" => sim_spmB4 <= sx;
          when "10110101" => sim_spmB5 <= sx;
          when "10110110" => sim_spmB6 <= sx;
          when "10110111" => sim_spmB7 <= sx;
          when "10111000" => sim_spmB8 <= sx;
          when "10111001" => sim_spmB9 <= sx;
          when "10111010" => sim_spmBA <= sx;
          when "10111011" => sim_spmBB <= sx;
          when "10111100" => sim_spmBC <= sx;
          when "10111101" => sim_spmBD <= sx;
          when "10111110" => sim_spmBE <= sx;
          when "10111111" => sim_spmBF <= sx;
          when "11000000" => sim_spmC0 <= sx;
          when "11000001" => sim_spmC1 <= sx;
          when "11000010" => sim_spmC2 <= sx;
          when "11000011" => sim_spmC3 <= sx;
          when "11000100" => sim_spmC4 <= sx;
          when "11000101" => sim_spmC5 <= sx;
          when "11000110" => sim_spmC6 <= sx;
          when "11000111" => sim_spmC7 <= sx;
          when "11001000" => sim_spmC8 <= sx;
          when "11001001" => sim_spmC9 <= sx;
          when "11001010" => sim_spmCA <= sx;
          when "11001011" => sim_spmCB <= sx;
          when "11001100" => sim_spmCC <= sx;
          when "11001101" => sim_spmCD <= sx;
          when "11001110" => sim_spmCE <= sx;
          when "11001111" => sim_spmCF <= sx;
          when "11010000" => sim_spmD0 <= sx;
          when "11010001" => sim_spmD1 <= sx;
          when "11010010" => sim_spmD2 <= sx;
          when "11010011" => sim_spmD3 <= sx;
          when "11010100" => sim_spmD4 <= sx;
          when "11010101" => sim_spmD5 <= sx;
          when "11010110" => sim_spmD6 <= sx;
          when "11010111" => sim_spmD7 <= sx;
          when "11011000" => sim_spmD8 <= sx;
          when "11011001" => sim_spmD9 <= sx;
          when "11011010" => sim_spmDA <= sx;
          when "11011011" => sim_spmDB <= sx;
          when "11011100" => sim_spmDC <= sx;
          when "11011101" => sim_spmDD <= sx;
          when "11011110" => sim_spmDE <= sx;
          when "11011111" => sim_spmDF <= sx;
          when "11100000" => sim_spmE0 <= sx;
          when "11100001" => sim_spmE1 <= sx;
          when "11100010" => sim_spmE2 <= sx;
          when "11100011" => sim_spmE3 <= sx;
          when "11100100" => sim_spmE4 <= sx;
          when "11100101" => sim_spmE5 <= sx;
          when "11100110" => sim_spmE6 <= sx;
          when "11100111" => sim_spmE7 <= sx;
          when "11101000" => sim_spmE8 <= sx;
          when "11101001" => sim_spmE9 <= sx;
          when "11101010" => sim_spmEA <= sx;
          when "11101011" => sim_spmEB <= sx;
          when "11101100" => sim_spmEC <= sx;
          when "11101101" => sim_spmED <= sx;
          when "11101110" => sim_spmEE <= sx;
          when "11101111" => sim_spmEF <= sx;
          when "11110000" => sim_spmF0 <= sx;
          when "11110001" => sim_spmF1 <= sx;
          when "11110010" => sim_spmF2 <= sx;
          when "11110011" => sim_spmF3 <= sx;
          when "11110100" => sim_spmF4 <= sx;
          when "11110101" => sim_spmF5 <= sx;
          when "11110110" => sim_spmF6 <= sx;
          when "11110111" => sim_spmF7 <= sx;
          when "11111000" => sim_spmF8 <= sx;
          when "11111001" => sim_spmF9 <= sx;
          when "11111010" => sim_spmFA <= sx;
          when "11111011" => sim_spmFB <= sx;
          when "11111100" => sim_spmFC <= sx;
          when "11111101" => sim_spmFD <= sx;
          when "11111110" => sim_spmFE <= sx;
          when "11111111" => sim_spmFF <= sx;
          when others => null;
        end case;
      end if;

    end if;

    --
    -- Assignment of internal register variables to active registers 
    --
    if bank = '0' then
      kcpsm6_status(1 to 2) <= "A,";
      sim_s0 <= bank_a_s0;
      sim_s1 <= bank_a_s1;
      sim_s2 <= bank_a_s2;
      sim_s3 <= bank_a_s3;
      sim_s4 <= bank_a_s4;
      sim_s5 <= bank_a_s5;
      sim_s6 <= bank_a_s6;
      sim_s7 <= bank_a_s7;
      sim_s8 <= bank_a_s8;
      sim_s9 <= bank_a_s9;
      sim_sA <= bank_a_sA;
      sim_sB <= bank_a_sB;
      sim_sC <= bank_a_sC;
      sim_sD <= bank_a_sD;
      sim_sE <= bank_a_sE;
      sim_sF <= bank_a_sF;
     else
      kcpsm6_status(1 to 2) <= "B,";
      sim_s0 <= bank_b_s0;
      sim_s1 <= bank_b_s1;
      sim_s2 <= bank_b_s2;
      sim_s3 <= bank_b_s3;
      sim_s4 <= bank_b_s4;
      sim_s5 <= bank_b_s5;
      sim_s6 <= bank_b_s6;
      sim_s7 <= bank_b_s7;
      sim_s8 <= bank_b_s8;
      sim_s9 <= bank_b_s9;
      sim_sA <= bank_b_sA;
      sim_sB <= bank_b_sB;
      sim_sC <= bank_b_sC;
      sim_sD <= bank_b_sD;
      sim_sE <= bank_b_sE;
      sim_sF <= bank_b_sF;
    end if;

    --
  end process simulation;
  
  --synthesis translate on
--
-- **************************
-- * End of simulation code *
-- **************************
--
--
-------------------------------------------------------------------------------------------
--
end low_level_definition;
--
-------------------------------------------------------------------------------------------
--
-- END OF FILE kcpsm6.vhd
--
-------------------------------------------------------------------------------------------
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_e89a3b98d5 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((7 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_e89a3b98d5;
architecture behavior of sysgen_concat_e89a3b98d5
is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((7 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_c027f7f292 is
  port (
    in0 : in std_logic_vector((7 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_c027f7f292;
architecture behavior of sysgen_concat_c027f7f292
is
  signal in0_1_23: unsigned((7 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_7176502a27 is
  port (
    in0 : in std_logic_vector((5 - 1) downto 0);
    in1 : in std_logic_vector((3 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_7176502a27;
architecture behavior of sysgen_concat_7176502a27
is
  signal in0_1_23: unsigned((5 - 1) downto 0);
  signal in1_1_27: unsigned((3 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_1eb6753fd5 is
  port (
    op : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_1eb6753fd5;
architecture behavior of sysgen_constant_1eb6753fd5
is
begin
  op <= "0000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_95996df5e3 is
  port (
    op : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_95996df5e3;
architecture behavior of sysgen_constant_95996df5e3
is
begin
  op <= "00000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_2cde6def7c is
  port (
    sel : in std_logic_vector((4 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    d2 : in std_logic_vector((8 - 1) downto 0);
    d3 : in std_logic_vector((8 - 1) downto 0);
    d4 : in std_logic_vector((8 - 1) downto 0);
    d5 : in std_logic_vector((8 - 1) downto 0);
    d6 : in std_logic_vector((8 - 1) downto 0);
    d7 : in std_logic_vector((8 - 1) downto 0);
    d8 : in std_logic_vector((8 - 1) downto 0);
    d9 : in std_logic_vector((8 - 1) downto 0);
    d10 : in std_logic_vector((8 - 1) downto 0);
    d11 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_2cde6def7c;
architecture behavior of sysgen_mux_2cde6def7c
is
  signal sel_1_20: std_logic_vector((4 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal d2_1_30: std_logic_vector((8 - 1) downto 0);
  signal d3_1_33: std_logic_vector((8 - 1) downto 0);
  signal d4_1_36: std_logic_vector((8 - 1) downto 0);
  signal d5_1_39: std_logic_vector((8 - 1) downto 0);
  signal d6_1_42: std_logic_vector((8 - 1) downto 0);
  signal d7_1_45: std_logic_vector((8 - 1) downto 0);
  signal d8_1_48: std_logic_vector((8 - 1) downto 0);
  signal d9_1_51: std_logic_vector((8 - 1) downto 0);
  signal d10_1_54: std_logic_vector((8 - 1) downto 0);
  signal d11_1_58: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_36_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_36_22: array_type_pipe_36_22 := (
    0 => "00000000");
  signal pipe_36_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_36_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_36_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  d8_1_48 <= d8;
  d9_1_51 <= d9;
  d10_1_54 <= d10;
  d11_1_58 <= d11;
  pipe_36_22_back <= pipe_36_22(0);
  proc_pipe_36_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_36_22_push_front_pop_back_en = '1')) then
        pipe_36_22(0) <= pipe_36_22_front_din;
      end if;
    end if;
  end process proc_pipe_36_22;
  proc_switch_6_1: process (d0_1_24, d10_1_54, d11_1_58, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, d8_1_48, d9_1_51, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0000" =>
        unregy_join_6_1 <= d0_1_24;
      when "0001" =>
        unregy_join_6_1 <= d1_1_27;
      when "0010" =>
        unregy_join_6_1 <= d2_1_30;
      when "0011" =>
        unregy_join_6_1 <= d3_1_33;
      when "0100" =>
        unregy_join_6_1 <= d4_1_36;
      when "0101" =>
        unregy_join_6_1 <= d5_1_39;
      when "0110" =>
        unregy_join_6_1 <= d6_1_42;
      when "0111" =>
        unregy_join_6_1 <= d7_1_45;
      when "1000" =>
        unregy_join_6_1 <= d8_1_48;
      when "1001" =>
        unregy_join_6_1 <= d9_1_51;
      when "1010" =>
        unregy_join_6_1 <= d10_1_54;
      when others =>
        unregy_join_6_1 <= d11_1_58;
    end case;
  end process proc_switch_6_1;
  pipe_36_22_front_din <= unregy_join_6_1;
  pipe_36_22_push_front_pop_back_en <= '1';
  y <= pipe_36_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_0a45c5a438 is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_0a45c5a438;
architecture behavior of sysgen_concat_0a45c5a438
is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_69beafd7ba is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_69beafd7ba;
architecture behavior of sysgen_concat_69beafd7ba
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((10 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_9d0d8dba2f is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_9d0d8dba2f;
architecture behavior of sysgen_constant_9d0d8dba2f
is
begin
  op <= "00000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_9e4476deab is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_9e4476deab;
architecture behavior of sysgen_relational_9e4476deab
is
  signal a_1_31: unsigned((8 - 1) downto 0);
  signal b_1_34: unsigned((8 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_4190c690be is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_4190c690be;
architecture behavior of sysgen_constant_4190c690be
is
begin
  op <= "00000001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e09cd2cc02 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e09cd2cc02;
architecture behavior of sysgen_constant_e09cd2cc02
is
begin
  op <= "00001011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_821288e337 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_821288e337;
architecture behavior of sysgen_constant_821288e337
is
begin
  op <= "00001100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_f9ecb94ebe is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_f9ecb94ebe;
architecture behavior of sysgen_constant_f9ecb94ebe
is
begin
  op <= "00001101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_6aeed7700f is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_6aeed7700f;
architecture behavior of sysgen_constant_6aeed7700f
is
begin
  op <= "00001110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_4dee2ca19f is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_4dee2ca19f;
architecture behavior of sysgen_constant_4dee2ca19f
is
begin
  op <= "00001111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_2f41f97971 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_2f41f97971;
architecture behavior of sysgen_constant_2f41f97971
is
begin
  op <= "00010000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_7ac4993069 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_7ac4993069;
architecture behavior of sysgen_constant_7ac4993069
is
begin
  op <= "00010001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_b6f29614f9 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_b6f29614f9;
architecture behavior of sysgen_constant_b6f29614f9
is
begin
  op <= "00010010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_f89c3d03e9 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_f89c3d03e9;
architecture behavior of sysgen_constant_f89c3d03e9
is
begin
  op <= "00010011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_a218a1253f is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_a218a1253f;
architecture behavior of sysgen_constant_a218a1253f
is
begin
  op <= "00000011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_073cc76cc2 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_073cc76cc2;
architecture behavior of sysgen_constant_073cc76cc2
is
begin
  op <= "00010100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_871182b3d0 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_871182b3d0;
architecture behavior of sysgen_constant_871182b3d0
is
begin
  op <= "00010101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_112f602149 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_112f602149;
architecture behavior of sysgen_constant_112f602149
is
begin
  op <= "00010110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_47508c1bc7 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_47508c1bc7;
architecture behavior of sysgen_constant_47508c1bc7
is
begin
  op <= "00010111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_d383ad7533 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_d383ad7533;
architecture behavior of sysgen_constant_d383ad7533
is
begin
  op <= "00011000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_d3486b10be is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_d3486b10be;
architecture behavior of sysgen_constant_d3486b10be
is
begin
  op <= "00011001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_37c57ab154 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_37c57ab154;
architecture behavior of sysgen_constant_37c57ab154
is
begin
  op <= "00011010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_ac9067f0a9 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_ac9067f0a9;
architecture behavior of sysgen_constant_ac9067f0a9
is
begin
  op <= "00011011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_c34ec3e52a is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_c34ec3e52a;
architecture behavior of sysgen_constant_c34ec3e52a
is
begin
  op <= "00011100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_1a4e0cfb40 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_1a4e0cfb40;
architecture behavior of sysgen_constant_1a4e0cfb40
is
begin
  op <= "00000100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_845cff379f is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_845cff379f;
architecture behavior of sysgen_constant_845cff379f
is
begin
  op <= "00000101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e05d28d7b0 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e05d28d7b0;
architecture behavior of sysgen_constant_e05d28d7b0
is
begin
  op <= "00000110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_8f1ac0bb1b is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_8f1ac0bb1b;
architecture behavior of sysgen_constant_8f1ac0bb1b
is
begin
  op <= "00000111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_731ac842ab is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_731ac842ab;
architecture behavior of sysgen_constant_731ac842ab
is
begin
  op <= "00000010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_2fb1f15adb is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_2fb1f15adb;
architecture behavior of sysgen_constant_2fb1f15adb
is
begin
  op <= "00001000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_00dfbd154d is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_00dfbd154d;
architecture behavior of sysgen_constant_00dfbd154d
is
begin
  op <= "00001001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_655e1dcf1c is
  port (
    b : in std_logic_vector((16 - 1) downto 0);
    q : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_655e1dcf1c;
architecture behavior of sysgen_accum_655e1dcf1c
is
  signal b_17_24: unsigned((16 - 1) downto 0);
  signal accum_reg_39_23: unsigned((24 - 1) downto 0) := "000000000000000000000000";
  signal cast_49_42: unsigned((24 - 1) downto 0);
begin
  b_17_24 <= std_logic_vector_to_unsigned(b);
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        accum_reg_39_23 <= accum_reg_39_23 + cast_49_42;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  cast_49_42 <= u2u_cast(b_17_24, 0, 24, 0);
  q <= unsigned_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_d5e395a873 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_d5e395a873;
architecture behavior of sysgen_constant_d5e395a873
is
begin
  op <= "0000000101010101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_29359719ea is
  port (
    in0 : in std_logic_vector((3 - 1) downto 0);
    in1 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_29359719ea;
architecture behavior of sysgen_concat_29359719ea
is
  signal in0_1_23: unsigned((3 - 1) downto 0);
  signal in1_1_27: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((9 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_df4adc5aa1 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_df4adc5aa1;
architecture behavior of sysgen_concat_df4adc5aa1
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((9 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_c972ec02f4 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((9 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_c972ec02f4;
architecture behavior of sysgen_concat_c972ec02f4
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((9 - 1) downto 0);
  signal y_2_1_concat: unsigned((10 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_c1127d4441 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((16 - 1) downto 0);
    in4 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_c1127d4441;
architecture behavior of sysgen_concat_c1127d4441
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((16 - 1) downto 0);
  signal in4_1_39: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((25 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_68d229248a is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((16 - 1) downto 0);
    in3 : in std_logic_vector((7 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_68d229248a;
architecture behavior of sysgen_concat_68d229248a
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((16 - 1) downto 0);
  signal in3_1_35: unsigned((7 - 1) downto 0);
  signal y_2_1_concat: unsigned((25 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_f7481b9a41 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_f7481b9a41;
architecture behavior of sysgen_concat_f7481b9a41
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((25 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_ad0f58c2e6 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_ad0f58c2e6;
architecture behavior of sysgen_concat_ad0f58c2e6
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((18 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_d98ff4112d is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((15 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_d98ff4112d;
architecture behavior of sysgen_concat_d98ff4112d
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((15 - 1) downto 0);
  signal y_2_1_concat: unsigned((18 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_0e010ecf48 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((14 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_0e010ecf48;
architecture behavior of sysgen_concat_0e010ecf48
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((1 - 1) downto 0);
  signal in4_1_39: unsigned((14 - 1) downto 0);
  signal y_2_1_concat: unsigned((18 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_a0d784c0dd is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_a0d784c0dd;
architecture behavior of sysgen_constant_a0d784c0dd
is
begin
  op <= "000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_01f180e972 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((9 - 1) downto 0);
    d1 : in std_logic_vector((9 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_01f180e972;
architecture behavior of sysgen_mux_01f180e972
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((9 - 1) downto 0);
  signal d1_1_27: std_logic_vector((9 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((9 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "000000000");
  signal pipe_16_22_front_din: std_logic_vector((9 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((9 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((9 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_0c551e4813 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    d2 : in std_logic_vector((18 - 1) downto 0);
    d3 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_0c551e4813;
architecture behavior of sysgen_mux_0c551e4813
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  signal d2_1_30: std_logic_vector((18 - 1) downto 0);
  signal d3_1_33: std_logic_vector((18 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "000000000000000000");
  signal pipe_20_22_front_din: std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= cast(d0_1_24, 15, 18, 17, xlSigned);
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_d3df9392ea is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((25 - 1) downto 0);
    d1 : in std_logic_vector((25 - 1) downto 0);
    d2 : in std_logic_vector((25 - 1) downto 0);
    d3 : in std_logic_vector((25 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_d3df9392ea;
architecture behavior of sysgen_mux_d3df9392ea
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((25 - 1) downto 0);
  signal d1_1_27: std_logic_vector((25 - 1) downto 0);
  signal d2_1_30: std_logic_vector((25 - 1) downto 0);
  signal d3_1_33: std_logic_vector((25 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((25 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "0000000000000000000000000");
  signal pipe_20_22_front_din: std_logic_vector((25 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((25 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((25 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_ade7d6acee is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    d2 : in std_logic_vector((18 - 1) downto 0);
    d3 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_ade7d6acee;
architecture behavior of sysgen_mux_ade7d6acee
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  signal d2_1_30: std_logic_vector((18 - 1) downto 0);
  signal d3_1_33: std_logic_vector((18 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "000000000000000000");
  signal pipe_20_22_front_din: std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_d788387139 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_d788387139;
architecture behavior of sysgen_mux_d788387139
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_93768b945e is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_93768b945e;
architecture behavior of sysgen_reinterpret_93768b945e
is
  signal input_port_1_40: signed((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_b3084df45c is
  port (
    input_port : in std_logic_vector((25 - 1) downto 0);
    output_port : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_b3084df45c;
architecture behavior of sysgen_reinterpret_b3084df45c
is
  signal input_port_1_40: signed((25 - 1) downto 0);
  signal output_port_5_5_force: unsigned((25 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_10a2a2cdc6 is
  port (
    input_port : in std_logic_vector((18 - 1) downto 0);
    output_port : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_10a2a2cdc6;
architecture behavior of sysgen_reinterpret_10a2a2cdc6
is
  signal input_port_1_40: unsigned((18 - 1) downto 0);
  signal output_port_5_5_force: signed((18 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_0a0e933569 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    in5 : in std_logic_vector((16 - 1) downto 0);
    in6 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_0a0e933569;
architecture behavior of sysgen_concat_0a0e933569
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((1 - 1) downto 0);
  signal in4_1_39: unsigned((1 - 1) downto 0);
  signal in5_1_43: unsigned((16 - 1) downto 0);
  signal in6_1_47: unsigned((4 - 1) downto 0);
  signal y_2_1_concat: unsigned((25 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  in5_1_43 <= std_logic_vector_to_unsigned(in5);
  in6_1_47 <= std_logic_vector_to_unsigned(in6);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39) & unsigned_to_std_logic_vector(in5_1_43) & unsigned_to_std_logic_vector(in6_1_47));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_c95b4fd9a5 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((15 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_c95b4fd9a5;
architecture behavior of sysgen_concat_c95b4fd9a5
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((15 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_f7e97768de is
  port (
    in0 : in std_logic_vector((12 - 1) downto 0);
    in1 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_f7e97768de;
architecture behavior of sysgen_concat_f7e97768de
is
  signal in0_1_23: unsigned((12 - 1) downto 0);
  signal in1_1_27: unsigned((4 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_2dec865db8 is
  port (
    in0 : in std_logic_vector((13 - 1) downto 0);
    in1 : in std_logic_vector((3 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_2dec865db8;
architecture behavior of sysgen_concat_2dec865db8
is
  signal in0_1_23: unsigned((13 - 1) downto 0);
  signal in1_1_27: unsigned((3 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_cc27c1e9a8 is
  port (
    in0 : in std_logic_vector((14 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_cc27c1e9a8;
architecture behavior of sysgen_concat_cc27c1e9a8
is
  signal in0_1_23: unsigned((14 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_5c721efa33 is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_5c721efa33;
architecture behavior of sysgen_constant_5c721efa33
is
begin
  op <= "000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_03bb0ceeeb is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_03bb0ceeeb;
architecture behavior of sysgen_logical_03bb0ceeeb
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => "0");
  signal latency_pipe_5_26_front_din: std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26_back: std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= latency_pipe_5_26_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_694efeab37 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((25 - 1) downto 0);
    d1 : in std_logic_vector((25 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_694efeab37;
architecture behavior of sysgen_mux_694efeab37
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((25 - 1) downto 0);
  signal d1_1_27: std_logic_vector((25 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((25 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((25 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((25 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((25 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_aa1a2e70b2 is
  port (
    sel : in std_logic_vector((4 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    d2 : in std_logic_vector((16 - 1) downto 0);
    d3 : in std_logic_vector((16 - 1) downto 0);
    d4 : in std_logic_vector((16 - 1) downto 0);
    d5 : in std_logic_vector((16 - 1) downto 0);
    d6 : in std_logic_vector((16 - 1) downto 0);
    d7 : in std_logic_vector((16 - 1) downto 0);
    d8 : in std_logic_vector((16 - 1) downto 0);
    d9 : in std_logic_vector((16 - 1) downto 0);
    d10 : in std_logic_vector((16 - 1) downto 0);
    d11 : in std_logic_vector((16 - 1) downto 0);
    d12 : in std_logic_vector((16 - 1) downto 0);
    d13 : in std_logic_vector((16 - 1) downto 0);
    d14 : in std_logic_vector((16 - 1) downto 0);
    d15 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_aa1a2e70b2;
architecture behavior of sysgen_mux_aa1a2e70b2
is
  signal sel_1_20: std_logic_vector((4 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal d2_1_30: std_logic_vector((16 - 1) downto 0);
  signal d3_1_33: std_logic_vector((16 - 1) downto 0);
  signal d4_1_36: std_logic_vector((16 - 1) downto 0);
  signal d5_1_39: std_logic_vector((16 - 1) downto 0);
  signal d6_1_42: std_logic_vector((16 - 1) downto 0);
  signal d7_1_45: std_logic_vector((16 - 1) downto 0);
  signal d8_1_48: std_logic_vector((16 - 1) downto 0);
  signal d9_1_51: std_logic_vector((16 - 1) downto 0);
  signal d10_1_54: std_logic_vector((16 - 1) downto 0);
  signal d11_1_58: std_logic_vector((16 - 1) downto 0);
  signal d12_1_62: std_logic_vector((16 - 1) downto 0);
  signal d13_1_66: std_logic_vector((16 - 1) downto 0);
  signal d14_1_70: std_logic_vector((16 - 1) downto 0);
  signal d15_1_74: std_logic_vector((16 - 1) downto 0);
  type array_type_pipe_44_22 is array (0 to (1 - 1)) of std_logic_vector((16 - 1) downto 0);
  signal pipe_44_22: array_type_pipe_44_22 := (
    0 => "0000000000000000");
  signal pipe_44_22_front_din: std_logic_vector((16 - 1) downto 0);
  signal pipe_44_22_back: std_logic_vector((16 - 1) downto 0);
  signal pipe_44_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  d8_1_48 <= d8;
  d9_1_51 <= d9;
  d10_1_54 <= d10;
  d11_1_58 <= d11;
  d12_1_62 <= d12;
  d13_1_66 <= d13;
  d14_1_70 <= d14;
  d15_1_74 <= d15;
  pipe_44_22_back <= pipe_44_22(0);
  proc_pipe_44_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_44_22_push_front_pop_back_en = '1')) then
        pipe_44_22(0) <= pipe_44_22_front_din;
      end if;
    end if;
  end process proc_pipe_44_22;
  proc_switch_6_1: process (d0_1_24, d10_1_54, d11_1_58, d12_1_62, d13_1_66, d14_1_70, d15_1_74, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, d8_1_48, d9_1_51, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0000" =>
        unregy_join_6_1 <= d0_1_24;
      when "0001" =>
        unregy_join_6_1 <= d1_1_27;
      when "0010" =>
        unregy_join_6_1 <= d2_1_30;
      when "0011" =>
        unregy_join_6_1 <= d3_1_33;
      when "0100" =>
        unregy_join_6_1 <= d4_1_36;
      when "0101" =>
        unregy_join_6_1 <= d5_1_39;
      when "0110" =>
        unregy_join_6_1 <= d6_1_42;
      when "0111" =>
        unregy_join_6_1 <= d7_1_45;
      when "1000" =>
        unregy_join_6_1 <= d8_1_48;
      when "1001" =>
        unregy_join_6_1 <= d9_1_51;
      when "1010" =>
        unregy_join_6_1 <= d10_1_54;
      when "1011" =>
        unregy_join_6_1 <= d11_1_58;
      when "1100" =>
        unregy_join_6_1 <= d12_1_62;
      when "1101" =>
        unregy_join_6_1 <= d13_1_66;
      when "1110" =>
        unregy_join_6_1 <= d14_1_70;
      when others =>
        unregy_join_6_1 <= d15_1_74;
    end case;
  end process proc_switch_6_1;
  pipe_44_22_front_din <= unregy_join_6_1;
  pipe_44_22_push_front_pop_back_en <= '1';
  y <= pipe_44_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_d87c3f7eca is
  port (
    input_port : in std_logic_vector((25 - 1) downto 0);
    output_port : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_d87c3f7eca;
architecture behavior of sysgen_reinterpret_d87c3f7eca
is
  signal input_port_1_40: unsigned((25 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_f435551619 is
  port (
    b : in std_logic_vector((18 - 1) downto 0);
    rst : in std_logic_vector((1 - 1) downto 0);
    en : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_f435551619;
architecture behavior of sysgen_accum_f435551619
is
  signal b_17_24: signed((18 - 1) downto 0);
  signal rst_17_27: boolean;
  signal en_17_32: boolean;
  signal accum_reg_39_23: signed((18 - 1) downto 0) := "000000000000000000";
  signal accum_reg_39_23_rst: std_logic;
  signal accum_reg_39_23_en: std_logic;
  signal accum_reg_join_45_1: signed((19 - 1) downto 0);
  signal accum_reg_join_45_1_en: std_logic;
  signal accum_reg_join_45_1_rst: std_logic;
begin
  b_17_24 <= std_logic_vector_to_signed(b);
  rst_17_27 <= ((rst) = "1");
  en_17_32 <= ((en) = "1");
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (accum_reg_39_23_rst = '1')) then
        accum_reg_39_23 <= "000000000000000000";
      elsif ((ce = '1') and (accum_reg_39_23_en = '1')) then 
        accum_reg_39_23 <= accum_reg_39_23 + b_17_24;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  proc_if_45_1: process (accum_reg_39_23, b_17_24, en_17_32, rst_17_27)
  is
  begin
    if rst_17_27 then
      accum_reg_join_45_1_rst <= '1';
    elsif en_17_32 then
      accum_reg_join_45_1_rst <= '0';
    else 
      accum_reg_join_45_1_rst <= '0';
    end if;
    if en_17_32 then
      accum_reg_join_45_1_en <= '1';
    else 
      accum_reg_join_45_1_en <= '0';
    end if;
  end process proc_if_45_1;
  accum_reg_39_23_rst <= accum_reg_join_45_1_rst;
  accum_reg_39_23_en <= accum_reg_join_45_1_en;
  q <= signed_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_9fe97968f8 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_9fe97968f8;
architecture behavior of sysgen_concat_9fe97968f8
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((10 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_0f61a6a8ef is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_0f61a6a8ef;
architecture behavior of sysgen_mux_0f61a6a8ef
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_fe66a4e73b is
  port (
    op : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_fe66a4e73b;
architecture behavior of sysgen_constant_fe66a4e73b
is
begin
  op <= "11111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_a38da1e39a is
  port (
    a : in std_logic_vector((5 - 1) downto 0);
    b : in std_logic_vector((5 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_a38da1e39a;
architecture behavior of sysgen_relational_a38da1e39a
is
  signal a_1_31: unsigned((5 - 1) downto 0);
  signal b_1_34: unsigned((5 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_bitbasher_e7970768b1 is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    m1 : out std_logic_vector((1 - 1) downto 0);
    m2 : out std_logic_vector((2 - 1) downto 0);
    iqaddress : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_bitbasher_e7970768b1;
architecture behavior of sysgen_bitbasher_e7970768b1
is
  signal a_1_40: unsigned((10 - 1) downto 0);
  signal slice_5_39: unsigned((1 - 1) downto 0);
  signal concat_5_30: unsigned((1 - 1) downto 0);
  signal fullm1_5_1_concat: unsigned((1 - 1) downto 0);
  signal slice_6_29: unsigned((2 - 1) downto 0);
  signal fullm2_6_1_concat: unsigned((2 - 1) downto 0);
  signal slice_7_46: unsigned((1 - 1) downto 0);
  signal concat_7_37: unsigned((1 - 1) downto 0);
  signal fulliqaddress_7_1_concat: unsigned((1 - 1) downto 0);
begin
  a_1_40 <= std_logic_vector_to_unsigned(a);
  slice_5_39 <= u2u_slice(a_1_40, 0, 0);
  concat_5_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_39));
  fullm1_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_5_30));
  slice_6_29 <= u2u_slice(a_1_40, 2, 1);
  fullm2_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_29));
  slice_7_46 <= u2u_slice(a_1_40, 3, 3);
  concat_7_37 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_7_46));
  fulliqaddress_7_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_7_37));
  m1 <= unsigned_to_std_logic_vector(fullm1_5_1_concat);
  m2 <= unsigned_to_std_logic_vector(fullm2_6_1_concat);
  iqaddress <= unsigned_to_std_logic_vector(fulliqaddress_7_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_bitbasher_a4c48cb4c6 is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    latchi : out std_logic_vector((1 - 1) downto 0);
    latchq : out std_logic_vector((1 - 1) downto 0);
    latchdemod : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_bitbasher_a4c48cb4c6;
architecture behavior of sysgen_bitbasher_a4c48cb4c6
is
  signal a_1_49: unsigned((10 - 1) downto 0);
  signal slice_5_43: unsigned((1 - 1) downto 0);
  signal concat_5_34: unsigned((1 - 1) downto 0);
  signal fulllatchi_5_1_concat: unsigned((1 - 1) downto 0);
  signal slice_6_43: unsigned((1 - 1) downto 0);
  signal concat_6_34: unsigned((1 - 1) downto 0);
  signal fulllatchq_6_1_concat: unsigned((1 - 1) downto 0);
  signal slice_7_47: unsigned((1 - 1) downto 0);
  signal concat_7_38: unsigned((1 - 1) downto 0);
  signal fulllatchdemod_7_1_concat: unsigned((1 - 1) downto 0);
begin
  a_1_49 <= std_logic_vector_to_unsigned(a);
  slice_5_43 <= u2u_slice(a_1_49, 4, 4);
  concat_5_34 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_43));
  fulllatchi_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_5_34));
  slice_6_43 <= u2u_slice(a_1_49, 5, 5);
  concat_6_34 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_43));
  fulllatchq_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_6_34));
  slice_7_47 <= u2u_slice(a_1_49, 6, 6);
  concat_7_38 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_7_47));
  fulllatchdemod_7_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_7_38));
  latchi <= unsigned_to_std_logic_vector(fulllatchi_5_1_concat);
  latchq <= unsigned_to_std_logic_vector(fulllatchq_6_1_concat);
  latchdemod <= unsigned_to_std_logic_vector(fulllatchdemod_7_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_bitbasher_e5b9bd11ba is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    accu : out std_logic_vector((1 - 1) downto 0);
    increment : out std_logic_vector((1 - 1) downto 0);
    iqadd_sub : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_bitbasher_e5b9bd11ba;
architecture behavior of sysgen_bitbasher_e5b9bd11ba
is
  signal a_1_49: unsigned((10 - 1) downto 0);
  signal slice_5_41: unsigned((1 - 1) downto 0);
  signal concat_5_32: unsigned((1 - 1) downto 0);
  signal fullaccu_5_1_concat: unsigned((1 - 1) downto 0);
  signal slice_6_46: unsigned((1 - 1) downto 0);
  signal concat_6_37: unsigned((1 - 1) downto 0);
  signal fullincrement_6_1_concat: unsigned((1 - 1) downto 0);
  signal slice_7_46: unsigned((1 - 1) downto 0);
  signal concat_7_37: unsigned((1 - 1) downto 0);
  signal fulliqadd_sub_7_1_concat: unsigned((1 - 1) downto 0);
begin
  a_1_49 <= std_logic_vector_to_unsigned(a);
  slice_5_41 <= u2u_slice(a_1_49, 7, 7);
  concat_5_32 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_41));
  fullaccu_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_5_32));
  slice_6_46 <= u2u_slice(a_1_49, 8, 8);
  concat_6_37 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_46));
  fullincrement_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_6_37));
  slice_7_46 <= u2u_slice(a_1_49, 9, 9);
  concat_7_37 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_7_46));
  fulliqadd_sub_7_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_7_37));
  accu <= unsigned_to_std_logic_vector(fullaccu_5_1_concat);
  increment <= unsigned_to_std_logic_vector(fullincrement_6_1_concat);
  iqadd_sub <= unsigned_to_std_logic_vector(fulliqadd_sub_7_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_f7268c511b is
  port (
    b : in std_logic_vector((18 - 1) downto 0);
    rst : in std_logic_vector((1 - 1) downto 0);
    en : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_f7268c511b;
architecture behavior of sysgen_accum_f7268c511b
is
  signal b_17_24: signed((18 - 1) downto 0);
  signal rst_17_27: boolean;
  signal en_17_32: boolean;
  signal accum_reg_39_23_next: signed((25 - 1) downto 0);
  signal accum_reg_39_23: signed((25 - 1) downto 0) := "0000000000000000000000000";
  signal cast_49_22: signed((26 - 1) downto 0);
  signal cast_49_42: signed((26 - 1) downto 0);
  signal accum_reg_49_9_addsub: signed((26 - 1) downto 0);
  signal accum_reg_join_45_1: signed((26 - 1) downto 0);
  signal cast_accum_reg_39_23_next: signed((25 - 1) downto 0);
begin
  b_17_24 <= std_logic_vector_to_signed(b);
  rst_17_27 <= ((rst) = "1");
  en_17_32 <= ((en) = "1");
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        accum_reg_39_23 <= accum_reg_39_23_next;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  cast_49_22 <= s2s_cast(accum_reg_39_23, 17, 26, 17);
  cast_49_42 <= s2s_cast(b_17_24, 17, 26, 17);
  accum_reg_49_9_addsub <= cast_49_22 + cast_49_42;
  proc_if_45_1: process (accum_reg_39_23, accum_reg_49_9_addsub, b_17_24, en_17_32, rst_17_27)
  is
  begin
    if rst_17_27 then
      accum_reg_join_45_1 <= s2s_cast(b_17_24, 17, 26, 17);
    elsif en_17_32 then
      accum_reg_join_45_1 <= accum_reg_49_9_addsub;
    else 
      accum_reg_join_45_1 <= s2s_cast(accum_reg_39_23, 17, 26, 17);
    end if;
  end process proc_if_45_1;
  cast_accum_reg_39_23_next <= s2s_cast(accum_reg_join_45_1, 17, 25, 17);
  accum_reg_39_23_next <= cast_accum_reg_39_23_next;
  q <= signed_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_b0a8506b02 is
  port (
    b : in std_logic_vector((18 - 1) downto 0);
    rst : in std_logic_vector((1 - 1) downto 0);
    en : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_b0a8506b02;
architecture behavior of sysgen_accum_b0a8506b02
is
  signal b_17_24: signed((18 - 1) downto 0);
  signal rst_17_27: boolean;
  signal en_17_32: boolean;
  signal accum_reg_39_23: signed((25 - 1) downto 0) := "0000000000000000000000000";
  signal accum_reg_39_23_rst: std_logic;
  signal accum_reg_39_23_en: std_logic;
  signal cast_49_42: signed((25 - 1) downto 0);
  signal accum_reg_join_45_1: signed((26 - 1) downto 0);
  signal accum_reg_join_45_1_en: std_logic;
  signal accum_reg_join_45_1_rst: std_logic;
begin
  b_17_24 <= std_logic_vector_to_signed(b);
  rst_17_27 <= ((rst) = "1");
  en_17_32 <= ((en) = "1");
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (accum_reg_39_23_rst = '1')) then
        accum_reg_39_23 <= "0000000000000000000000000";
      elsif ((ce = '1') and (accum_reg_39_23_en = '1')) then 
        accum_reg_39_23 <= accum_reg_39_23 + cast_49_42;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  cast_49_42 <= s2s_cast(b_17_24, 17, 25, 17);
  proc_if_45_1: process (accum_reg_39_23, cast_49_42, en_17_32, rst_17_27)
  is
  begin
    if rst_17_27 then
      accum_reg_join_45_1_rst <= '1';
    elsif en_17_32 then
      accum_reg_join_45_1_rst <= '0';
    else 
      accum_reg_join_45_1_rst <= '0';
    end if;
    if en_17_32 then
      accum_reg_join_45_1_en <= '1';
    else 
      accum_reg_join_45_1_en <= '0';
    end if;
  end process proc_if_45_1;
  accum_reg_39_23_rst <= accum_reg_join_45_1_rst;
  accum_reg_39_23_en <= accum_reg_join_45_1_en;
  q <= signed_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_a3235e36b1 is
  port (
    op : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_a3235e36b1;
architecture behavior of sysgen_constant_a3235e36b1
is
begin
  op <= "0000000000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_bd297e968a is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_bd297e968a;
architecture behavior of sysgen_constant_bd297e968a
is
begin
  op <= "01";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_ea7bc0468a is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_ea7bc0468a;
architecture behavior of sysgen_logical_ea7bc0468a
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 xor d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_78005b416f is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((25 - 1) downto 0);
    d1 : in std_logic_vector((25 - 1) downto 0);
    d2 : in std_logic_vector((25 - 1) downto 0);
    d3 : in std_logic_vector((25 - 1) downto 0);
    d4 : in std_logic_vector((25 - 1) downto 0);
    d5 : in std_logic_vector((25 - 1) downto 0);
    d6 : in std_logic_vector((25 - 1) downto 0);
    d7 : in std_logic_vector((25 - 1) downto 0);
    y : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_78005b416f;
architecture behavior of sysgen_mux_78005b416f
is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic_vector((25 - 1) downto 0);
  signal d1_1_27: std_logic_vector((25 - 1) downto 0);
  signal d2_1_30: std_logic_vector((25 - 1) downto 0);
  signal d3_1_33: std_logic_vector((25 - 1) downto 0);
  signal d4_1_36: std_logic_vector((25 - 1) downto 0);
  signal d5_1_39: std_logic_vector((25 - 1) downto 0);
  signal d6_1_42: std_logic_vector((25 - 1) downto 0);
  signal d7_1_45: std_logic_vector((25 - 1) downto 0);
  type array_type_pipe_28_22 is array (0 to (1 - 1)) of std_logic_vector((25 - 1) downto 0);
  signal pipe_28_22: array_type_pipe_28_22 := (
    0 => "0000000000000000000000000");
  signal pipe_28_22_front_din: std_logic_vector((25 - 1) downto 0);
  signal pipe_28_22_back: std_logic_vector((25 - 1) downto 0);
  signal pipe_28_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((25 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  pipe_28_22_back <= pipe_28_22(0);
  proc_pipe_28_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_28_22_push_front_pop_back_en = '1')) then
        pipe_28_22(0) <= pipe_28_22_front_din;
      end if;
    end if;
  end process proc_pipe_28_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when "100" =>
        unregy_join_6_1 <= d4_1_36;
      when "101" =>
        unregy_join_6_1 <= d5_1_39;
      when "110" =>
        unregy_join_6_1 <= d6_1_42;
      when others =>
        unregy_join_6_1 <= d7_1_45;
    end case;
  end process proc_switch_6_1;
  pipe_28_22_front_din <= unregy_join_6_1;
  pipe_28_22_push_front_pop_back_en <= '1';
  y <= pipe_28_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_bitbasher_98fbdd9c51 is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b0 : out std_logic_vector((1 - 1) downto 0);
    b1 : out std_logic_vector((1 - 1) downto 0);
    b2 : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_bitbasher_98fbdd9c51;
architecture behavior of sysgen_bitbasher_98fbdd9c51
is
  signal a_1_33: unsigned((8 - 1) downto 0);
  signal slice_5_39: unsigned((1 - 1) downto 0);
  signal concat_5_30: unsigned((1 - 1) downto 0);
  signal fullb0_5_1_concat: unsigned((1 - 1) downto 0);
  signal slice_6_39: unsigned((1 - 1) downto 0);
  signal concat_6_30: unsigned((1 - 1) downto 0);
  signal fullb1_6_1_concat: unsigned((1 - 1) downto 0);
  signal slice_7_39: unsigned((1 - 1) downto 0);
  signal concat_7_30: unsigned((1 - 1) downto 0);
  signal fullb2_7_1_concat: unsigned((1 - 1) downto 0);
begin
  a_1_33 <= std_logic_vector_to_unsigned(a);
  slice_5_39 <= u2u_slice(a_1_33, 0, 0);
  concat_5_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_39));
  fullb0_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_5_30));
  slice_6_39 <= u2u_slice(a_1_33, 1, 1);
  concat_6_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_39));
  fullb1_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_6_30));
  slice_7_39 <= u2u_slice(a_1_33, 2, 2);
  concat_7_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_7_39));
  fullb2_7_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_7_30));
  b0 <= unsigned_to_std_logic_vector(fullb0_5_1_concat);
  b1 <= unsigned_to_std_logic_vector(fullb1_6_1_concat);
  b2 <= unsigned_to_std_logic_vector(fullb2_7_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_bitbasher_3d92772749 is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b3 : out std_logic_vector((1 - 1) downto 0);
    b4 : out std_logic_vector((1 - 1) downto 0);
    b5 : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_bitbasher_3d92772749;
architecture behavior of sysgen_bitbasher_3d92772749
is
  signal a_1_33: unsigned((8 - 1) downto 0);
  signal slice_5_39: unsigned((1 - 1) downto 0);
  signal concat_5_30: unsigned((1 - 1) downto 0);
  signal fullb3_5_1_concat: unsigned((1 - 1) downto 0);
  signal slice_6_39: unsigned((1 - 1) downto 0);
  signal concat_6_30: unsigned((1 - 1) downto 0);
  signal fullb4_6_1_concat: unsigned((1 - 1) downto 0);
  signal slice_7_39: unsigned((1 - 1) downto 0);
  signal concat_7_30: unsigned((1 - 1) downto 0);
  signal fullb5_7_1_concat: unsigned((1 - 1) downto 0);
begin
  a_1_33 <= std_logic_vector_to_unsigned(a);
  slice_5_39 <= u2u_slice(a_1_33, 3, 3);
  concat_5_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_39));
  fullb3_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_5_30));
  slice_6_39 <= u2u_slice(a_1_33, 4, 4);
  concat_6_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_39));
  fullb4_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_6_30));
  slice_7_39 <= u2u_slice(a_1_33, 5, 5);
  concat_7_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_7_39));
  fullb5_7_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_7_30));
  b3 <= unsigned_to_std_logic_vector(fullb3_5_1_concat);
  b4 <= unsigned_to_std_logic_vector(fullb4_6_1_concat);
  b5 <= unsigned_to_std_logic_vector(fullb5_7_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_bitbasher_9a1c468a02 is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b6 : out std_logic_vector((1 - 1) downto 0);
    b7 : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_bitbasher_9a1c468a02;
architecture behavior of sysgen_bitbasher_9a1c468a02
is
  signal a_1_30: unsigned((8 - 1) downto 0);
  signal slice_5_39: unsigned((1 - 1) downto 0);
  signal concat_5_30: unsigned((1 - 1) downto 0);
  signal fullb6_5_1_concat: unsigned((1 - 1) downto 0);
  signal slice_6_39: unsigned((1 - 1) downto 0);
  signal concat_6_30: unsigned((1 - 1) downto 0);
  signal fullb7_6_1_concat: unsigned((1 - 1) downto 0);
begin
  a_1_30 <= std_logic_vector_to_unsigned(a);
  slice_5_39 <= u2u_slice(a_1_30, 6, 6);
  concat_5_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_39));
  fullb6_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_5_30));
  slice_6_39 <= u2u_slice(a_1_30, 7, 7);
  concat_6_30 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_39));
  fullb7_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_6_30));
  b6 <= unsigned_to_std_logic_vector(fullb6_5_1_concat);
  b7 <= unsigned_to_std_logic_vector(fullb7_6_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_71869bf5c6 is
  port (
    a : in std_logic_vector((6 - 1) downto 0);
    b : in std_logic_vector((6 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_71869bf5c6;
architecture behavior of sysgen_relational_71869bf5c6
is
  signal a_1_31: unsigned((6 - 1) downto 0);
  signal b_1_34: unsigned((6 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_30cbfc2d25 is
  port (
    in0 : in std_logic_vector((7 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_30cbfc2d25;
architecture behavior of sysgen_concat_30cbfc2d25
is
  signal in0_1_23: unsigned((7 - 1) downto 0);
  signal in1_1_27: boolean;
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= ((in1) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & boolean_to_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_7f14361dbf is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_7f14361dbf;
architecture behavior of sysgen_constant_7f14361dbf
is
begin
  op <= "0111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_41c8cd19f6 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_41c8cd19f6;
architecture behavior of sysgen_logical_41c8cd19f6
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (3 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    '0',
    '0',
    '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(2);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        for i in 2 downto 1 loop 
          latency_pipe_5_26(i) <= latency_pipe_5_26(i-1);
        end loop;
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_4dadff0a56 is
  port (
    sel : in std_logic_vector((4 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    d2 : in std_logic_vector((8 - 1) downto 0);
    d3 : in std_logic_vector((8 - 1) downto 0);
    d4 : in std_logic_vector((8 - 1) downto 0);
    d5 : in std_logic_vector((8 - 1) downto 0);
    d6 : in std_logic_vector((8 - 1) downto 0);
    d7 : in std_logic_vector((8 - 1) downto 0);
    d8 : in std_logic_vector((8 - 1) downto 0);
    d9 : in std_logic_vector((8 - 1) downto 0);
    d10 : in std_logic_vector((8 - 1) downto 0);
    d11 : in std_logic_vector((8 - 1) downto 0);
    d12 : in std_logic_vector((8 - 1) downto 0);
    d13 : in std_logic_vector((8 - 1) downto 0);
    d14 : in std_logic_vector((8 - 1) downto 0);
    d15 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_4dadff0a56;
architecture behavior of sysgen_mux_4dadff0a56
is
  signal sel_1_20: std_logic_vector((4 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal d2_1_30: std_logic_vector((8 - 1) downto 0);
  signal d3_1_33: std_logic_vector((8 - 1) downto 0);
  signal d4_1_36: std_logic_vector((8 - 1) downto 0);
  signal d5_1_39: std_logic_vector((8 - 1) downto 0);
  signal d6_1_42: std_logic_vector((8 - 1) downto 0);
  signal d7_1_45: std_logic_vector((8 - 1) downto 0);
  signal d8_1_48: std_logic_vector((8 - 1) downto 0);
  signal d9_1_51: std_logic_vector((8 - 1) downto 0);
  signal d10_1_54: std_logic_vector((8 - 1) downto 0);
  signal d11_1_58: std_logic_vector((8 - 1) downto 0);
  signal d12_1_62: std_logic_vector((8 - 1) downto 0);
  signal d13_1_66: std_logic_vector((8 - 1) downto 0);
  signal d14_1_70: std_logic_vector((8 - 1) downto 0);
  signal d15_1_74: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_44_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_44_22: array_type_pipe_44_22 := (
    0 => "00000000");
  signal pipe_44_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_44_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_44_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  d8_1_48 <= d8;
  d9_1_51 <= d9;
  d10_1_54 <= d10;
  d11_1_58 <= d11;
  d12_1_62 <= d12;
  d13_1_66 <= d13;
  d14_1_70 <= d14;
  d15_1_74 <= d15;
  pipe_44_22_back <= pipe_44_22(0);
  proc_pipe_44_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_44_22_push_front_pop_back_en = '1')) then
        pipe_44_22(0) <= pipe_44_22_front_din;
      end if;
    end if;
  end process proc_pipe_44_22;
  proc_switch_6_1: process (d0_1_24, d10_1_54, d11_1_58, d12_1_62, d13_1_66, d14_1_70, d15_1_74, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, d8_1_48, d9_1_51, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0000" =>
        unregy_join_6_1 <= d0_1_24;
      when "0001" =>
        unregy_join_6_1 <= d1_1_27;
      when "0010" =>
        unregy_join_6_1 <= d2_1_30;
      when "0011" =>
        unregy_join_6_1 <= d3_1_33;
      when "0100" =>
        unregy_join_6_1 <= d4_1_36;
      when "0101" =>
        unregy_join_6_1 <= d5_1_39;
      when "0110" =>
        unregy_join_6_1 <= d6_1_42;
      when "0111" =>
        unregy_join_6_1 <= d7_1_45;
      when "1000" =>
        unregy_join_6_1 <= d8_1_48;
      when "1001" =>
        unregy_join_6_1 <= d9_1_51;
      when "1010" =>
        unregy_join_6_1 <= d10_1_54;
      when "1011" =>
        unregy_join_6_1 <= d11_1_58;
      when "1100" =>
        unregy_join_6_1 <= d12_1_62;
      when "1101" =>
        unregy_join_6_1 <= d13_1_66;
      when "1110" =>
        unregy_join_6_1 <= d14_1_70;
      when others =>
        unregy_join_6_1 <= d15_1_74;
    end case;
  end process proc_switch_6_1;
  pipe_44_22_front_din <= unregy_join_6_1;
  pipe_44_22_push_front_pop_back_en <= '1';
  y <= pipe_44_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_e71d3c6531 is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_e71d3c6531;
architecture behavior of sysgen_relational_e71d3c6531
is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_counter_0d564c4081 is
  port (
    en : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_counter_0d564c4081;
architecture behavior of sysgen_counter_0d564c4081
is
  signal en_1_45: boolean;
  signal count_reg_20_23: unsigned((1 - 1) downto 0) := "0";
  signal count_reg_20_23_en: std_logic;
  signal count_reg_join_44_1: unsigned((2 - 1) downto 0);
  signal count_reg_join_44_1_en: std_logic;
begin
  en_1_45 <= ((en) = "1");
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (count_reg_20_23_en = '1')) then
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("1");
      end if;
    end if;
  end process proc_count_reg_20_23;
  proc_if_44_1: process (count_reg_20_23, en_1_45)
  is
  begin
    if en_1_45 then
      count_reg_join_44_1_en <= '1';
    else 
      count_reg_join_44_1_en <= '0';
    end if;
  end process proc_if_44_1;
  count_reg_20_23_en <= count_reg_join_44_1_en;
  op <= unsigned_to_std_logic_vector(count_reg_20_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_e7217667d7 is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_e7217667d7;
architecture behavior of sysgen_relational_e7217667d7
is
  signal a_1_31: unsigned((8 - 1) downto 0);
  signal b_1_34: unsigned((8 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_16_3_rel <= a_1_31 < b_1_34;
  op_mem_37_22_front_din <= result_16_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_de33fa5c1a is
  port (
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((7 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_de33fa5c1a;
architecture behavior of sysgen_relational_de33fa5c1a
is
  signal a_1_31: signed((9 - 1) downto 0);
  signal b_1_34: unsigned((7 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal cast_18_16: signed((9 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  cast_18_16 <= u2s_cast(b_1_34, 0, 9, 0);
  result_18_3_rel <= a_1_31 > cast_18_16;
  op_mem_37_22_front_din <= result_18_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_938b6a704d is
  port (
    input_port : in std_logic_vector((8 - 1) downto 0);
    output_port : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_938b6a704d;
architecture behavior of sysgen_reinterpret_938b6a704d
is
  signal input_port_1_40: unsigned((8 - 1) downto 0);
  signal output_port_5_5_force: signed((8 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_98f9db0373 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_98f9db0373;
architecture behavior of sysgen_concat_98f9db0373
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_cd0d06caf2 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((7 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_cd0d06caf2;
architecture behavior of sysgen_concat_cd0d06caf2
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((7 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_fff4f158ea is
  port (
    b : in std_logic_vector((8 - 1) downto 0);
    rst : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_fff4f158ea;
architecture behavior of sysgen_accum_fff4f158ea
is
  signal b_17_24: unsigned((8 - 1) downto 0);
  signal rst_17_27: boolean;
  signal accum_reg_39_23: unsigned((19 - 1) downto 0) := "0000000000000000000";
  signal accum_reg_39_23_rst: std_logic;
  signal cast_49_42: unsigned((19 - 1) downto 0);
  signal accum_reg_join_45_1: unsigned((20 - 1) downto 0);
  signal accum_reg_join_45_1_rst: std_logic;
begin
  b_17_24 <= std_logic_vector_to_unsigned(b);
  rst_17_27 <= ((rst) = "1");
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (accum_reg_39_23_rst = '1')) then
        accum_reg_39_23 <= "0000000000000000000";
      elsif (ce = '1') then 
        accum_reg_39_23 <= accum_reg_39_23 + cast_49_42;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  cast_49_42 <= u2u_cast(b_17_24, 0, 19, 0);
  proc_if_45_1: process (accum_reg_39_23, cast_49_42, rst_17_27)
  is
  begin
    if rst_17_27 then
      accum_reg_join_45_1_rst <= '1';
    else 
      accum_reg_join_45_1_rst <= '0';
    end if;
  end process proc_if_45_1;
  accum_reg_39_23_rst <= accum_reg_join_45_1_rst;
  q <= unsigned_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_7898937da8 is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_7898937da8;
architecture behavior of sysgen_concat_7898937da8
is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((17 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_7f250806b7 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((7 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_7f250806b7;
architecture behavior of sysgen_concat_7f250806b7
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((7 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_1315fc97a9 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_1315fc97a9;
architecture behavior of sysgen_constant_1315fc97a9
is
begin
  op <= "00101000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_f48e67331f is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_f48e67331f;
architecture behavior of sysgen_logical_f48e67331f
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal bit_2_27: std_logic;
  signal fully_2_1_bitnot: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  bit_2_27 <= d0_1_24 and d1_1_27;
  fully_2_1_bitnot <= not bit_2_27;
  latency_pipe_5_26_front_din <= fully_2_1_bitnot;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_05a9e9736c is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_05a9e9736c;
architecture behavior of sysgen_mux_05a9e9736c
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= std_logic_to_vector(unregy_join_6_1);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_6bc94263f5 is
  port (
    b : in std_logic_vector((16 - 1) downto 0);
    q : out std_logic_vector((21 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_6bc94263f5;
architecture behavior of sysgen_accum_6bc94263f5
is
  signal b_17_24: unsigned((16 - 1) downto 0);
  signal accum_reg_39_23: unsigned((21 - 1) downto 0) := "000000000000000000000";
  signal cast_49_42: unsigned((21 - 1) downto 0);
begin
  b_17_24 <= std_logic_vector_to_unsigned(b);
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        accum_reg_39_23 <= accum_reg_39_23 + cast_49_42;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  cast_49_42 <= u2u_cast(b_17_24, 0, 21, 0);
  q <= unsigned_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_1346821100 is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_1346821100;
architecture behavior of sysgen_relational_1346821100
is
  signal a_1_31: unsigned((16 - 1) downto 0);
  signal b_1_34: signed((16 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal cast_18_12: signed((17 - 1) downto 0);
  signal cast_18_16: signed((17 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  cast_18_12 <= u2s_cast(a_1_31, 0, 17, 0);
  cast_18_16 <= s2s_cast(b_1_34, 0, 17, 0);
  result_18_3_rel <= cast_18_12 > cast_18_16;
  op_mem_37_22_front_din <= result_18_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_58583f9b7b is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_58583f9b7b;
architecture behavior of sysgen_relational_58583f9b7b
is
  signal a_1_31: signed((16 - 1) downto 0);
  signal b_1_34: signed((18 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal cast_18_12: signed((18 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  cast_18_12 <= s2s_cast(a_1_31, 0, 18, 0);
  result_18_3_rel <= cast_18_12 > b_1_34;
  op_mem_37_22_front_din <= result_18_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_0d27e87d86 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((13 - 1) downto 0);
    y : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_0d27e87d86;
architecture behavior of sysgen_concat_0d27e87d86
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((13 - 1) downto 0);
  signal y_2_1_concat: unsigned((14 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_f948f4cbc9 is
  port (
    op : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_f948f4cbc9;
architecture behavior of sysgen_constant_f948f4cbc9
is
begin
  op <= "0001001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_74a583781e is
  port (
    op : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_74a583781e;
architecture behavior of sysgen_constant_74a583781e
is
begin
  op <= "0110111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_23d9ca36d1 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    d2 : in std_logic_vector((16 - 1) downto 0);
    d3 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_23d9ca36d1;
architecture behavior of sysgen_mux_23d9ca36d1
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal d2_1_30: std_logic_vector((16 - 1) downto 0);
  signal d3_1_33: std_logic_vector((16 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_2ff909d7aa is
  port (
    a : in std_logic_vector((7 - 1) downto 0);
    b : in std_logic_vector((7 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_2ff909d7aa;
architecture behavior of sysgen_relational_2ff909d7aa
is
  signal a_1_31: unsigned((7 - 1) downto 0);
  signal b_1_34: unsigned((7 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_18_3_rel <= a_1_31 > b_1_34;
  op_mem_37_22_front_din <= result_18_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_b71d0844b7 is
  port (
    a : in std_logic_vector((7 - 1) downto 0);
    b : in std_logic_vector((7 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_b71d0844b7;
architecture behavior of sysgen_relational_b71d0844b7
is
  signal a_1_31: unsigned((7 - 1) downto 0);
  signal b_1_34: unsigned((7 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_20_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_20_3_rel <= a_1_31 <= b_1_34;
  op_mem_37_22_front_din <= result_20_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_fabffae51a is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_fabffae51a;
architecture behavior of sysgen_mux_fabffae51a
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_c91082eec8 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_c91082eec8;
architecture behavior of sysgen_constant_c91082eec8
is
begin
  op <= "1111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_35db827390 is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_35db827390;
architecture behavior of sysgen_relational_35db827390
is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_1f8b1fd4c6 is
  port (
    in0 : in std_logic_vector((5 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_1f8b1fd4c6;
architecture behavior of sysgen_concat_1f8b1fd4c6
is
  signal in0_1_23: unsigned((5 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_2f79518f68 is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    d2 : in std_logic_vector((8 - 1) downto 0);
    d3 : in std_logic_vector((8 - 1) downto 0);
    d4 : in std_logic_vector((8 - 1) downto 0);
    d5 : in std_logic_vector((8 - 1) downto 0);
    d6 : in std_logic_vector((8 - 1) downto 0);
    d7 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_2f79518f68;
architecture behavior of sysgen_mux_2f79518f68
is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal d2_1_30: std_logic_vector((8 - 1) downto 0);
  signal d3_1_33: std_logic_vector((8 - 1) downto 0);
  signal d4_1_36: std_logic_vector((8 - 1) downto 0);
  signal d5_1_39: std_logic_vector((8 - 1) downto 0);
  signal d6_1_42: std_logic_vector((8 - 1) downto 0);
  signal d7_1_45: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_28_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_28_22: array_type_pipe_28_22 := (
    0 => "00000000");
  signal pipe_28_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_28_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_28_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  pipe_28_22_back <= pipe_28_22(0);
  proc_pipe_28_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_28_22_push_front_pop_back_en = '1')) then
        pipe_28_22(0) <= pipe_28_22_front_din;
      end if;
    end if;
  end process proc_pipe_28_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when "100" =>
        unregy_join_6_1 <= d4_1_36;
      when "101" =>
        unregy_join_6_1 <= d5_1_39;
      when "110" =>
        unregy_join_6_1 <= d6_1_42;
      when others =>
        unregy_join_6_1 <= d7_1_45;
    end case;
  end process proc_switch_6_1;
  pipe_28_22_front_din <= unregy_join_6_1;
  pipe_28_22_push_front_pop_back_en <= '1';
  y <= pipe_28_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_57d1d7f0b4 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((3 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    in5 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_57d1d7f0b4;
architecture behavior of sysgen_concat_57d1d7f0b4
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((3 - 1) downto 0);
  signal in4_1_39: boolean;
  signal in5_1_43: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= ((in4) = "1");
  in5_1_43 <= std_logic_vector_to_unsigned(in5);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & boolean_to_vector(in4_1_39) & unsigned_to_std_logic_vector(in5_1_43));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_69e08b2947 is
  port (
    in0 : in std_logic_vector((6 - 1) downto 0);
    in1 : in std_logic_vector((6 - 1) downto 0);
    in2 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_69e08b2947;
architecture behavior of sysgen_concat_69e08b2947
is
  signal in0_1_23: unsigned((6 - 1) downto 0);
  signal in1_1_27: unsigned((6 - 1) downto 0);
  signal in2_1_31: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((18 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_04b2251023 is
  port (
    in0 : in std_logic_vector((3 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_04b2251023;
architecture behavior of sysgen_concat_04b2251023
is
  signal in0_1_23: unsigned((3 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((11 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_87a7c4caa7 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_87a7c4caa7;
architecture behavior of sysgen_constant_87a7c4caa7
is
begin
  op <= "0001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_ed3ca9b237 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_ed3ca9b237;
architecture behavior of sysgen_constant_ed3ca9b237
is
begin
  op <= "0011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_afbe4cb741 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_afbe4cb741;
architecture behavior of sysgen_constant_afbe4cb741
is
begin
  op <= "0010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_542a2e0340 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_542a2e0340;
architecture behavior of sysgen_constant_542a2e0340
is
begin
  op <= "0101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_4224fbce52 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_4224fbce52;
architecture behavior of sysgen_constant_4224fbce52
is
begin
  op <= "0110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_d04e2b4d34 is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_d04e2b4d34;
architecture behavior of sysgen_constant_d04e2b4d34
is
begin
  op <= "1001";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_c22280d55e is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_c22280d55e;
architecture behavior of sysgen_constant_c22280d55e
is
begin
  op <= "1010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_871ea0e105 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_871ea0e105;
architecture behavior of sysgen_logical_871ea0e105
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal d2_1_30: std_logic_vector((1 - 1) downto 0);
  signal d3_1_33: std_logic_vector((1 - 1) downto 0);
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => "0");
  signal latency_pipe_5_26_front_din: std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26_back: std_logic_vector((1 - 1) downto 0);
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal bit_2_26: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bitnot: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  bit_2_26 <= d0_1_24 or d1_1_27 or d2_1_30 or d3_1_33;
  fully_2_1_bitnot <= not bit_2_26;
  latency_pipe_5_26_front_din <= fully_2_1_bitnot;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= latency_pipe_5_26_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity n3z_tonetest_axi_lite_interface is 
    port(
        values2recover : out std_logic_vector(31 downto 0);
        n3zconfig : out std_logic_vector(31 downto 0);
        audiovolume : out std_logic_vector(8 downto 0);
        adcgain_ave_peak : in std_logic_vector(19 downto 0);
        plstatus : in std_logic_vector(31 downto 0);
        starttoneamp : in std_logic_vector(7 downto 0);
        demodsignallevel : in std_logic_vector(31 downto 0);
        txaudiolevel : in std_logic_vector(15 downto 0);
        clk : out std_logic;
        n3z_tonetest_aclk : in std_logic;
        n3z_tonetest_aresetn : in std_logic;
        n3z_tonetest_s_axi_awaddr : in std_logic_vector(5-1 downto 0);
        n3z_tonetest_s_axi_awvalid : in std_logic;
        n3z_tonetest_s_axi_awready : out std_logic;
        n3z_tonetest_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        n3z_tonetest_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        n3z_tonetest_s_axi_wvalid : in std_logic;
        n3z_tonetest_s_axi_wready : out std_logic;
        n3z_tonetest_s_axi_bresp : out std_logic_vector(1 downto 0);
        n3z_tonetest_s_axi_bvalid : out std_logic;
        n3z_tonetest_s_axi_bready : in std_logic;
        n3z_tonetest_s_axi_araddr : in std_logic_vector(5-1 downto 0);
        n3z_tonetest_s_axi_arvalid : in std_logic;
        n3z_tonetest_s_axi_arready : out std_logic;
        n3z_tonetest_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        n3z_tonetest_s_axi_rresp : out std_logic_vector(1 downto 0);
        n3z_tonetest_s_axi_rvalid : out std_logic;
        n3z_tonetest_s_axi_rready : in std_logic
    );
end n3z_tonetest_axi_lite_interface;
architecture structural of n3z_tonetest_axi_lite_interface is 
component n3z_tonetest_axi_lite_interface_verilog is
    port(
        values2recover : out std_logic_vector(31 downto 0);
        n3zconfig : out std_logic_vector(31 downto 0);
        audiovolume : out std_logic_vector(8 downto 0);
        adcgain_ave_peak : in std_logic_vector(19 downto 0);
        plstatus : in std_logic_vector(31 downto 0);
        starttoneamp : in std_logic_vector(7 downto 0);
        demodsignallevel : in std_logic_vector(31 downto 0);
        txaudiolevel : in std_logic_vector(15 downto 0);
        clk : out std_logic;
        n3z_tonetest_aclk : in std_logic;
        n3z_tonetest_aresetn : in std_logic;
        n3z_tonetest_s_axi_awaddr : in std_logic_vector(5-1 downto 0);
        n3z_tonetest_s_axi_awvalid : in std_logic;
        n3z_tonetest_s_axi_awready : out std_logic;
        n3z_tonetest_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        n3z_tonetest_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        n3z_tonetest_s_axi_wvalid : in std_logic;
        n3z_tonetest_s_axi_wready : out std_logic;
        n3z_tonetest_s_axi_bresp : out std_logic_vector(1 downto 0);
        n3z_tonetest_s_axi_bvalid : out std_logic;
        n3z_tonetest_s_axi_bready : in std_logic;
        n3z_tonetest_s_axi_araddr : in std_logic_vector(5-1 downto 0);
        n3z_tonetest_s_axi_arvalid : in std_logic;
        n3z_tonetest_s_axi_arready : out std_logic;
        n3z_tonetest_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        n3z_tonetest_s_axi_rresp : out std_logic_vector(1 downto 0);
        n3z_tonetest_s_axi_rvalid : out std_logic;
        n3z_tonetest_s_axi_rready : in std_logic
    );
end component;
begin
inst : n3z_tonetest_axi_lite_interface_verilog
    port map(
    values2recover => values2recover,
    n3zconfig => n3zconfig,
    audiovolume => audiovolume,
    adcgain_ave_peak => adcgain_ave_peak,
    plstatus => plstatus,
    starttoneamp => starttoneamp,
    demodsignallevel => demodsignallevel,
    txaudiolevel => txaudiolevel,
    clk => clk,
    n3z_tonetest_aclk => n3z_tonetest_aclk,
    n3z_tonetest_aresetn => n3z_tonetest_aresetn,
    n3z_tonetest_s_axi_awaddr => n3z_tonetest_s_axi_awaddr,
    n3z_tonetest_s_axi_awvalid => n3z_tonetest_s_axi_awvalid,
    n3z_tonetest_s_axi_awready => n3z_tonetest_s_axi_awready,
    n3z_tonetest_s_axi_wdata => n3z_tonetest_s_axi_wdata,
    n3z_tonetest_s_axi_wstrb => n3z_tonetest_s_axi_wstrb,
    n3z_tonetest_s_axi_wvalid => n3z_tonetest_s_axi_wvalid,
    n3z_tonetest_s_axi_wready => n3z_tonetest_s_axi_wready,
    n3z_tonetest_s_axi_bresp => n3z_tonetest_s_axi_bresp,
    n3z_tonetest_s_axi_bvalid => n3z_tonetest_s_axi_bvalid,
    n3z_tonetest_s_axi_bready => n3z_tonetest_s_axi_bready,
    n3z_tonetest_s_axi_araddr => n3z_tonetest_s_axi_araddr,
    n3z_tonetest_s_axi_arvalid => n3z_tonetest_s_axi_arvalid,
    n3z_tonetest_s_axi_arready => n3z_tonetest_s_axi_arready,
    n3z_tonetest_s_axi_rdata => n3z_tonetest_s_axi_rdata,
    n3z_tonetest_s_axi_rresp => n3z_tonetest_s_axi_rresp,
    n3z_tonetest_s_axi_rvalid => n3z_tonetest_s_axi_rvalid,
    n3z_tonetest_s_axi_rready => n3z_tonetest_s_axi_rready
);
end structural;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

-------------------------------------------------------------------
 -- System Generator version 11.1 VHDL source file.
 --
 -- Copyright(C) 2009 by Xilinx, Inc.  All rights reserved.  This
 -- text/file contains proprietary, confidential information of Xilinx,
 -- Inc., is distributed under license from Xilinx, Inc., and may be used,
 -- copied and/or disclosed only pursuant to the terms of a valid license
 -- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
 -- this text/file solely for design, simulation, implementation and
 -- creation of design files limited to Xilinx devices or technologies.
 -- Use with non-Xilinx devices or technologies is expressly prohibited
 -- and immediately terminates your license unless covered by a separate
 -- agreement.
 --
 -- Xilinx is providing this design, code, or information "as is" solely
 -- for use in developing programs and solutions for Xilinx devices.  By
 -- providing this design, code, or information as one possible
 -- implementation of this feature, application or standard, Xilinx is
 -- making no representation that this implementation is free from any
 -- claims of infringement.  You are responsible for obtaining any rights
 -- you may require for your implementation.  Xilinx expressly disclaims
 -- any warranty whatsoever with respect to the adequacy of the
 -- implementation, including but not limited to warranties of
 -- merchantability or fitness for a particular purpose.
 --
 -- Xilinx products are not intended for use in life support appliances,
 -- devices, or systems.  Use in such applications is expressly prohibited.
 --
 -- Any modifications that are made to the source code are done at the user's
 -- sole risk and will be unsupported.
 --
 -- This copyright and support notice must be retained as part of this
 -- text at all times.  (c) Copyright 1995-2009 Xilinx, Inc.  All rights
 -- reserved.
 -------------------------------------------------------------------
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xladdsub is 
   generic (
     core_name0: string := "";
     a_width: integer := 16;
     a_bin_pt: integer := 4;
     a_arith: integer := xlUnsigned;
     c_in_width: integer := 16;
     c_in_bin_pt: integer := 4;
     c_in_arith: integer := xlUnsigned;
     c_out_width: integer := 16;
     c_out_bin_pt: integer := 4;
     c_out_arith: integer := xlUnsigned;
     b_width: integer := 8;
     b_bin_pt: integer := 2;
     b_arith: integer := xlUnsigned;
     s_width: integer := 17;
     s_bin_pt: integer := 4;
     s_arith: integer := xlUnsigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     full_s_width: integer := 17;
     full_s_arith: integer := xlUnsigned;
     mode: integer := xlAddMode;
     extra_registers: integer := 0;
     latency: integer := 0;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     c_latency: integer := 0;
     c_output_width: integer := 17;
     c_has_c_in : integer := 0;
     c_has_c_out : integer := 0
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     b: in std_logic_vector(b_width - 1 downto 0);
     c_in : in std_logic_vector (0 downto 0) := "0";
     ce: in std_logic;
     clr: in std_logic := '0';
     clk: in std_logic;
     rst: in std_logic_vector(rst_width - 1 downto 0) := "0";
     en: in std_logic_vector(en_width - 1 downto 0) := "1";
     c_out : out std_logic_vector (0 downto 0);
     s: out std_logic_vector(s_width - 1 downto 0)
   );
 end n3z_tonetest_xladdsub;
 
 architecture behavior of n3z_tonetest_xladdsub is 
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 
 function format_input(inp: std_logic_vector; old_width, delta, new_arith,
 new_width: integer)
 return std_logic_vector
 is
 variable vec: std_logic_vector(old_width-1 downto 0);
 variable padded_inp: std_logic_vector((old_width + delta)-1 downto 0);
 variable result: std_logic_vector(new_width-1 downto 0);
 begin
 vec := inp;
 if (delta > 0) then
 padded_inp := pad_LSB(vec, old_width+delta);
 result := extend_MSB(padded_inp, new_width, new_arith);
 else
 result := extend_MSB(vec, new_width, new_arith);
 end if;
 return result;
 end;
 
 constant full_s_bin_pt: integer := fractional_bits(a_bin_pt, b_bin_pt);
 constant full_a_width: integer := full_s_width;
 constant full_b_width: integer := full_s_width;
 
 signal full_a: std_logic_vector(full_a_width - 1 downto 0);
 signal full_b: std_logic_vector(full_b_width - 1 downto 0);
 signal core_s: std_logic_vector(full_s_width - 1 downto 0);
 signal conv_s: std_logic_vector(s_width - 1 downto 0);
 signal temp_cout : std_logic;
 signal internal_clr: std_logic;
 signal internal_ce: std_logic;
 signal extra_reg_ce: std_logic;
 signal override: std_logic;
 signal logic1: std_logic_vector(0 downto 0);


 component n3z_tonetest_c_addsub_v12_0_i1
    port ( 
    a: in std_logic_vector(25 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(25 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i3
    port ( 
    a: in std_logic_vector(9 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i5
    port ( 
    a: in std_logic_vector(4 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(4 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i6
    port ( 
    a: in std_logic_vector(4 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(4 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i7
    port ( 
    a: in std_logic_vector(17 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(17 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i11
    port ( 
    a: in std_logic_vector(9 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i12
    port ( 
    a: in std_logic_vector(10 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(10 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i13
    port ( 
    a: in std_logic_vector(11 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(11 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i14
    port ( 
    a: in std_logic_vector(9 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i15
    port ( 
    a: in std_logic_vector(9 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i16
    port ( 
    a: in std_logic_vector(18 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(18 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i17
    port ( 
    a: in std_logic_vector(18 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(18 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i18
    port ( 
    a: in std_logic_vector(18 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(18 - 1 downto 0) 
 		  ); 
 end component;

begin
 internal_clr <= (clr or (rst(0))) and ce;
 internal_ce <= ce and en(0);
 logic1(0) <= '1';
 addsub_process: process (a, b, core_s)
 begin
 full_a <= format_input (a, a_width, b_bin_pt - a_bin_pt, a_arith,
 full_a_width);
 full_b <= format_input (b, b_width, a_bin_pt - b_bin_pt, b_arith,
 full_b_width);
 conv_s <= convert_type (core_s, full_s_width, full_s_bin_pt, full_s_arith,
 s_width, s_bin_pt, s_arith, quantization, overflow);
 end process addsub_process;


 comp0: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i1")) generate 
  core_instance0:n3z_tonetest_c_addsub_v12_0_i1
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i3")) generate 
  core_instance1:n3z_tonetest_c_addsub_v12_0_i3
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i5")) generate 
  core_instance2:n3z_tonetest_c_addsub_v12_0_i5
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp3: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i6")) generate 
  core_instance3:n3z_tonetest_c_addsub_v12_0_i6
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp4: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i7")) generate 
  core_instance4:n3z_tonetest_c_addsub_v12_0_i7
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp5: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i11")) generate 
  core_instance5:n3z_tonetest_c_addsub_v12_0_i11
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp6: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i12")) generate 
  core_instance6:n3z_tonetest_c_addsub_v12_0_i12
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp7: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i13")) generate 
  core_instance7:n3z_tonetest_c_addsub_v12_0_i13
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp8: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i14")) generate 
  core_instance8:n3z_tonetest_c_addsub_v12_0_i14
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp9: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i15")) generate 
  core_instance9:n3z_tonetest_c_addsub_v12_0_i15
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp10: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i16")) generate 
  core_instance10:n3z_tonetest_c_addsub_v12_0_i16
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp11: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i17")) generate 
  core_instance11:n3z_tonetest_c_addsub_v12_0_i17
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp12: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i18")) generate 
  core_instance12:n3z_tonetest_c_addsub_v12_0_i18
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

latency_test: if (extra_registers > 0) generate
 override_test: if (c_latency > 1) generate
 override_pipe: synth_reg
 generic map (
 width => 1,
 latency => c_latency
 )
 port map (
 i => logic1,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o(0) => override);
 extra_reg_ce <= ce and en(0) and override;
 end generate override_test;
 no_override: if ((c_latency = 0) or (c_latency = 1)) generate
 extra_reg_ce <= ce and en(0);
 end generate no_override;
 extra_reg: synth_reg
 generic map (
 width => s_width,
 latency => extra_registers
 )
 port map (
 i => conv_s,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => s
 );
 cout_test: if (c_has_c_out = 1) generate
 c_out_extra_reg: synth_reg
 generic map (
 width => 1,
 latency => extra_registers
 )
 port map (
 i(0) => temp_cout,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => c_out
 );
 end generate cout_test;
 end generate;
 
 latency_s: if ((latency = 0) or (extra_registers = 0)) generate
 s <= conv_s;
 end generate latency_s;
 latency0: if (((latency = 0) or (extra_registers = 0)) and
 (c_has_c_out = 1)) generate
 c_out(0) <= temp_cout;
 end generate latency0;
 tie_dangling_cout: if (c_has_c_out = 0) generate
 c_out <= "0";
 end generate tie_dangling_cout;
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xladdsubmode.vhd
 --
 --  Date          : 10/1/99
 --
 --  Description   : VHDL description of a fixed point addsub block.  This
 --                  block has the option to use a core.
 --
 --  Mod. History  : Moved conversion function before extra register
 --                  stage.
 --                : Fixed ouput width bug with behavioral model.
 --                : Removed valid bit logic from wrapper.
 --
 --  Mod. Dates    : 10/10/01
 --                : 10/13/01
 --                : 8/2/02
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xladdsubmode is 
   generic (
     core_name0: string := "";
     a_width: integer := 16;             -- Width of a input
     a_bin_pt: integer := 4;             -- Binary point of input a
     a_arith: integer := xlUnsigned;     -- Type of arith of a input
     b_width: integer := 8;              -- Width of b input
     b_bin_pt: integer := 2;             -- Binary point of input b
     b_arith: integer := xlUnsigned;     -- Type of arith of b input
     c_in_width: integer := 16;             -- Width of cin input
     c_in_bin_pt: integer := 4;             -- Binary point of input cin
     c_in_arith: integer := xlUnsigned;     -- Type of arith of cin input
     c_out_width: integer := 16;             
     c_out_bin_pt: integer := 4;             
     c_out_arith: integer := xlUnsigned;     
     s_width: integer := 17;             -- Width of s output
     s_bin_pt: integer := 4;             -- Binary point of output s
     s_arith: integer := xlUnsigned;     -- Type of arith of outputi
     rst_width: integer := 1;            -- Width of input rst
     rst_bin_pt: integer := 0;           -- Binary point of input rst
     rst_arith: integer := xlUnsigned;   -- Type of arith of input rst
     en_width: integer := 1;             -- Width of input en
     en_bin_pt: integer := 0;            -- Binary point of input en
     en_arith: integer := xlUnsigned;    -- Type of arith of input en
     padded_width: integer := 16;        -- padded input width
     full_s_width: integer := 17;        --
     full_s_arith: integer := xlUnsigned;-- Type of arith of output
     mode_width: integer := 1;           -- Width of mode input
     mode_bin_pt: integer := 0;          -- Binary point of input mode
     mode_arith: integer := xlUnsigned;  -- Type of arith of mode input
     extra_registers: integer := 0;      -- = latency - c_latency
     latency: integer := 0;              -- Ouput delay clk cycles
     quantization: integer := xlTruncate;-- xlRound or xlTruncate
     overflow: integer := xlWrap;        -- xlSaturate or xlWrap
     c_a_width: integer := 16;           -- core width
     c_b_width: integer := 8;
     c_a_type: integer := 1;             -- 0 = signed, 1 = unsigned
     c_b_type: integer := 1;             -- 0 = signed, 1 = unsigned
     c_has_sclr: integer := 0;           -- 1 = add/sub registered
     c_has_ce: integer := 0;             -- 1 = add/sub registered
     c_latency: integer := 0;            -- 0 = not pipelined, > 1 if pipelined
     c_output_width: integer := 17;
     c_enable_rlocs: integer := 1;
     c_has_c_in  : integer := 0;
     c_has_c_out : integer := 0);
   port (
     a     : in std_logic_vector(a_width - 1 downto 0);
     b     : in std_logic_vector(b_width - 1 downto 0);
     c_in  : in std_logic_vector (0 downto 0) := (others => '0');
     mode  : in std_logic_vector(mode_width - 1 downto 0) := (others => '0'); -- 0 = add, 1 = sub
     ce    : in std_logic;
     clr   : in std_logic := '0';
     clk   : in std_logic;
     rst   : in std_logic_vector(rst_width - 1 downto 0) := (others => '0');
     en    : in std_logic_vector(en_width - 1 downto 0) := (others => '1');
     c_out : out std_logic_vector (0 downto 0);
     s     : out std_logic_vector(s_width - 1 downto 0)
   );
 end n3z_tonetest_xladdsubmode;
 
 architecture behavior of n3z_tonetest_xladdsubmode is
 
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 
 -- Pad LSB with zeros and sign or zero extend inputs
 function format_input(inp: std_logic_vector; old_width, delta, new_arith,
 new_width: integer)
 return std_logic_vector
 is
 variable vec: std_logic_vector(old_width-1 downto 0);
 variable padded_inp: std_logic_vector((old_width + delta)-1 downto 0);
 variable result: std_logic_vector(new_width-1 downto 0);
 begin
 vec := inp;
 
 -- Pad LSB with zeros and sign or zero extend inputs
 if delta > 0 then
 padded_inp := pad_LSB(vec, old_width+delta);
 -- sign or zero extend zero padded input depending on arith type
 result := extend_MSB(padded_inp, new_width, new_arith);
 else
 -- sign or zero extend input depending on arith type
 result := extend_MSB(vec, new_width, new_arith);
 end if;
 return result;
 end;
 
 constant full_s_bin_pt: integer := fractional_bits(a_bin_pt, b_bin_pt);
 constant full_a_width: integer := full_s_width;
 constant full_b_width: integer := full_s_width;
 
 signal full_a: std_logic_vector(full_a_width - 1 downto 0);
 signal full_b: std_logic_vector(full_b_width - 1 downto 0);
 signal full_s: std_logic_vector(full_s_width - 1 downto 0);
 signal core_s: std_logic_vector(full_s_width - 1 downto 0);
 signal conv_s: std_logic_vector(s_width - 1 downto 0);
 signal add: std_logic;
 
 -- synthesis translate_off
 signal real_a, real_b, real_s: real; -- For debugging info ports
 -- synthesis translate_on
 
 signal internal_clr: std_logic;
 signal internal_ce: std_logic;
 signal extra_reg_ce: std_logic;
 signal override: std_logic;
 signal logic1: std_logic_vector(0 downto 0);
 signal temp_cout : std_logic;


 component n3z_tonetest_c_addsub_v12_0_i0
    port ( 
    a: in std_logic_vector(28 - 1 downto 0);
    add: in std_logic;
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(28 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i2
    port ( 
    a: in std_logic_vector(19 - 1 downto 0);
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(19 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i4
    port ( 
    a: in std_logic_vector(26 - 1 downto 0);
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(26 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i8
    port ( 
    a: in std_logic_vector(28 - 1 downto 0);
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(28 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i9
    port ( 
    a: in std_logic_vector(9 - 1 downto 0);
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_addsub_v12_0_i10
    port ( 
    a: in std_logic_vector(15 - 1 downto 0);
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(15 - 1 downto 0) 
 		  ); 
 end component;

begin
 internal_clr <= (clr or (rst(0))) and ce;
 internal_ce <= ce and en(0);
 logic1(0) <= '1';
 
 addsubmode_process: process(a, b, core_s)
 begin
 full_a <= format_input(a, a_width, b_bin_pt - a_bin_pt, a_arith,
 full_a_width);
 full_b <= format_input(b, b_width, a_bin_pt - b_bin_pt, b_arith,
 full_b_width);
 
 -- Convert to output type and do saturation arith.
 conv_s <= convert_type(core_s, full_s_width, full_s_bin_pt, full_s_arith,
 s_width, s_bin_pt, s_arith, quantization, overflow);
 
 -- Debugging info for internal full precision variables
 -- synthesis translate_off
 -- real_a <= to_real(full_a, full_s_bin_pt, a_arith);
 -- real_b <= to_real(full_b, full_s_bin_pt, b_arith);
 -- real_s <= to_real(reg_s, full_s_bin_pt, full_s_arith);
 -- synthesis translate_on
 end process addsubmode_process; -- end addsubmode_process
 
 -- Add pin is oppsite from what the core expects
 add <= not(mode(0));


 comp0: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i0")) generate 
  core_instance0:n3z_tonetest_c_addsub_v12_0_i0
   port map ( 
         a => full_a,
         add => add,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i2")) generate 
  core_instance1:n3z_tonetest_c_addsub_v12_0_i2
   port map ( 
         a => full_a,
         add => add,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i4")) generate 
  core_instance2:n3z_tonetest_c_addsub_v12_0_i4
   port map ( 
         a => full_a,
         add => add,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp3: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i8")) generate 
  core_instance3:n3z_tonetest_c_addsub_v12_0_i8
   port map ( 
         a => full_a,
         add => add,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp4: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i9")) generate 
  core_instance4:n3z_tonetest_c_addsub_v12_0_i9
   port map ( 
         a => full_a,
         add => add,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp5: if ((core_name0 = "n3z_tonetest_c_addsub_v12_0_i10")) generate 
  core_instance5:n3z_tonetest_c_addsub_v12_0_i10
   port map ( 
         a => full_a,
         add => add,
         s => core_s,
         b => full_b
  ); 
   end generate;

latency_test: if (extra_registers > 0) generate
 override_test: if (c_latency > 1) generate
 override_pipe: synth_reg
 generic map (
 width => 1,
 latency => c_latency
 )
 port map (
 i => logic1,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o(0) => override
 );
 extra_reg_ce <= ce and en(0) and override;
 end generate override_test; -- end override_test
 
 no_override: if ((c_latency = 0) or (c_latency = 1)) generate
 extra_reg_ce <= ce and en(0);
 end generate no_override; -- end no_override
 
 extra_reg: synth_reg
 generic map (
 width => s_width,
 latency => extra_registers
 )
 port map (
 i => conv_s,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => s
 );
 
 cout_test : if (c_has_c_out = 1) generate
 c_out_extra_reg: synth_reg
 generic map (
 width => 1,
 latency => extra_registers
 )
 port map (
 i(0) => temp_cout,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => c_out 
 );
 end generate cout_test;
 
 end generate latency_test; -- end latency_test
 
 latency_s: if ((latency = 0) or (extra_registers = 0)) generate
 s <= conv_s;
 end generate latency_s; -- end latency_s
 
 latency0: if (((latency = 0) or (extra_registers = 0)) and 
 (c_has_c_out = 1)) generate
 c_out(0) <= temp_cout;
 end generate latency0; -- end latency0
 
 tie_dangling_cout: if (c_has_c_out = 0) generate
 c_out <= "0";
 end generate tie_dangling_cout;
 
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

-------------------------------------------------------------------
 -- System Generator version 11.1 VHDL source file.
 --
 -- Copyright(C) 2009 by Xilinx, Inc.  All rights reserved.  This
 -- text/file contains proprietary, confidential information of Xilinx,
 -- Inc., is distributed under license from Xilinx, Inc., and may be used,
 -- copied and/or disclosed only pursuant to the terms of a valid license
 -- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
 -- this text/file solely for design, simulation, implementation and
 -- creation of design files limited to Xilinx devices or technologies.
 -- Use with non-Xilinx devices or technologies is expressly prohibited
 -- and immediately terminates your license unless covered by a separate
 -- agreement.
 --
 -- Xilinx is providing this design, code, or information "as is" solely
 -- for use in developing programs and solutions for Xilinx devices.  By
 -- providing this design, code, or information as one possible
 -- implementation of this feature, application or standard, Xilinx is
 -- making no representation that this implementation is free from any
 -- claims of infringement.  You are responsible for obtaining any rights
 -- you may require for your implementation.  Xilinx expressly disclaims
 -- any warranty whatsoever with respect to the adequacy of the
 -- implementation, including but not limited to warranties of
 -- merchantability or fitness for a particular purpose.
 --
 -- Xilinx products are not intended for use in life support appliances,
 -- devices, or systems.  Use in such applications is expressly prohibited.
 --
 -- Any modifications that are made to the source code are done at the user's
 -- sole risk and will be unsupported.
 --
 -- This copyright and support notice must be retained as part of this
 -- text at all times.  (c) Copyright 1995-2009 Xilinx, Inc.  All rights
 -- reserved.
 -------------------------------------------------------------------
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xlcmult is 
   generic (
     core_name0: string := "";
     a_width: integer := 4;
     a_bin_pt: integer := 2;
     a_arith: integer := xlSigned;
     b_width: integer := 4;
     b_bin_pt: integer := 2;
     b_arith: integer := xlSigned;
     p_width: integer := 8;
     p_bin_pt: integer := 2;
     p_arith: integer := xlSigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     multsign: integer := xlSigned;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     extra_registers: integer := 0;
     c_a_width: integer := 7;
     c_b_width: integer := 7;
     c_a_type: integer := 0;
     c_b_type: integer := 0;
     c_type: integer := 0;
     const_bin_pt: integer := 1;
     zero_const : integer := 0;
     c_output_width: integer := 16
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     core_ce: in std_logic:= '0';
     core_clr: in std_logic:= '0';
     core_clk: in std_logic:= '0';
     rst: in std_logic_vector(rst_width - 1 downto 0);
     en: in std_logic_vector(en_width - 1 downto 0);
     p: out std_logic_vector(p_width - 1 downto 0)
   );
 end n3z_tonetest_xlcmult;
 
 architecture behavior of n3z_tonetest_xlcmult is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
 signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
 signal conv_p: std_logic_vector(p_width - 1 downto 0);
 -- synthesis translate_off
 signal real_a, real_p: real;
 -- synthesis translate_on
 signal nd: std_logic;
 signal internal_ce: std_logic;
 signal internal_clr: std_logic;
 signal internal_core_ce: std_logic;


 component n3z_tonetest_mult_gen_v12_0_i1
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

begin
 -- synthesis translate_off
 -- synthesis translate_on
 input_process: process(a)
 variable tmp_p_bin_pt, tmp_p_arith: integer;
 begin
 tmp_a <= zero_ext(a, c_a_width);
 end process;
 output_process: process(tmp_p)
 begin
 conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
 p_width, p_bin_pt, p_arith, quantization, overflow);
 end process;
 internal_ce <= ce and en(0);
 internal_core_ce <= core_ce and en(0);
 internal_clr <= (clr or rst(0)) and ce;
 nd <= internal_ce;


 comp0: if ((core_name0 = "n3z_tonetest_mult_gen_v12_0_i1")) generate 
  core_instance0:n3z_tonetest_mult_gen_v12_0_i1
   port map ( 
      sclr => internal_clr,
      clk => clk,
      ce => internal_ce,
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

latency_gt_0: if (extra_registers > 0) and (zero_const = 0)
 generate
 reg: synth_reg
 generic map (
 width => p_width,
 latency => extra_registers
 )
 port map (
 i => conv_p,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o => p
 );
 end generate;
 latency0: if ( (extra_registers = 0) and (zero_const = 0) )
 generate
 p <= conv_p;
 end generate latency0;
 zero_constant: if (zero_const = 1)
 generate
 p <= integer_to_std_logic_vector(0,p_width,p_arith);
 end generate zero_constant;
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xlcounter_rst.vhd
 --
 --  Created       : 1/31/01
 --  Modified      :
 --
 --  Description   : VHDL wrapper for a counter. This wrapper
 --                  uses the Binary Counter CoreGenerator core.
 --
 ---------------------------------------------------------------------
 
 
 ---------------------------------------------------------------------
 --
 --  Entity        : xlcounter
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a counter.
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;

entity n3z_tonetest_xlcounter_free is 
   generic (
     core_name0: string := "";
     op_width: integer := 5;
     op_arith: integer := xlSigned
   );
   port (
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     op: out std_logic_vector(op_width - 1 downto 0);
     up: in std_logic_vector(0 downto 0) := (others => '0');
     load: in std_logic_vector(0 downto 0) := (others => '0');
     din: in std_logic_vector(op_width - 1 downto 0) := (others => '0');
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0)
   );
 end n3z_tonetest_xlcounter_free;
 
 architecture behavior of n3z_tonetest_xlcounter_free is


 component n3z_tonetest_c_counter_binary_v12_0_i0
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i1
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i2
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i3
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i4
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i5
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i7
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i8
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i9
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i6
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i10
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i11
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_c_counter_binary_v12_0_i12
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

-- synthesis translate_off
   constant zeroVec: std_logic_vector(op_width - 1 downto 0) := (others => '0');
   constant oneVec: std_logic_vector(op_width - 1 downto 0) := (others => '1');
   constant zeroStr: string(1 to op_width) :=
     std_logic_vector_to_bin_string(zeroVec);
   constant oneStr: string(1 to op_width) :=
     std_logic_vector_to_bin_string(oneVec);
 -- synthesis translate_on
 
   signal core_sinit: std_logic;
   signal core_ce: std_logic;
   signal op_net: std_logic_vector(op_width - 1 downto 0);
 begin
   core_ce <= ce and en(0);
   core_sinit <= (clr or rst(0)) and ce;
   op <= op_net;


 comp0: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i0")) generate 
  core_instance0:n3z_tonetest_c_counter_binary_v12_0_i0
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i1")) generate 
  core_instance1:n3z_tonetest_c_counter_binary_v12_0_i1
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i2")) generate 
  core_instance2:n3z_tonetest_c_counter_binary_v12_0_i2
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp3: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i3")) generate 
  core_instance3:n3z_tonetest_c_counter_binary_v12_0_i3
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp4: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i4")) generate 
  core_instance4:n3z_tonetest_c_counter_binary_v12_0_i4
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp5: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i5")) generate 
  core_instance5:n3z_tonetest_c_counter_binary_v12_0_i5
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp6: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i7")) generate 
  core_instance6:n3z_tonetest_c_counter_binary_v12_0_i7
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp7: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i8")) generate 
  core_instance7:n3z_tonetest_c_counter_binary_v12_0_i8
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp8: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i9")) generate 
  core_instance8:n3z_tonetest_c_counter_binary_v12_0_i9
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp9: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i6")) generate 
  core_instance9:n3z_tonetest_c_counter_binary_v12_0_i6
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp10: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i10")) generate 
  core_instance10:n3z_tonetest_c_counter_binary_v12_0_i10
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp11: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i11")) generate 
  core_instance11:n3z_tonetest_c_counter_binary_v12_0_i11
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp12: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i12")) generate 
  core_instance12:n3z_tonetest_c_counter_binary_v12_0_i12
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xlcounter.vhd
 --
 --  Created       : 5/31/00
 --  Modified      : 6/7/00
 --
 --  Description   : VHDL wrapper for a counter. This wrapper
 --                  uses the Binary Counter CoreGenerator core.
 --
 ---------------------------------------------------------------------
 
 
 ---------------------------------------------------------------------
 --
 --  Entity        : xlcounter
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a counter.
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

entity n3z_tonetest_xlcounter_limit is 
   generic (
     core_name0: string := "";
     op_width: integer := 5;
     op_arith: integer := xlSigned;
     cnt_63_48: integer:= 0;
     cnt_47_32: integer:= 0;
     cnt_31_16: integer:= 0;
     cnt_15_0: integer:= 0;
     count_limited: integer := 0		-- 0 if cnt_to = (2^n)-1 else 1
   );
   port (
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     op: out std_logic_vector(op_width - 1 downto 0);
     up: in std_logic_vector(0 downto 0) := (others => '0');
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0)
   );
 end n3z_tonetest_xlcounter_limit;
 
 architecture behavior of n3z_tonetest_xlcounter_limit is
 signal high_cnt_to: std_logic_vector(31 downto 0);
 signal low_cnt_to: std_logic_vector(31 downto 0);
 signal cnt_to: std_logic_vector(63 downto 0);
 signal core_sinit, op_thresh0, core_ce: std_logic;
 signal rst_overrides_en: std_logic;
 signal op_net: std_logic_vector(op_width - 1 downto 0);
 
 -- synthesis translate_off
 signal real_op : real; -- For debugging info ports
 -- synthesis translate_on
 
 function equals(op, cnt_to : std_logic_vector; width, arith : integer)
 return std_logic
 is
 variable signed_op, signed_cnt_to : signed (width - 1 downto 0);
 variable unsigned_op, unsigned_cnt_to : unsigned (width - 1 downto 0);
 variable result : std_logic;
 begin
 -- synthesis translate_off
 if ((is_XorU(op)) or (is_XorU(cnt_to)) ) then
 result := '0';
 return result;
 end if;
 -- synthesis translate_on
 
 if (op = cnt_to) then
 result := '1';
 else
 result := '0';
 end if;
 return result;
 end;


 component n3z_tonetest_c_counter_binary_v12_0_i6
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

-- synthesis translate_off
   constant zeroVec : std_logic_vector(op_width - 1 downto 0) := (others => '0');
   constant oneVec : std_logic_vector(op_width - 1 downto 0) := (others => '1');
   constant zeroStr : string(1 to op_width) :=
     std_logic_vector_to_bin_string(zeroVec);
   constant oneStr : string(1 to op_width) :=
     std_logic_vector_to_bin_string(oneVec);
 -- synthesis translate_on
 
 begin
   -- Debugging info for internal full precision variables
   -- synthesis translate_off
 --     real_op <= to_real(op, op_bin_pt, op_arith);
   -- synthesis translate_on
 
   cnt_to(63 downto 48) <= integer_to_std_logic_vector(cnt_63_48, 16, op_arith);
   cnt_to(47 downto 32) <= integer_to_std_logic_vector(cnt_47_32, 16, op_arith);
   cnt_to(31 downto 16) <= integer_to_std_logic_vector(cnt_31_16, 16, op_arith);
   cnt_to(15 downto 0) <= integer_to_std_logic_vector(cnt_15_0, 16, op_arith);
 
   -- Output of counter always valid
   op <= op_net;
   core_ce <= ce and en(0);
   rst_overrides_en <= rst(0) or en(0);
 
   limit : if (count_limited = 1) generate
     eq_cnt_to : process (op_net, cnt_to)
     begin
       -- Had to pass cnt_to(op_width - 1 downto 0) instead of cnt_to so
       -- that XST would infer a macro
       op_thresh0 <= equals(op_net, cnt_to(op_width - 1 downto 0),
                      op_width, op_arith);
     end process;
 
     core_sinit <= (op_thresh0 or clr or rst(0)) and ce and rst_overrides_en;
   end generate;
 
   no_limit : if (count_limited = 0) generate
     core_sinit <= (clr or rst(0)) and ce and rst_overrides_en;
   end generate;


 comp0: if ((core_name0 = "n3z_tonetest_c_counter_binary_v12_0_i6")) generate 
  core_instance0:n3z_tonetest_c_counter_binary_v12_0_i6
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Entity        : xldpram
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level HDL wrapper for block dual port ram
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xldpram is 
   generic (
     core_name0: string := "";
     c_width_a: integer := 13;
     c_address_width_a: integer := 4;
     c_width_b: integer := 13;
     c_address_width_b: integer := 4;
     c_has_sinita: integer := 0;
     c_has_sinitb: integer := 0;
     latency: integer := 1
   );
   port (
     dina: in std_logic_vector(c_width_a - 1 downto 0);
     addra: in std_logic_vector(c_address_width_a - 1 downto 0);
     wea: in std_logic_vector(0 downto 0);
     a_ce: in std_logic;
     a_clk: in std_logic;
     rsta: in std_logic_vector(0 downto 0) := (others => '0');
     ena: in std_logic_vector(0 downto 0) := (others => '1');
     douta: out std_logic_vector(c_width_a - 1 downto 0);
     dinb: in std_logic_vector(c_width_b - 1 downto 0);
     addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
     web: in std_logic_vector(0 downto 0);
     b_ce: in std_logic;
     b_clk: in std_logic;
     rstb: in std_logic_vector(0 downto 0) := (others => '0');
     enb: in std_logic_vector(0 downto 0) := (others => '1');
     doutb: out std_logic_vector(c_width_b - 1 downto 0)
   );
 end n3z_tonetest_xldpram;
 
 architecture behavior of n3z_tonetest_xldpram is
 component synth_reg
 generic (
 width: integer;
 latency: integer
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 
 signal core_addra: std_logic_vector(c_address_width_a - 1 downto 0);
 signal core_addrb: std_logic_vector(c_address_width_b - 1 downto 0);
 signal core_dina, core_douta, dly_douta:
 std_logic_vector(c_width_a - 1 downto 0);
 signal core_dinb, core_doutb, dly_doutb:
 std_logic_vector(c_width_b - 1 downto 0);
 signal core_wea, core_web: std_logic;
 signal core_a_ce, core_b_ce: std_logic;
 signal sinita, sinitb: std_logic;


 component n3z_tonetest_blk_mem_gen_v8_3_i0
    port ( 
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_blk_mem_gen_v8_3_i1
    port ( 
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_blk_mem_gen_v8_3_i4
    port ( 
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_blk_mem_gen_v8_3_i6
    port ( 
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0) 
 		  ); 
 end component;

begin
 core_addra <= addra;
 core_dina <= dina;
 douta <= dly_douta;
 core_wea <= wea(0);
 core_a_ce <= a_ce and ena(0);
 sinita <= rsta(0) and a_ce;
 
 core_addrb <= addrb;
 core_dinb <= dinb;
 doutb <= dly_doutb;
 core_web <= web(0);
 core_b_ce <= b_ce and enb(0);
 sinitb <= rstb(0) and b_ce;


 comp0: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i0")) generate 
  core_instance0:n3z_tonetest_blk_mem_gen_v8_3_i0
   port map ( 
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i1")) generate 
  core_instance1:n3z_tonetest_blk_mem_gen_v8_3_i1
   port map ( 
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i4")) generate 
  core_instance2:n3z_tonetest_blk_mem_gen_v8_3_i4
   port map ( 
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  ); 
   end generate;

 comp3: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i6")) generate 
  core_instance3:n3z_tonetest_blk_mem_gen_v8_3_i6
   port map ( 
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  ); 
   end generate;

latency_test: if (latency > 2) generate
 regA: synth_reg
 generic map (
 width => c_width_a,
 latency => latency - 2
 )
 port map (
 i => core_douta,
 ce => core_a_ce,
 clr => '0',
 clk => a_clk,
 o => dly_douta
 );
 regB: synth_reg
 generic map (
 width => c_width_b,
 latency => latency - 2
 )
 port map (
 i => core_doutb,
 ce => core_b_ce,
 clr => '0',
 clk => b_clk,
 o => dly_doutb
 );
 end generate;
 latency1: if (latency <= 2) generate
 dly_douta <= core_douta;
 dly_doutb <= core_doutb;
 end generate;
 end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Entity        : xlfifogen
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a fifo block
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

entity n3z_tonetest_xlfifogen is 
   generic (
     core_name0: string := "";
     data_width: integer := -1;
     data_count_width: integer := -1;
     percent_full_width: integer := -1;
     has_ae : integer := 0;
     has_af : integer := 0;
     extra_registers: integer := 2
   );
   port (
     din: in std_logic_vector(data_width - 1 downto 0);
     we: in std_logic;
     we_ce: in std_logic;
     re: in std_logic;
     re_ce: in std_logic;
     rst: in std_logic;
     en: in std_logic;
     ce: in std_logic;
     clk: in std_logic;
     empty: out std_logic;
     full: out std_logic;
     percent_full: out std_logic_vector(percent_full_width - 1 downto 0);
     dcount: out std_logic_vector(data_count_width - 1 downto 0);
     ae: out std_logic;
     af: out std_logic;
     dout: out std_logic_vector(data_width - 1 downto 0)
   );
 end n3z_tonetest_xlfifogen;
 
 architecture behavior of n3z_tonetest_xlfifogen is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 


 component n3z_tonetest_fifo_generator_v13_1_i0
    port ( 
      clk: in std_logic;
      din: in std_logic_vector(data_width - 1 downto 0);
      wr_en: in std_logic;
      rd_en: in std_logic;
      dout: out std_logic_vector(data_width - 1 downto 0);
      full: out std_logic;
      empty: out std_logic;
      prog_full: out std_logic 
 		  ); 
 end component;

 component n3z_tonetest_fifo_generator_v13_1_i1
    port ( 
      clk: in std_logic;
      din: in std_logic_vector(data_width - 1 downto 0);
      wr_en: in std_logic;
      rd_en: in std_logic;
      dout: out std_logic_vector(data_width - 1 downto 0);
      full: out std_logic;
      empty: out std_logic;
      data_count: out std_logic_vector(data_count_width - 1 downto 0) 
 		  ); 
 end component;

  signal rd_en: std_logic;
   signal wr_en: std_logic;
   signal srst: std_logic;
   signal core_full: std_logic;
   signal core_dcount: std_logic_vector(data_count_width - 1 downto 0);
   signal srst_vec: std_logic_vector(0 downto 0);
 
 begin
 

 comp0: if ((core_name0 = "n3z_tonetest_fifo_generator_v13_1_i0")) generate 
  core_instance0:n3z_tonetest_fifo_generator_v13_1_i0
   port map ( 
        clk => clk,
        din => din,
        wr_en => wr_en,
        rd_en => rd_en,
        full => core_full,
        dout => dout,
        empty => empty
,
        prog_full => af
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_fifo_generator_v13_1_i1")) generate 
  core_instance1:n3z_tonetest_fifo_generator_v13_1_i1
   port map ( 
        clk => clk,
        din => din,
        wr_en => wr_en,
        rd_en => rd_en,
        full => core_full,
        dout => dout,
        empty => empty
,
        data_count => core_dcount
  ); 
   end generate;

-- Process to remap data count from 0000->1111 when fifo is full.
   modify_count: process(core_full, core_dcount) is
   begin
     if core_full = '1' then
       percent_full <= (others => '1');
     else
       percent_full <= core_dcount(data_count_width-1 downto data_count_width-percent_full_width);
     end if;
   end process modify_count;
   
   rd_en <= re and en and re_ce;
   wr_en <= we and en and we_ce;
   full <= core_full;
   dcount <= core_dcount;
   
   --Zero ae/af if these signals are not specified on the core
   terminate_core_ae: if has_ae /= 1 generate
   begin
     ae <= '0';
   end generate terminate_core_ae;
   terminate_core_af: if has_af /= 1 generate
   begin
     af <= '0';
   end generate terminate_core_af;
latency_gt_0: if (extra_registers > 0) generate
   reg: synth_reg
     generic map (
       width => 1,
       latency => extra_registers
     )
     port map (
       i => std_logic_to_vector(rst),
       ce => ce,
       clr => '0',
       clk => clk,
       o => srst_vec
     );
     srst <= srst_vec(0);
 end generate;
 
 latency_eq_0: if (extra_registers = 0) generate
   srst <= rst and ce;
 end generate;
 
 end  behavior;
 
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

-------------------------------------------------------------------
 -- System Generator version 11.1 VHDL source file.
 --
 -- Copyright(C) 2009 by Xilinx, Inc.  All rights reserved.  This
 -- text/file contains proprietary, confidential information of Xilinx,
 -- Inc., is distributed under license from Xilinx, Inc., and may be used,
 -- copied and/or disclosed only pursuant to the terms of a valid license
 -- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
 -- this text/file solely for design, simulation, implementation and
 -- creation of design files limited to Xilinx devices or technologies.
 -- Use with non-Xilinx devices or technologies is expressly prohibited
 -- and immediately terminates your license unless covered by a separate
 -- agreement.
 --
 -- Xilinx is providing this design, code, or information "as is" solely
 -- for use in developing programs and solutions for Xilinx devices.  By
 -- providing this design, code, or information as one possible
 -- implementation of this feature, application or standard, Xilinx is
 -- making no representation that this implementation is free from any
 -- claims of infringement.  You are responsible for obtaining any rights
 -- you may require for your implementation.  Xilinx expressly disclaims
 -- any warranty whatsoever with respect to the adequacy of the
 -- implementation, including but not limited to warranties of
 -- merchantability or fitness for a particular purpose.
 --
 -- Xilinx products are not intended for use in life support appliances,
 -- devices, or systems.  Use in such applications is expressly prohibited.
 --
 -- Any modifications that are made to the source code are done at the user's
 -- sole risk and will be unsupported.
 --
 -- This copyright and support notice must be retained as part of this
 -- text at all times.  (c) Copyright 1995-2009 Xilinx, Inc.  All rights
 -- reserved.
 -------------------------------------------------------------------
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xlmult is 
   generic (
     core_name0: string := "";
     a_width: integer := 4;
     a_bin_pt: integer := 2;
     a_arith: integer := xlSigned;
     b_width: integer := 4;
     b_bin_pt: integer := 1;
     b_arith: integer := xlSigned;
     p_width: integer := 8;
     p_bin_pt: integer := 2;
     p_arith: integer := xlSigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     extra_registers: integer := 0;
     c_a_width: integer := 7;
     c_b_width: integer := 7;
     c_type: integer := 0;
     c_a_type: integer := 0;
     c_b_type: integer := 0;
     c_pipelined: integer := 1;
     c_baat: integer := 4;
     multsign: integer := xlSigned;
     c_output_width: integer := 16
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     b: in std_logic_vector(b_width - 1 downto 0);
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     core_ce: in std_logic := '0';
     core_clr: in std_logic := '0';
     core_clk: in std_logic := '0';
     rst: in std_logic_vector(rst_width - 1 downto 0);
     en: in std_logic_vector(en_width - 1 downto 0);
     p: out std_logic_vector(p_width - 1 downto 0)
   );
 end  n3z_tonetest_xlmult;
 
 architecture behavior of n3z_tonetest_xlmult is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;


 component n3z_tonetest_mult_gen_v12_0_i0
    port ( 
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_mult_gen_v12_0_i2
    port ( 
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_mult_gen_v12_0_i3
    port ( 
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
 signal conv_a: std_logic_vector(c_a_width - 1 downto 0);
 signal tmp_b: std_logic_vector(c_b_width - 1 downto 0);
 signal conv_b: std_logic_vector(c_b_width - 1 downto 0);
 signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
 signal conv_p: std_logic_vector(p_width - 1 downto 0);
 -- synthesis translate_off
 signal real_a, real_b, real_p: real;
 -- synthesis translate_on
 signal rfd: std_logic;
 signal rdy: std_logic;
 signal nd: std_logic;
 signal internal_ce: std_logic;
 signal internal_clr: std_logic;
 signal internal_core_ce: std_logic;
 begin
 -- synthesis translate_off
 -- synthesis translate_on
 internal_ce <= ce and en(0);
 internal_core_ce <= core_ce and en(0);
 internal_clr <= (clr or rst(0)) and ce;
 nd <= internal_ce;
 input_process: process (a,b)
 begin
 tmp_a <= zero_ext(a, c_a_width);
 tmp_b <= zero_ext(b, c_b_width);
 end process;
 output_process: process (tmp_p)
 begin
 conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
 p_width, p_bin_pt, p_arith, quantization, overflow);
 end process;


 comp0: if ((core_name0 = "n3z_tonetest_mult_gen_v12_0_i0")) generate 
  core_instance0:n3z_tonetest_mult_gen_v12_0_i0
   port map ( 
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_mult_gen_v12_0_i2")) generate 
  core_instance1:n3z_tonetest_mult_gen_v12_0_i2
   port map ( 
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_mult_gen_v12_0_i3")) generate 
  core_instance2:n3z_tonetest_mult_gen_v12_0_i3
   port map ( 
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
  ); 
   end generate;

latency_gt_0: if (extra_registers > 0) generate
 reg: synth_reg
 generic map (
 width => p_width,
 latency => extra_registers
 )
 port map (
 i => conv_p,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o => p
 );
 end generate;
 latency_eq_0: if (extra_registers = 0) generate
 p <= conv_p;
 end generate;
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
 use IEEE.std_logic_1164.all;

entity n3z_tonetest_xlspram is 
   generic (
     core_name0: string := "";
     c_width: integer := 12;
     c_address_width: integer := 4;
     latency: integer := 1
     );
   port (
     data_in: in std_logic_vector(c_width - 1 downto 0);
     addr: in std_logic_vector(c_address_width - 1 downto 0);
     we: in std_logic_vector(0 downto 0);
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0);
     ce: in std_logic;
     clk: in std_logic;
     data_out: out std_logic_vector(c_width - 1 downto 0)
   );
 end n3z_tonetest_xlspram;
 
 architecture behavior of n3z_tonetest_xlspram is
 component synth_reg
 generic (
 width: integer;
 latency: integer
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 signal core_data_out, dly_data_out: std_logic_vector(c_width - 1 downto 0);
 signal core_we, core_ce, sinit: std_logic;


 component n3z_tonetest_blk_mem_gen_v8_3_i5
    port ( 
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

begin
 data_out <= dly_data_out;
 core_we <= we(0);
 core_ce <= ce and en(0);
 sinit <= rst(0) and ce;


 comp0: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i5")) generate 
  core_instance0:n3z_tonetest_blk_mem_gen_v8_3_i5
   port map ( 
        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out
  ); 
   end generate;

latency_test: if (latency > 1) generate
 reg: synth_reg
 generic map (
 width => c_width,
 latency => latency - 1
 )
 port map (
 i => core_data_out,
 ce => core_ce,
 clr => '0',
 clk => clk,
 o => dly_data_out
 );
 end generate;
 latency_1: if (latency <= 1) generate
 dly_data_out <= core_data_out;
 end generate;
 end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xlsprom is 
   generic (
     core_name0: string := "";
     c_width: integer := 12;             -- equal to data_width
     c_address_width: integer := 4;      -- Block RAM address width (might not
                                         -- be equal to addr_width, but
                                         -- addr_width <= c_address_width)
     latency: integer := 1
   );
   port (
     addr: in std_logic_vector(c_address_width - 1 downto 0);
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0);
     ce: in std_logic;
     clk: in std_logic;
     data: out std_logic_vector(c_width - 1 downto 0)
   );
 end n3z_tonetest_xlsprom;
 
 architecture behavior of n3z_tonetest_xlsprom is
 component synth_reg
 generic (
 width: integer;
 latency: integer
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 
 signal core_addr: std_logic_vector(c_address_width - 1 downto 0);
 signal core_data_out: std_logic_vector(c_width - 1 downto 0);
 signal core_ce, sinit: std_logic;


 component n3z_tonetest_blk_mem_gen_v8_3_i2
    port ( 
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_blk_mem_gen_v8_3_i3
    port ( 
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_blk_mem_gen_v8_3_i7
    port ( 
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

begin
 core_addr <= addr;
 core_ce <= ce and en(0);
 sinit <= rst(0) and ce;


 comp0: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i2")) generate 
  core_instance0:n3z_tonetest_blk_mem_gen_v8_3_i2
   port map ( 
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i3")) generate 
  core_instance1:n3z_tonetest_blk_mem_gen_v8_3_i3
   port map ( 
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_blk_mem_gen_v8_3_i7")) generate 
  core_instance2:n3z_tonetest_blk_mem_gen_v8_3_i7
   port map ( 
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  ); 
   end generate;

latency_test: if (latency > 1) generate
 reg: synth_reg
 generic map (
 width => c_width,
 latency => latency - 1
 )
 port map (
 i => core_data_out,
 ce => core_ce,
 clr => '0',
 clk => clk,
 o => data
 );
 end generate;
 
 latency_1: if (latency <= 1) generate
 data <= core_data_out;
 end generate;
 end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xlsprom_dist.vhd
 --
 --  Created       : 10/1/99
 --
 --  Description   : VHDL description of a single port distributed ROM block
 --
 ---------------------------------------------------------------------
 
 
 ---------------------------------------------------------------------
 --
 --  Entity        : xlsprom_dist
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description.
 --
 ---------------------------------------------------------------------
 
 
 -------------------------- Assumptions ------------------------------
 --
 -- Input size, bin_pt, etc. are the same as the output
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity n3z_tonetest_xlsprom_dist is 
   generic (
     core_name0: string := "";
     addr_width: integer := 2;
     latency: integer := 0;
     c_width: integer := 12;
     c_address_width: integer := 4
   );
   port (
     addr: in std_logic_vector(addr_width - 1 downto 0);
     en: in std_logic_vector(0 downto 0);
     ce: in std_logic;
     clk: in std_logic;
     data: out std_logic_vector(c_width - 1 downto 0)
   );
 end n3z_tonetest_xlsprom_dist;
 
 architecture behavior of n3z_tonetest_xlsprom_dist is
 component synth_reg
 generic (width : integer;
 latency : integer);
 port (i : in std_logic_vector(width - 1 downto 0);
 ce : in std_logic;
 clr : in std_logic;
 clk : in std_logic;
 o : out std_logic_vector(width - 1 downto 0));
 end component;
 
 signal core_data_out: std_logic_vector(c_width - 1 downto 0);
 constant num_extra_addr_bits: integer := (c_address_width - addr_width);
 signal core_addr: std_logic_vector(c_address_width - 1 downto 0);
 signal core_ce: std_logic;


 component n3z_tonetest_dist_mem_gen_v8_0_i0
    port ( 
      a: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      qspo_ce: in std_logic;
      qspo: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_dist_mem_gen_v8_0_i1
    port ( 
      a: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      qspo_ce: in std_logic;
      qspo: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

 component n3z_tonetest_dist_mem_gen_v8_0_i2
    port ( 
      a: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      qspo_ce: in std_logic;
      qspo: out std_logic_vector(c_width - 1 downto 0) 
 		  ); 
 end component;

begin
 -- Pad the address with zeros at the MSB
 need_to_pad_addr: if num_extra_addr_bits > 0 generate
 core_addr(c_address_width - 1 downto addr_width) <= (others => '0');
 core_addr(addr_width - 1 downto 0) <= addr;
 end generate;
 
 no_need_to_pad_addr: if num_extra_addr_bits = 0 generate
 core_addr <= addr;
 end generate;
 
 core_ce <= ce and en(0);


 comp0: if ((core_name0 = "n3z_tonetest_dist_mem_gen_v8_0_i0")) generate 
  core_instance0:n3z_tonetest_dist_mem_gen_v8_0_i0
   port map ( 
        a => core_addr,
        clk => clk,
        qspo_ce => core_ce,
        qspo => core_data_out
  ); 
   end generate;

 comp1: if ((core_name0 = "n3z_tonetest_dist_mem_gen_v8_0_i1")) generate 
  core_instance1:n3z_tonetest_dist_mem_gen_v8_0_i1
   port map ( 
        a => core_addr,
        clk => clk,
        qspo_ce => core_ce,
        qspo => core_data_out
  ); 
   end generate;

 comp2: if ((core_name0 = "n3z_tonetest_dist_mem_gen_v8_0_i2")) generate 
  core_instance2:n3z_tonetest_dist_mem_gen_v8_0_i2
   port map ( 
        a => core_addr,
        clk => clk,
        qspo_ce => core_ce,
        qspo => core_data_out
  ); 
   end generate;

latency_test: if (latency > 1) generate
 reg: synth_reg
 generic map (
 width => c_width,
 latency => latency - 1
 )
 port map (
 i => core_data_out,
 ce => core_ce,
 clr => '0',
 clk => clk,
 o => data
 );
 end generate;
 
 latency_0_or_1: if (latency <= 1)
 generate
 data <= core_data_out;
 end generate;
 end behavior;

