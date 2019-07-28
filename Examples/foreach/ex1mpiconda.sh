#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=all

module load Tools/miniconda
source activate parallelRNew

mpirun R --slave -f ex1mpi.R
