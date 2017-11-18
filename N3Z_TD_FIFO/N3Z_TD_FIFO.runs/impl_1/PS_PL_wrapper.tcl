proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.cache/wt [current_project]
  set_property parent.project_path /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.xpr [current_project]
  set_property ip_repo_paths {
  /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.cache/ip
  /home/gnaylor/Dropbox/cores
  /home/gnaylor/Dropbox/SysgenOutput/TE0722/ToneDetect2
} [current_project]
  set_property ip_output_repo /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.runs/synth_1/PS_PL_wrapper.dcp
  read_xdc -ref PS_PL_processing_system7_0_0 -cells inst /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_processing_system7_0_0/PS_PL_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_processing_system7_0_0/PS_PL_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PS_PL_clk_wiz_0_1 -cells inst /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_1/PS_PL_clk_wiz_0_1_board.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_1/PS_PL_clk_wiz_0_1_board.xdc]
  read_xdc -ref PS_PL_clk_wiz_0_1 -cells inst /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_1/PS_PL_clk_wiz_0_1.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_1/PS_PL_clk_wiz_0_1.xdc]
  read_xdc -ref n3z_tonetest_fifo_generator_v13_1_i0 -cells U0 /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i0/n3z_tonetest_fifo_generator_v13_1_i0/n3z_tonetest_fifo_generator_v13_1_i0.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i0/n3z_tonetest_fifo_generator_v13_1_i0/n3z_tonetest_fifo_generator_v13_1_i0.xdc]
  read_xdc -ref n3z_tonetest_fifo_generator_v13_1_i1 -cells U0 /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i1/n3z_tonetest_fifo_generator_v13_1_i1/n3z_tonetest_fifo_generator_v13_1_i1.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/n3z_tonetest_fifo_generator_v13_1_i1/n3z_tonetest_fifo_generator_v13_1_i1/n3z_tonetest_fifo_generator_v13_1_i1.xdc]
  read_xdc -ref PS_PL_n3z_tonetest_0_0 -cells inst /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/constrs/n3z_tonetest.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3z_tonetest_0_0/constrs/n3z_tonetest.xdc]
  read_xdc -prop_thru_buffers -ref PS_PL_rst_clk_wiz_0_49M_0 -cells U0 /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_rst_clk_wiz_0_49M_0/PS_PL_rst_clk_wiz_0_49M_0_board.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_rst_clk_wiz_0_49M_0/PS_PL_rst_clk_wiz_0_49M_0_board.xdc]
  read_xdc -ref PS_PL_rst_clk_wiz_0_49M_0 -cells U0 /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_rst_clk_wiz_0_49M_0/PS_PL_rst_clk_wiz_0_49M_0.xdc
  set_property processing_order EARLY [get_files /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/sources_1/bd/PS_PL/ip/PS_PL_rst_clk_wiz_0_49M_0/PS_PL_rst_clk_wiz_0_49M_0.xdc]
  read_xdc /home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.srcs/constrs_1/imports/VivadoProject/n3_te0722a5_clock.xdc
  link_design -top PS_PL_wrapper -part xc7z010clg225-1
  write_hwdef -file PS_PL_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force PS_PL_wrapper_opt.dcp
  report_drc -file PS_PL_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force PS_PL_wrapper_placed.dcp
  report_io -file PS_PL_wrapper_io_placed.rpt
  report_utilization -file PS_PL_wrapper_utilization_placed.rpt -pb PS_PL_wrapper_utilization_placed.pb
  report_control_sets -verbose -file PS_PL_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force PS_PL_wrapper_routed.dcp
  report_drc -file PS_PL_wrapper_drc_routed.rpt -pb PS_PL_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file PS_PL_wrapper_timing_summary_routed.rpt -rpx PS_PL_wrapper_timing_summary_routed.rpx
  report_power -file PS_PL_wrapper_power_routed.rpt -pb PS_PL_wrapper_power_summary_routed.pb -rpx PS_PL_wrapper_power_routed.rpx
  report_route_status -file PS_PL_wrapper_route_status.rpt -pb PS_PL_wrapper_route_status.pb
  report_clock_utilization -file PS_PL_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force PS_PL_wrapper.mmi }
  write_bitstream -force PS_PL_wrapper.bit 
  catch { write_sysdef -hwdef PS_PL_wrapper.hwdef -bitfile PS_PL_wrapper.bit -meminfo PS_PL_wrapper.mmi -file PS_PL_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

