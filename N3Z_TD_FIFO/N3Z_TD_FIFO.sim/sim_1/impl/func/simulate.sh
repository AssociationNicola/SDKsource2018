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
ExecStep $xv_path/bin/xsim PS_PL_wrapper_func_impl -key {Post-Implementation:sim_1:Functional:PS_PL_wrapper} -tclbatch PS_PL_wrapper.tcl -log simulate.log
