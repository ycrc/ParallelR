#!/bin/bash

#SBATCH -c 4 -t 5:00
#SBATCH -p scavenge
#SBATCH --mail-type=all

module load Apps/R 

R --slave -f ex5.R
