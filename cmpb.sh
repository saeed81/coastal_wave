#!/bin/bash

rm -f *.mod

rm -f *.o

rm -f model

rm -f coef.txt

rm -f dcoef.txt


gfortran -ffixed-line-length-none -fdefault-real-8 -c solver_nobottom.f90

gfortran -ffixed-line-length-none -fdefault-real-8 -c rung_kutta_nobottom.f90 

gfortran -ffixed-line-length-none -fdefault-real-8 -o model rung_kutta_nobottom.o solver_nobottom.o  

omeg="$1"

./model "$1"

/opt/MATLAB/bin/matlab -nodisplay -nodesktop -nosplash -nojvm -r "sr;exit;" 

#&>/dev/null
