#!/bin/bash

#SBATCH -n 4 -t 5:00
#SBATCH -p admintest 
#SBATCH --mail-type=all

module load Apps/R Rpkgs/DOMPI

mpirun -quiet -n 4 R --slave -f ex4mpi.R

