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
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.cache/wt [current_project]
  set_property parent.project_path /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.xpr [current_project]
  set_property ip_repo_paths {
  /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.cache/ip
  /home/graham/Dropbox/SysgenOutput/TE0722/ip
  /home/graham/Dropbox/N3workingG/TE0722Rebuild/trenz.biz_user_JTAG_Monitor_1.0
} [current_project]
  set_property ip_output_repo /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.cache/ip [current_project]
  add_files -quiet /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.runs/synth_1/PS_PL_wrapper.dcp
  read_xdc -ref PS_PL_processing_system7_0_0 -cells inst /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_processing_system7_0_0/PS_PL_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_processing_system7_0_0/PS_PL_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PS_PL_clk_wiz_0_0 -cells inst /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_0/PS_PL_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_0/PS_PL_clk_wiz_0_0_board.xdc]
  read_xdc -ref PS_PL_clk_wiz_0_0 -cells inst /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_0/PS_PL_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_clk_wiz_0_0/PS_PL_clk_wiz_0_0.xdc]
  read_xdc -ref n3_te0722_fifo_generator_v12_0_0 -cells U0 /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3_te0722_0_0/n3_te0722_fifo_generator_v12_0_0/n3_te0722_fifo_generator_v12_0_0/n3_te0722_fifo_generator_v12_0_0.xdc
  set_property processing_order EARLY [get_files /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/bd/PS_PL/ip/PS_PL_n3_te0722_0_0/n3_te0722_fifo_generator_v12_0_0/n3_te0722_fifo_generator_v12_0_0/n3_te0722_fifo_generator_v12_0_0.xdc]
  read_xdc -ref PS_PL_n3_te0722_0_0 -cells U0 /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/ipshared/AssociationNicola/n3_te0722_v1_07/c5ea0f65/constrs/n3_te0722_clock.xdc
  set_property processing_order EARLY [get_files /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/ipshared/AssociationNicola/n3_te0722_v1_07/c5ea0f65/constrs/n3_te0722_clock.xdc]
  read_xdc -ref PS_PL_n3_te0722_0_0 -cells U0 /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/ipshared/AssociationNicola/n3_te0722_v1_07/c5ea0f65/constrs/n3_te0722.xdc
  set_property processing_order EARLY [get_files /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/sources_1/ipshared/AssociationNicola/n3_te0722_v1_07/c5ea0f65/constrs/n3_te0722.xdc]
  read_xdc /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.srcs/constrs_1/imports/VivadoProject/n3_te0722a5_clock.xdc
  link_design -top PS_PL_wrapper -part xc7z010clg225-1
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
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force PS_PL_wrapper_opt.dcp
  catch {report_drc -file PS_PL_wrapper_drc_opted.rpt}
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
  place_design 
  write_checkpoint -force PS_PL_wrapper_placed.dcp
  catch { report_io -file PS_PL_wrapper_io_placed.rpt }
  catch { report_clock_utilization -file PS_PL_wrapper_clock_utilization_placed.rpt }
  catch { report_utilization -file PS_PL_wrapper_utilization_placed.rpt -pb PS_PL_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file PS_PL_wrapper_control_sets_placed.rpt }
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
  catch { report_drc -file PS_PL_wrapper_drc_routed.rpt -pb PS_PL_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file PS_PL_wrapper_timing_summary_routed.rpt -rpx PS_PL_wrapper_timing_summary_routed.rpx }
  catch { report_power -file PS_PL_wrapper_power_routed.rpt -pb PS_PL_wrapper_power_summary_routed.pb }
  catch { report_route_status -file PS_PL_wrapper_route_status.rpt -pb PS_PL_wrapper_route_status.pb }
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
  write_bitstream -force PS_PL_wrapper.bit 
  if { [file exists /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.runs/synth_1/PS_PL_wrapper.hwdef] } {
    catch { write_sysdef -hwdef /home/graham/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/TE0722/TE0722.runs/synth_1/PS_PL_wrapper.hwdef -bitfile PS_PL_wrapper.bit -meminfo PS_PL_wrapper.mmi -file PS_PL_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

