#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=none

module load Apps/R/3.1.3-generic
module load Rpkgs/RMPI/0.6.3-ompi-2.1.1

mpirun R --slave -f ex1.R
