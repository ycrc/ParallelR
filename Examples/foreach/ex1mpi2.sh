#!/bin/bash

#SBATCH -n 4 -N 2 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=all

module load Apps/R Rpkgs/DOMPI

mpirun R --slave -f ex1mpi.R
