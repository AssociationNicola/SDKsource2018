vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/processing_system7_bfm_v2_0_5
vlib msim/blk_mem_gen_v8_3_3
vlib msim/xbip_utils_v3_0_6
vlib msim/c_reg_fd_v12_0_2
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_pipe_v3_0_2
vlib msim/xbip_dsp48_addsub_v3_0_2
vlib msim/xbip_addsub_v3_0_2
vlib msim/c_addsub_v12_0_9
vlib msim/c_gate_bit_v12_0_2
vlib msim/xbip_counter_v3_0_2
vlib msim/c_counter_binary_v12_0_9
vlib msim/dist_mem_gen_v8_0_10
vlib msim/fifo_generator_v13_1_1
vlib msim/xbip_bram18k_v3_0_2
vlib msim/mult_gen_v12_0_11
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_9
vlib msim/generic_baseblocks_v2_1_0
vlib msim/axi_infrastructure_v1_1_0
vlib msim/axi_register_slice_v2_1_9
vlib msim/axi_data_fifo_v2_1_8
vlib msim/axi_crossbar_v2_1_10
vlib msim/axi_lite_ipif_v3_0_4
vlib msim/lib_pkg_v1_0_2
vlib msim/lib_fifo_v1_0_5
vlib msim/fifo_generator_v13_0_3
vlib msim/axi_fifo_mm_s_v4_1_6
vlib msim/util_vector_logic_v2_0
vlib msim/axi_protocol_converter_v2_1_9

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap processing_system7_bfm_v2_0_5 msim/processing_system7_bfm_v2_0_5
vmap blk_mem_gen_v8_3_3 msim/blk_mem_gen_v8_3_3
vmap xbip_utils_v3_0_6 msim/xbip_utils_v3_0_6
vmap c_reg_fd_v12_0_2 msim/c_reg_fd_v12_0_2
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_2 msim/xbip_pipe_v3_0_2
vmap xbip_dsp48_addsub_v3_0_2 msim/xbip_dsp48_addsub_v3_0_2
vmap xbip_addsub_v3_0_2 msim/xbip_addsub_v3_0_2
vmap c_addsub_v12_0_9 msim/c_addsub_v12_0_9
vmap c_gate_bit_v12_0_2 msim/c_gate_bit_v12_0_2
vmap xbip_counter_v3_0_2 msim/xbip_counter_v3_0_2
vmap c_counter_binary_v12_0_9 msim/c_counter_binary_v12_0_9
vmap dist_mem_gen_v8_0_10 msim/dist_mem_gen_v8_0_10
vmap fifo_generator_v13_1_1 msim/fifo_generator_v13_1_1
vmap xbip_bram18k_v3_0_2 msim/xbip_bram18k_v3_0_2
vmap mult_gen_v12_0_11 msim/mult_gen_v12_0_11
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_9 msim/proc_sys_reset_v5_0_9
vmap generic_baseblocks_v2_1_0 msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_9 msim/axi_register_slice_v2_1_9
vmap axi_data_fifo_v2_1_8 msim/axi_data_fifo_v2_1_8
vmap axi_crossbar_v2_1_10 msim/axi_crossbar_v2_1_10
vmap axi_lite_ipif_v3_0_4 msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 msim/lib_pkg_v1_0_2
vmap lib_fifo_v1_0_5 msim/lib_fifo_v1_0_5
vmap fifo_generator_v13_0_3 msim/fifo_generator_v13_0_3
vmap axi_fifo_mm_s_v4_1_6 msim/axi_fifo_mm_s_v4_1_6
vmap util_vector_logic_v2_0 msim/util_vector_logic_v2_0
vmap axi_protocol_converter_v2_1_9 msim/axi_protocol_converter_v2_1_9

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work processing_system7_bfm_v2_0_5 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_wr.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_rd.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_wr_4.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_rd_4.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_hp2_3.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_hp0_1.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ssw_hp.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_sparse_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_reg_map.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ocm_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_intr_wr_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_intr_rd_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_fmsw_gp.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_regc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ocmc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_interconnect_model.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_gen_reset.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_gen_clock.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ddrc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_axi_slave.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_axi_master.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_afi_slave.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_processing_system7_bfm.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/ip/PS_PL_processing_system7_0_0/sim/PS_PL_processing_system7_0_0.v" \
"../../../bd/PS_PL/ip/PS_PL_clk_wiz_0_1/PS_PL_clk_wiz_0_1_clk_wiz.v" \
"../../../bd/PS_PL/ip/PS_PL_clk_wiz_0_1/PS_PL_clk_wiz_0_1.v" \

