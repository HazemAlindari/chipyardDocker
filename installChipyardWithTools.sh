#!/bin/bash

source "${HOME}/conda/etc/profile.d/conda.sh"
conda activate base
git clone https://github.com/ucb-bar/chipyard.git
cd chipyard/
./build-setup.sh riscv-tools --skip-firesim --skip-marshal