source "scripts/helpers.tcl"
source "scripts/flow_helpers.tcl"
source "data/Nangate45/Nangate45.vars"

if {[llength $argv] > 0} {
  set design [lindex $argv 0]
} elseif {[info exists ::env(DESIGN_NAME)]} {
  set design $::env(DESIGN_NAME)
} else {
  puts "Error: Design name required. Usage: DESIGN_NAME=<design_name> openroad scripts/openroad_fast_flow.tcl"
  puts "  (OpenROAD does not pass extra arguments to scripts; use the env var.)"
  exit 1
}

set top_module $design
set synth_verilog "data/rtl/${design}_netlist.v"
set sdc_file "data/constraints.sdc"

set die_area {0 0 80 80}
set core_area {0 0 80 80}

source -echo "scripts/fast_flow.tcl"
