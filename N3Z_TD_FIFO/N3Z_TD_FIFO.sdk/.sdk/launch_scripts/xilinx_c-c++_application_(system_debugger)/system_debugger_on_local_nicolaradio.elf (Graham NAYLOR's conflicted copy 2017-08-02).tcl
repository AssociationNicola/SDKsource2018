connect -url tcp:127.0.0.1:3121
source /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent JTAG-HS2 210249A0CF17"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS2 210249A0CF17" && level==0} -index 1
fpga -file /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0/PS_PL_wrapper.bit
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent JTAG-HS2 210249A0CF17"} -index 0
loadhw /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent JTAG-HS2 210249A0CF17"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 210249A0CF17"} -index 0
dow /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/Debug/NicolaRadio.elf
bpadd -addr &main
