gcc -O3 -ffast-math -fomit-frame-pointer -funroll-loops mandelbrot.c -o bin_c
crystal build mandelbrot.cr --release -o bin_cr


cython --embed mandelbrot.py -o /tmp/cython.c
gcc -O3 -g -o bin_cython /tmp/cython.c -I/usr/include/python2.7/ -lpython2.7
cython3 --embed mandelbrot.py -o /tmp/cython3.c
gcc -O3 -g -o bin_cython3 /tmp/cython3.c -I/usr/include/python3.8/ -lpython3.8


