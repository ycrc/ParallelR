#!/bin/bash

#SBATCH -c 4 -t 0-1 -p admintest
##SBATCH --mail-type=all

module load Apps/R Rpkgs/DOPARALLEL

R --slave -f kmeans.R
