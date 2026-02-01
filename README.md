# OpenROAD Apptainer Image Usage Instructions 

from `/Open-EDA-Flow/` change script permissions

`chmod +x scripts/*.sh`

build the image

`scripts/build_sif.sh --def eda-flow.def --out eda-flow.sif`

open a shell in the apptainer environment

`apptainer shell --bind "$PWD":/workspace ./eda-flow.sif`

