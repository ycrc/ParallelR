#!/bin/bash

#SBATCH -c 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=all

module load Apps/R Rpkgs/DOPARALLEL

R --slave -f ex4.R
