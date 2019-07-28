#!/bin/bash

#SBATCH -n 4 -N 1 -t 5:00
#SBATCH -p admintest 
#SBATCH --mail-type=all

module load Apps/R Rpkgs/RMPI Rpkgs/SNOW

mpirun -n 1 R --slave -f ex6_2.R
