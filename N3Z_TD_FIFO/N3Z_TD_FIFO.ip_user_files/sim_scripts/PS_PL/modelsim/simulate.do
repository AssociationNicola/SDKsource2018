onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -pli "/opt/Xilinx/Vivado/2016.2/lib/lnx64.o/libxil_vsim.so" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L processing_system7_bfm_v2_0_5 -L blk_mem_gen_v8_3_3 -L xbip_utils_v3_0_6 -L c_reg_fd_v12_0_2 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_2 -L xbip_dsp48_addsub_v3_0_2 -L xbip_addsub_v3_0_2 -L c_addsub_v12_0_9 -L c_gate_bit_v12_0_2 -L xbip_counter_v3_0_2 -L c_counter_binary_v12_0_9 -L dist_mem_gen_v8_0_10 -L fifo_generator_v13_1_1 -L xbip_bram18k_v3_0_2 -L mult_gen_v12_0_11 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_9 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_9 -L axi_data_fifo_v2_1_8 -L axi_crossbar_v2_1_10 -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_2 -L lib_fifo_v1_0_5 -L fifo_generator_v13_0_3 -L axi_fifo_mm_s_v4_1_6 -L util_vector_logic_v2_0 -L axi_protocol_converter_v2_1_9 -lib xil_defaultlib xil_defaultlib.PS_PL xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {PS_PL.udo}

run -all

quit -force