vlog -work blk_mem_gen_v8_3_3 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i0/blk_mem_gen_v8_3_3/simulation/blk_mem_gen_v8_3.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i0/sim/n3z_tonetest_blk_mem_gen_v8_3_i0.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i1/sim/n3z_tonetest_blk_mem_gen_v8_3_i1.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i2/sim/n3z_tonetest_blk_mem_gen_v8_3_i2.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i3/sim/n3z_tonetest_blk_mem_gen_v8_3_i3.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i4/sim/n3z_tonetest_blk_mem_gen_v8_3_i4.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i5/sim/n3z_tonetest_blk_mem_gen_v8_3_i5.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i6/sim/n3z_tonetest_blk_mem_gen_v8_3_i6.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_blk_mem_gen_v8_3_i7/sim/n3z_tonetest_blk_mem_gen_v8_3_i7.v" \

vcom -work xbip_utils_v3_0_6 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_addsub_v3_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0.vhd" \

vcom -work c_addsub_v12_0_9 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/c_addsub_v12_0_9/hdl/c_addsub_v12_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/c_addsub_v12_0_9/hdl/c_addsub_v12_0.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i0/sim/n3z_tonetest_c_addsub_v12_0_i0.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i1/sim/n3z_tonetest_c_addsub_v12_0_i1.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i10/sim/n3z_tonetest_c_addsub_v12_0_i10.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i11/sim/n3z_tonetest_c_addsub_v12_0_i11.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i12/sim/n3z_tonetest_c_addsub_v12_0_i12.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i13/sim/n3z_tonetest_c_addsub_v12_0_i13.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i14/sim/n3z_tonetest_c_addsub_v12_0_i14.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i15/sim/n3z_tonetest_c_addsub_v12_0_i15.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i16/sim/n3z_tonetest_c_addsub_v12_0_i16.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i17/sim/n3z_tonetest_c_addsub_v12_0_i17.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i18/sim/n3z_tonetest_c_addsub_v12_0_i18.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i2/sim/n3z_tonetest_c_addsub_v12_0_i2.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i3/sim/n3z_tonetest_c_addsub_v12_0_i3.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i4/sim/n3z_tonetest_c_addsub_v12_0_i4.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i5/sim/n3z_tonetest_c_addsub_v12_0_i5.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i6/sim/n3z_tonetest_c_addsub_v12_0_i6.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i7/sim/n3z_tonetest_c_addsub_v12_0_i7.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i8/sim/n3z_tonetest_c_addsub_v12_0_i8.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_addsub_v12_0_i9/sim/n3z_tonetest_c_addsub_v12_0_i9.vhd" \

vcom -work c_gate_bit_v12_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/c_gate_bit_v12_0_2/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/c_gate_bit_v12_0_2/hdl/c_gate_bit_v12_0.vhd" \

vcom -work xbip_counter_v3_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/xbip_counter_v3_0_2/hdl/xbip_counter_v3_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/xbip_counter_v3_0_2/hdl/xbip_counter_v3_0.vhd" \

vcom -work c_counter_binary_v12_0_9 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/c_counter_binary_v12_0_9/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/c_counter_binary_v12_0_9/hdl/c_counter_binary_v12_0.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i0/sim/n3z_tonetest_c_counter_binary_v12_0_i0.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i1/sim/n3z_tonetest_c_counter_binary_v12_0_i1.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i10/sim/n3z_tonetest_c_counter_binary_v12_0_i10.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i11/sim/n3z_tonetest_c_counter_binary_v12_0_i11.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i12/sim/n3z_tonetest_c_counter_binary_v12_0_i12.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i2/sim/n3z_tonetest_c_counter_binary_v12_0_i2.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i3/sim/n3z_tonetest_c_counter_binary_v12_0_i3.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i4/sim/n3z_tonetest_c_counter_binary_v12_0_i4.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i5/sim/n3z_tonetest_c_counter_binary_v12_0_i5.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i6/sim/n3z_tonetest_c_counter_binary_v12_0_i6.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i7/sim/n3z_tonetest_c_counter_binary_v12_0_i7.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i8/sim/n3z_tonetest_c_counter_binary_v12_0_i8.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_c_counter_binary_v12_0_i9/sim/n3z_tonetest_c_counter_binary_v12_0_i9.vhd" \

