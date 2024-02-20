#!/bin/bash

source "${HOME}/conda/etc/profile.d/conda.sh"
conda init
conda activate
cd chipyard/
./build-setup.sh riscv-tools --help