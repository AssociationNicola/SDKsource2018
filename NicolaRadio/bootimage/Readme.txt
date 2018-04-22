
From within the directory with the appropriate bin file, to program the flash type 
/opt/Xilinx/SDK/2016.2/bin/zynq_flash -f BOOT.bin -flash_type qspi_single -verify

Or with Vivado tools follow instructions in Program_N3Z_cave_radio.doc
Source code at https://github.com/AssociationNicola

BOOTTD20 Working version with Tone detect muting of the speaker supressed
BOOTTD21 Change filter multiplier to use round instead of truncate to improve out of band bleed through (problem on transmission due to feedback of antenna output capacitively onto mic input)
BOOTTD22 Add further low pass digital filtering on Mic input to try and improve RF supression.
BOOTTD23 RX and TX freq now set directly from the PS
BOOTTD24 Add option to store and forward audio if an SDcard is fitted to the FPGA board (slot between the 2 boards)

