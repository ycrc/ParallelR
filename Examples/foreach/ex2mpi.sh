#!/bin/bash

#SBATCH -n 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=all

module load Apps/R Rpkgs/DOMPI

R --slave -f ex2mpi.R
