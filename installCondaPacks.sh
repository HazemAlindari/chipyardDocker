#!/bin/bash

source "${HOME}/conda/etc/profile.d/conda.sh"
conda activate
conda install -y -n base conda-libmamba-solver
conda config --set solver libmamba
conda install -y -n base conda-lock==1.4.0
conda activate base