vlog -work dist_mem_gen_v8_0_10 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_dist_mem_gen_v8_0_i0/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_dist_mem_gen_v8_0_i0/sim/n3z_tonetest_dist_mem_gen_v8_0_i0.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_dist_mem_gen_v8_0_i1/sim/n3z_tonetest_dist_mem_gen_v8_0_i1.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_dist_mem_gen_v8_0_i2/sim/n3z_tonetest_dist_mem_gen_v8_0_i2.v" \

vlog -work fifo_generator_v13_1_1 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i0/fifo_generator_v13_1_1/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_1 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i0/fifo_generator_v13_1_1/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_1 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i0/fifo_generator_v13_1_1/hdl/fifo_generator_v13_1_rfs.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i0/sim/n3z_tonetest_fifo_generator_v13_1_i0.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i1/sim/n3z_tonetest_fifo_generator_v13_1_i1.v" \

vcom -work xbip_bram18k_v3_0_2 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_11 -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i0/mult_gen_v12_0_11/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i0/mult_gen_v12_0_11/hdl/mult_gen_v12_0.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i0/sim/n3z_tonetest_mult_gen_v12_0_i0.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i1/sim/n3z_tonetest_mult_gen_v12_0_i1.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i2/sim/n3z_tonetest_mult_gen_v12_0_i2.vhd" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_mult_gen_v12_0_i3/sim/n3z_tonetest_mult_gen_v12_0_i3.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/conv_pkg.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/synth_reg.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/synth_reg_w_init.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/srl17e.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/srl33e.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/synth_reg_reg.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/single_reg_w_init.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/xlclockdriver_rd.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/n3z_tonetest_entity_declarations.vhd" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/n3z_tonetest.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/n3z_tonetest_axi_lite_interface_verilog.v" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/synth_reg.v" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/synth_reg_w_init.v" \
"../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl/convert_type.v" \
"../../../bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/sim/PS_PL_n3z_tonetest_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../ipstatic/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd" \

vcom -work proc_sys_reset_v5_0_9 -64 -93 \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/PS_PL/ip/PS_PL_rst_clk_wiz_0_49M_0/sim/PS_PL_rst_clk_wiz_0_49M_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/hdl/PS_PL.v" \
"../../../bd/PS_PL/ipshared/xilinx.com/xlconstant_v1_1/xlconstant.v" \
"../../../bd/PS_PL/ip/PS_PL_DefaultFrequency_0/sim/PS_PL_DefaultFrequency_0.v" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_and.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_and.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_or.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_or.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_command_fifo.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux_enc.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_nto1_mux.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axi2vector.v" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axic_srl_fifo.v" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_vector2axi.v" \

vlog -work axi_register_slice_v2_1_9 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axic_register_slice.v" \
"../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axi_register_slice.v" \

vlog -work axi_data_fifo_v2_1_8 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_fifo_gen.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_srl_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_reg_srl_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_ndeep_srl.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axi_data_fifo.v" \

vlog -work axi_crossbar_v2_1_10 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter_sasd.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_decoder.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_arbiter_resp.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar_sasd.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_decerr_slave.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_si_transactor.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_splitter.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_mux.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_router.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_axi_crossbar.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/ip/PS_PL_xbar_1/sim/PS_PL_xbar_1.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/ipif_pkg.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/pselect_f.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/address_decoder.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/slave_attachment.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/axi_lite_ipif.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../ipstatic/lib_pkg_v1_0/hdl/src/vhdl/lib_pkg.vhd" \

vcom -work lib_fifo_v1_0_5 -64 -93 \
"../../../ipstatic/lib_fifo_v1_0/hdl/src/vhdl/async_fifo_fg.vhd" \
"../../../ipstatic/lib_fifo_v1_0/hdl/src/vhdl/sync_fifo_fg.vhd" \

vcom -work fifo_generator_v13_0_3 -64 -93 \
"../../../ipstatic/fifo_generator_v13_0/simulation/fifo_generator_vhdl_beh.vhd" \
"../../../ipstatic/fifo_generator_v13_0/hdl/fifo_generator_v13_0_rfs.vhd" \

