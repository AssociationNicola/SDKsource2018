proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "n3z_tonetest" "NUM_INSTANCES" "DEVICE_ID" "C_N3Z_TONETEST_S_AXI_BASEADDR" "C_N3Z_TONETEST_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "n3z_tonetest_g.c" "n3z_tonetest" "DEVICE_ID" "C_N3Z_TONETEST_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "n3z_tonetest" "DEVICE_ID" "C_N3Z_TONETEST_S_AXI_BASEADDR" "C_N3Z_TONETEST_S_AXI_HIGHADDR" 

}