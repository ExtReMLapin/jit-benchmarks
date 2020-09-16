#!/bin/bash

crystal build brainfuck.cr --release -o bin_cr --no-debug
g++ -O3 -o bin_cpp brainfuck.cpp

cython --embed brainfuck.py -o /tmp/cython.c
gcc -O3 -g -o bin_cython /tmp/cython.c -I/usr/include/python2.7/ -lpython2.7
cython3 --embed brainfuck.py -o /tmp/cython3.c
gcc -O3 -g -o bin_cython3 /tmp/cython3.c -I/usr/include/python3.8/ -lpython3.8