vcom -work axi_fifo_mm_s_v4_1_6 -64 -93 \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_fifo_mm_s_pkg.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_write_fsm.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_write_wrapper.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_read_fsm.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_read_wrapper.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_wrapper.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axis_fg.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/fifo.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/ipic2axi_s.vhd" \
"../../../ipstatic/axi_fifo_mm_s_v4_1/hdl/src/vhdl/axi_fifo_mm_s.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/PS_PL/ip/PS_PL_axi_fifo_mm_s_0_0/sim/PS_PL_axi_fifo_mm_s_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_3_0/sim/PS_PL_xlconstant_3_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/PS_PL/ip/PS_PL_axi_fifo_mm_s_1_0/sim/PS_PL_axi_fifo_mm_s_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/ipshared/xilinx.com/xlslice_v1_0/xlslice.v" \
"../../../bd/PS_PL/ip/PS_PL_xlslice_3_0/sim/PS_PL_xlslice_3_0.v" \
"../../../bd/PS_PL/ip/PS_PL_LCDDATA_0/sim/PS_PL_LCDDATA_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_0_1/sim/PS_PL_xlconstant_0_1.v" \
"../../../bd/PS_PL/ip/PS_PL_xlslice_0_0/sim/PS_PL_xlslice_0_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlslice_0_1/sim/PS_PL_xlslice_0_1.v" \
"../../../bd/PS_PL/ip/PS_PL_xlslice_1_0/sim/PS_PL_xlslice_1_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_1_0/sim/PS_PL_xlconstant_1_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_1_1/sim/PS_PL_xlconstant_1_1.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_1_2/sim/PS_PL_xlconstant_1_2.v" \
"../../../bd/PS_PL/ipshared/koheron/comparator_v1_0/src/comparator.v" \
"../../../bd/PS_PL/ip/PS_PL_comparator_0_0/sim/PS_PL_comparator_0_0.v" \
"../../../bd/PS_PL/ip/PS_PL_comparator_0_1/sim/PS_PL_comparator_0_1.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_0_2/sim/PS_PL_xlconstant_0_2.v" \
"../../../bd/PS_PL/ip/PS_PL_comparator_0_2/sim/PS_PL_comparator_0_2.v" \
"../../../bd/PS_PL/ip/PS_PL_comparator_1_0/sim/PS_PL_comparator_1_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_6_0/sim/PS_PL_xlconstant_6_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlconstant_0_3/sim/PS_PL_xlconstant_0_3.v" \
"../../../bd/PS_PL/ipshared/ccfe/one_clock_pulse_v1_0/src/OneClockPulse.v" \
"../../../bd/PS_PL/ip/PS_PL_one_clock_pulse_0_0/sim/PS_PL_one_clock_pulse_0_0.v" \

vcom -work util_vector_logic_v2_0 -64 -93 \
"../../../bd/PS_PL/ipshared/xilinx.com/util_vector_logic_v2_0/hdl/util_vector_logic.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/PS_PL/ip/PS_PL_util_vector_logic_0_0/sim/PS_PL_util_vector_logic_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/ip/PS_PL_blk_mem_gen_0_2/sim/PS_PL_blk_mem_gen_0_2.v" \
"../../../bd/PS_PL/ip/PS_PL_blk_mem_gen_0_3/sim/PS_PL_blk_mem_gen_0_3.v" \
"../../../bd/PS_PL/ip/PS_PL_blk_mem_gen_0_4/sim/PS_PL_blk_mem_gen_0_4.v" \
"../../../bd/PS_PL/ip/PS_PL_blk_mem_gen_0_5/sim/PS_PL_blk_mem_gen_0_5.v" \
"../../../bd/PS_PL/ip/PS_PL_LCDctrl_0/sim/PS_PL_LCDctrl_0.v" \
"../../../bd/PS_PL/ip/PS_PL_xlslice_3_2/sim/PS_PL_xlslice_3_2.v" \

vlog -work axi_protocol_converter_v2_1_9 -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_a_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axilite_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_r_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_w_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b_downsizer.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_decerr_slave.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_simple_fifo.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wrap_cmd.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_incr_cmd.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wr_cmd_fsm.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_rd_cmd_fsm.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_cmd_translator.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_b_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_r_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_aw_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_ar_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi_protocol_converter.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ipshared/associationnicola/n3z_tonetest_v1_09/hdl" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/clk_wiz_v5_3" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/PS_PL/ip/PS_PL_auto_pc_0/sim/PS_PL_auto_pc_0.v" \

vlog -work xil_defaultlib "glbl.v"

