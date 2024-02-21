#!/bin/bash

wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}/conda"
source "${HOME}/conda/etc/profile.d/conda.sh"
conda activate
conda install -y -n base conda-libmamba-solver
conda config --set solver libmamba
conda install -y -n base conda-lock==1.4.0
conda activate base
git clone https://github.com/ucb-bar/chipyard.git
cd chipyard/
git switch --detach 1.11.0
./build-setup.sh riscv-tools --skip-firesim --skip-marshal