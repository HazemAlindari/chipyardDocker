#!/bin/bash

source "${HOME}/conda/etc/profile.d/conda.sh"
conda init
conda activate
conda install -y -n base conda-libmamba-solver
conda config --set solver libmamba
conda install -y -n base conda-lock==1.4.0
conda activate base
cd chipyard/
git switch --detach 1.11.0
./build-setup.sh riscv-tools --skip-firesim --skip-marshal
cd ..
apt-get install verilator