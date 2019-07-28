#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH -p admintest 
#SBATCH --mail-type=all

module load Apps/R Rpkgs/RMPI Rpkgs/SNOW

mpirun -n 1 R --vanilla -f ex0.R
