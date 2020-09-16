gcc -O3 -fomit-frame-pointer -funroll-loops binarytrees.c -o bin_c -lm
g++ -fomit-frame-pointer -funroll-loops -std=c++11 binarytrees.cpp -O3 -o bin_cpp
crystal build binarytrees.cr --release -o bin_cr

cython --embed binarytrees.py -o /tmp/cython.c
gcc -O3 -g -o bin_cython /tmp/cython.c -I/usr/include/python2.7/ -lpython2.7
cython3 --embed binarytrees.py -o /tmp/cython3.c
gcc -O3 -g -o bin_cython3 /tmp/cython3.c -I/usr/include/python3.8/ -lpython3.8
