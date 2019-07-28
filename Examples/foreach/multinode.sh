#!/bin/bash

#SBATCH -n 4

module load Apps/R Rpkgs/DOMPI

mpirun R --slave -f multinode.R
