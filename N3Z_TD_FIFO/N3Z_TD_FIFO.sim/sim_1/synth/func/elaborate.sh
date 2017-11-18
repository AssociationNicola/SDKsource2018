#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 2b1f2d082a6144baba7d48292035d18e -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L secureip --snapshot PS_PL_wrapper_func_synth xil_defaultlib.PS_PL_wrapper xil_defaultlib.glbl -log elaborate.log
