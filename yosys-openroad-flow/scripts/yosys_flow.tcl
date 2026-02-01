yosys -import
if {[llength $argv] > 0} {
  set DESIGN_NAME [lindex $argv 0]
} elseif {[info exists ::env(DESIGN_NAME)]} {
  set DESIGN_NAME $::env(DESIGN_NAME)
} else {
  puts "Error: Design name required. Usage: yosys -p \"tcl scripts/yosys_flow.tcl <design_name>\""
  puts "  or: DESIGN_NAME=<design_name> yosys -p \"tcl scripts/yosys_flow.tcl\""
  exit 1
}

set RTL_DIR "data/rtl"
set RTL_FILE "${RTL_DIR}/${DESIGN_NAME}.sv"
set NETLIST_FILE "${RTL_DIR}/${DESIGN_NAME}_netlist.v"
set LIBERTY_FILE "data/NangateOpenCellLibrary_typical.lib"

read_verilog -sv $RTL_FILE
hierarchy -top $DESIGN_NAME
flatten
yosys proc
techmap
opt
abc -fast -liberty $LIBERTY_FILE
write_verilog $NETLIST_FILE

