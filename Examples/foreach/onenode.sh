#!/bin/bash

module load Apps/R Rpkgs/DOPARALLEL

R --slave -f onenode.R
