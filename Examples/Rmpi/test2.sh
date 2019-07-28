#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH -p admintest 
#SBATCH --mail-type=none

module load MPI/OpenMPI/2.1.1-gcc
#module load Apps/R/3.1.3-generic
#module load Rpkgs/RMPI/0.6.3-ompi-2.1.1

mpirun bash -c 'echo $SLURM_NTASKS' 
