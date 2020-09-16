gcc -O3 -fomit-frame-pointer -funroll-loops pidigits.c -o bin_c -lgmp
crystal build pidigits.cr --release -o bin_cr

cython --embed pidigits.py -o /tmp/cython.c
gcc -O3 -g -o bin_cython /tmp/cython.c -I/usr/include/python2.7/ -lpython2.7
cython3 --embed pidigits.py -o /tmp/cython3.c
gcc -O3 -g -o bin_cython3 /tmp/cython3.c -I/usr/include/python3.8/ -lpython3.8


