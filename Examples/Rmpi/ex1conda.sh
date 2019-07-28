#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=none

module purge
module load Tools/miniconda/4.5.4
source activate parallelR

mpirun R --slave -f ex1conda.R
