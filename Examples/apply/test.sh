#!/bin/bash

#SBATCH --partition=day
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00

# Load R.
module load Apps/R/3.5.1-generic

# Run script.
R CMD BATCH test.R
~                                                                                                                                                      
~ 
