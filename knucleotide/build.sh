if [ ! -f 1.txt ]; then
	sh generate.sh
fi

#gcc -O3 -fomit-frame-pointer -o bin_c knucleotide.c
g++ -O3 -fomit-frame-pointer -o bin_cpp knucleotide.cpp
crystal build knucleotide.cr --release -o bin_cr

cython --embed knucleotide.py -o /tmp/cython.c
gcc -O3 -g -o bin_cython /tmp/cython.c -I/usr/include/python2.7/ -lpython2.7
cython3 --embed knucleotide.py -o /tmp/cython3.c
gcc -O3 -g -o bin_cython3 /tmp/cython3.c -I/usr/include/python3.8/ -lpython3.8

