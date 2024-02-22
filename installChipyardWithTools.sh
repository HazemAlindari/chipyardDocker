#!/bin/bash

source "${HOME}/conda/etc/profile.d/conda.sh"
conda activate base
git clone https://github.com/ucb-bar/chipyard.git
cd chipyard/
git fetch --tags
latestTag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
git switch --detach $latestTag
./build-setup.sh riscv-tools --skip-firesim --skip-marshal