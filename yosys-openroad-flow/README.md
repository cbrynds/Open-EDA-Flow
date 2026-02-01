# Synthesis + PnR Flow Example

This overviews performing synthesis and PnR on an arbitrary design.

## Directory Structure

```
yosys-openroad-flow/
├── scripts/                    # Flow scripts
│   ├── yosys_flow.tcl          # Synthesis (Yosys)
│   ├── openroad_flow.tcl       # PnR (OpenROAD)
│   ├── full_flow.tcl           # Full PnR flow
│   ├── fast_flow.tcl           # Fast PnR (exits before routing)
│   ├── flow_helpers.tcl        # PnR helper functions
│   └── helpers.tcl             # General helper functions
├── data/
│   ├── Nangate45/              # Nangate45 technology library
│   ├── constraints.sdc         # Minimal design constraints for OpenROAD
│   ├── NangateOpenCellLibrary_typical.lib  # Liberty for Yosys ABC
│   └── rtl/                    # RTL sources and outputs
├── results/                    # PnR outputs
└── README.md
```

## Usage

Run from the `yosys-openroad-flow` directory. Must be run within the Apptainer environment.

`apptainer shell --bind "$PWD":/workspace ../eda-flow.sif`

Specify the design (top module) name via command-line argument or environment variable. Place RTL as `data/rtl/{design}.sv` The netlist is written to `data/rtl/{design}_netlist.v`.

**Yosys** (argument must be inside the -p string, or use env var):

`yosys -p "tcl scripts/yosys_flow.tcl my_design"`

`DESIGN_NAME=my_design yosys -p "tcl scripts/yosys_flow.tcl"`

**OpenROAD** (use env var; OpenROAD does not pass extra args to scripts):

`DESIGN_NAME=my_design openroad scripts/openroad_flow.tcl` (Runs the flow with full place-and-route - most accurate)

`DESIGN_NAME=my_design openroad scripts/openroad_fast_flow.tcl` (Runs the flow without routing - much faster)

Results and reports are written to the `results` directory.