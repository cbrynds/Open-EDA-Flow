# Synthesis + PnR Flow Example

This example overviews performing synthesis and PnR on an RL-generated 32b adder.

## Files in this directory:
- `adder_32b.v`: Verilog file for RL-generated adder generated
- `adder_nangate45_adder_32b.sdc`: Constraints file
- `fast_flow.tcl`: Fast PnR flow. Reports metrics and exits prior to routing
- `flow_helpers.tcl`: Taken from OpenROAD/test/ directory. Containers helper functions for PnR
- `full_flow.tcl`: PnR flow
- `helpers.tcl`: More helper functions taken from OpenROAD/test/ directory
- `NangateOpenCellLibrary_typical.lib`: Nangate45 technology library, taken from ArithTreeRL repo
- `openroad_flow.tcl`: OpenROAD flow script
- `README.md`: This file
- `yosys_flow.tcl`: Synthesis flow script

## Usage:

(Must be run within the Apptainer environment)

`apptainer shell --bind "$PWD":/workspace ./openroad.sif`

`cd prefix-flow`

`yosys -s yosys_flow.tcl`

`openroad openroad_flow.tcl`

Results and reports are added to the newly-created `results` directory.