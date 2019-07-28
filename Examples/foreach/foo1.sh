#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=all

#doesn't work, incompativle with DOMPI
#module load Apps/R/3.1.1-generic

module load Apps/R/3.1.3-generic


module load Rpkgs/DOMPI

#module load Apps/R Rpkgs/DOMPI

mpirun R --slave -f foo.R
