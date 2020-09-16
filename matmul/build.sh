#!/bin/sh

crystal build matmul.cr --release -o bin_cr --no-debug
gcc -O3 -o bin_c matmul.c 

cython --embed matmul.py -o /tmp/cython.c
gcc -O3 -g -o bin_cython /tmp/cython.c -I/usr/include/python2.7/ -lpython2.7
cython3 --embed matmul.py -o /tmp/cython3.c
gcc -O3 -g -o bin_cython3 /tmp/cython3.c -I/usr/include/python3.8/ -lpython3.8
