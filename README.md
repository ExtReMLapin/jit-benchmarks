# Benchmark for interpreted languages implementations.

Most programs from [benchmarks game](https://benchmarksgame-team.pages.debian.net/benchmarksgame/index.html). All programs are chosen to be simplest, single-thread and without any low-level hacks. Also, the code for all languages trying to be implemented with one algorithm, use the same language constructs and containers, and be semantically similar to each other. The goal of the benchmark is to find the most successful JIT solutions. My other benchmarks: [Benchmarks](https://github.com/kostya/benchmarks), [Crystal Benchmarks Game](https://github.com/kostya/crystal-benchmarks-game).

Compare:
		
		* Ruby (MRI, MRI --jit, Graal, [Topaz](https://github.com/kostya/topaz), JRuby, Rbx)
		* Python (Cpython, Graal, Pypy, Cython, Jython)
		* Lua (JIT)
		* Javascript (Node, Graal)
		* C, Crystal as a basis

I temporarily delete rbx from the benchmark, because it too slow.

Running on AMD Ryzen 7 3800X, 16Gb DDR-4 3200 Mghz, host os Arch Linux, docker os Debian Testing.

Build Docker image (20min, 4.7Gb):

		docker build -t jit-bench - <Dockerfile

Enter into execution env:

		docker run -it --rm -v $(pwd):/src -w /src jit-bench

To run and build test:
```
cd TEST-NAME
sh build.sh
ruby run.rb
```

## Binarytrees
| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C++        | g++         | 1.08    | 1.10           | 34.9       |
| Crystal    |             | 1.31    | 1.31           | 64.6       |
| C          | gcc         | 2.21    | 2.21           | 33.4       |
| Ruby       | Topaz       | 4.50    | 4.52           | 102.3      |
| Javascript | Node        | 6.00    | 6.08           | 547.9      |
| Ruby       | JRuby       | 6.82    | 7.91           | 382.2      |
| Ruby       | GraalVM     | 6.86    | 6.88           | 541.0      |
| Ruby       | GraalVM_JVM | 7.56    | 9.33           | 839.3      |
| Javascript | GraalVM_JVM | 9.17    | 10.82          | 1111.6     |
| Python3    | Pypy        | 10.35   | 10.37          | 196.4      |
| Python2    | Pypy        | 10.60   | 10.63          | 220.5      |
| Ruby       | JIT         | 13.22   | 13.26          | 55.2       |
| Ruby       |             | 14.59   | 14.63          | 82.8       |
| Javascript | GraalVM     | 15.94   | 16.06          | 932.8      |
| Python3    | GraalVM_JVM | 21.89   | 25.19          | 1419.1     |
| Python3    | GraalVM     | 29.80   | 29.86          | 1022.0     |
| Lua        | JIT         | 36.40   | 36.52          | 627.8      |
| Python2    | Jython      | 58.01   | 59.21          | 1550.1     |
| Lua        |             | 187.62  | 190.01         | 1707.0     |
| Python3    |             | 194.06  | 194.10         | 202.6      |
| Python3    | Cython      | 221.80  | 221.85         | 203.2      |
| Python2    |             | 237.81  | 237.87         | 405.7      |
| Python2    | Cython      | 257.48  | 257.56         | 405.8      |


## Fannkuchredux


| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| Javascript | Node        | 2.33    | 2.38           | 35.8       |
| Crystal    |             | 2.59    | 2.60           | 3.1        |
| C          | gcc         | 2.66    | 2.66           | 0.5        |
| Lua        | JIT         | 3.36    | 3.36           | 2.3        |
| Javascript | GraalVM_JVM | 4.12    | 5.63           | 490.1      |
| Javascript | GraalVM     | 4.12    | 4.23           | 174.6      |
| Ruby       | GraalVM     | 5.25    | 5.27           | 364.3      |
| Ruby       | GraalVM_JVM | 5.40    | 7.03           | 524.0      |
| Ruby       | Topaz       | 5.66    | 5.68           | 30.1       |
| Python2    | Pypy        | 8.53    | 8.55           | 65.7       |
| Python3    | GraalVM_JVM | 8.63    | 11.96          | 678.4      |
| Python3    | Pypy        | 8.95    | 8.97           | 60.7       |
| Python3    | GraalVM     | 14.32   | 14.38          | 480.1      |
| Ruby       | JRuby       | 32.89   | 33.89          | 171.5      |
| Python2    | Cython      | 35.64   | 35.64          | 6.1        |
| Lua        |             | 36.05   | 36.06          | 1.2        |
| Python3    | Cython      | 42.65   | 42.66          | 7.8        |
| Python3    |             | 47.48   | 47.49          | 7.1        |
| Python2    |             | 48.72   | 48.73          | 6.3        |
| Python2    | Jython      | 56.62   | 57.71          | 422.5      |
| Ruby       | JIT         | 57.31   | 57.34          | 13.6       |
| Ruby       |             | 61.04   | 61.07          | 13.3       |


## Fasta

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C          | gcc         | 1.85    | 1.86           | 0.6        |
| Crystal    |             | 2.54    | 2.54           | 4.2        |
| Lua        | JIT         | 4.59    | 4.59           | 2.3        |
| Python2    | Pypy        | 8.84    | 8.86           | 68.3       |
| Python3    | Pypy        | 10.23   | 10.26          | 63.3       |
| Javascript | Node        | 10.28   | 10.40          | 40.3       |
| Ruby       | GraalVM_JVM | 10.97   | 12.63          | 686.0      |
| Ruby       | Topaz       | 12.19   | 12.21          | 50.6       |
| Ruby       | GraalVM     | 13.27   | 13.29          | 465.7      |
| Lua        |             | 13.53   | 13.53          | 2.6        |
| Python3    | GraalVM_JVM | 23.61   | 26.88          | 844.8      |
| Python3    |             | 29.17   | 29.18          | 7.2        |
| Python2    |             | 33.31   | 33.32          | 45.6       |
| Python2    | Cython      | 33.98   | 33.99          | 45.4       |
| Python3    | GraalVM     | 39.53   | 39.60          | 540.4      |
| Python3    | Cython      | 40.57   | 40.58          | 7.7        |
| Javascript | GraalVM_JVM | 46.38   | 49.91          | 693.7      |
| Ruby       | JIT         | 46.44   | 46.47          | 42.5       |
| Ruby       |             | 47.80   | 47.83          | 42.3       |
| Javascript | GraalVM     | 64.63   | 65.37          | 464.6      |
| Ruby       | JRuby       | 67.60   | 68.62          | 268.7      |
| Python2    | Jython      | 108.04  | 109.17         | 649.5      |

## Knucleotide

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| Lua        | JIT         | 1.93    | 1.95           | 46.4       |
| C++        | g++         | 4.41    | 4.41           | 31.5       |
| Python2    | Pypy        | 4.57    | 4.59           | 190.9      |
| Crystal    |             | 5.49    | 5.49           | 58.8       |
| Python3    | Pypy        | 8.27    | 8.29           | 207.8      |
| Lua        |             | 9.21    | 9.23           | 84.5       |
| Ruby       | Topaz       | 10.98   | 11.00          | 132.1      |
| Python2    | Cython      | 11.29   | 11.36          | 534.6      |
| Javascript | Node        | 11.62   | 11.68          | 163.5      |
| Python2    |             | 15.22   | 15.33          | 534.6      |
| Javascript | GraalVM_JVM | 17.93   | 19.50          | 793.0      |
| Ruby       | JRuby       | 20.21   | 21.26          | 326.0      |
| Python3    | Cython      | 20.36   | 20.38          | 72.2       |
| Python3    |             | 20.85   | 20.86          | 71.7       |
| Ruby       | JIT         | 20.90   | 20.94          | 65.9       |
| Python2    | Jython      | 22.71   | 23.87          | 1544.2     |
| Ruby       |             | 24.70   | 24.73          | 67.8       |
| Python3    | GraalVM_JVM | 27.14   | 31.50          | 1341.1     |
| Javascript | GraalVM     | 27.22   | 27.35          | 607.2      |
| Ruby       | GraalVM_JVM | 33.66   | 35.47          | 758.7      |
| Python3    | GraalVM     | 59.25   | 59.32          | 1482.8     |
| Ruby       | GraalVM     | 63.68   | 63.70          | 518.2      |

## Mandelbrot

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| Crystal    |             | 1.45    | 1.45           | 3.2        |
| C          | gcc         | 1.45    | 1.45           | 0.5        |
| Javascript | Node        | 1.52    | 1.58           | 87.6       |
| Lua        | JIT         | 1.64    | 1.64           | 0.9        |
| Python3    | Pypy        | 1.77    | 1.80           | 103.1      |
| Python2    | Pypy        | 1.81    | 1.83           | 107.2      |
| Ruby       | Topaz       | 3.13    | 3.14           | 27.1       |
| Javascript | GraalVM     | 4.19    | 4.32           | 428.1      |
| Python3    | GraalVM     | 4.19    | 4.25           | 462.1      |
| Javascript | GraalVM_JVM | 4.27    | 5.86           | 640.4      |
| Python3    | GraalVM_JVM | 4.95    | 8.51           | 646.8      |
| Ruby       | GraalVM     | 6.28    | 6.30           | 442.3      |
| Ruby       | GraalVM_JVM | 8.02    | 9.80           | 703.8      |
| Lua        |             | 24.13   | 24.14          | 1.2        |
| Python2    | Jython      | 41.09   | 42.23          | 524.3      |
| Ruby       | JIT         | 65.20   | 65.23          | 13.4       |
| Ruby       |             | 65.37   | 65.40          | 13.5       |
| Python2    | Cython      | 68.24   | 68.25          | 30.7       |
| Ruby       | JRuby       | 69.16   | 70.22          | 324.9      |
| Python3    | Cython      | 96.58   | 96.59          | 33.1       |
| Python3    |             | 98.16   | 98.18          | 31.4       |
| Python2    |             | 99.43   | 99.44          | 30.7       |

## NBody


| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C          | gcc         | 0.80    | 0.80           | 0.9        |
| Javascript | Node        | 0.87    | 0.92           | 37.0       |
| Crystal    |             | 1.00    | 1.00           | 3.1        |
| Lua        | JIT         | 1.28    | 1.28           | 0.9        |
| Ruby       | GraalVM     | 1.39    | 1.41           | 299.9      |
| Ruby       | GraalVM_JVM | 1.75    | 3.53           | 511.1      |
| Ruby       | Topaz       | 4.39    | 4.41           | 31.5       |
| Javascript | GraalVM     | 4.42    | 4.54           | 357.3      |
| Python3    | GraalVM_JVM | 4.62    | 8.24           | 651.8      |
| Python3    | GraalVM     | 5.37    | 5.44           | 286.0      |
| Javascript | GraalVM_JVM | 6.30    | 7.91           | 546.3      |
| Python3    | Pypy        | 6.89    | 6.91           | 62.6       |
| Python2    | Pypy        | 6.99    | 7.01           | 66.8       |
| Lua        |             | 29.03   | 29.05          | 1.3        |
| Python2    | Cython      | 29.57   | 29.61          | 317.6      |
| Ruby       | JIT         | 39.08   | 39.12          | 13.7       |
| Python3    | Cython      | 40.95   | 40.96          | 8.0        |
| Python2    | Jython      | 44.00   | 45.19          | 1002.0     |
| Ruby       |             | 50.50   | 50.54          | 13.4       |
| Python3    |             | 53.53   | 53.54          | 7.8        |
| Ruby       | JRuby       | 56.18   | 57.28          | 294.6      |
| Python2    |             | 63.39   | 63.47          | 317.8      |

## RegexDNA

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| Python3    | GraalVM_JVM | 0.00    | 5.27           | 1628.0     |
| Javascript | Node        | 1.30    | 1.42           | 486.4      |
| Python3    | GraalVM     | 1.66    | 1.91           | 2498.0     |
| Python2    | Pypy        | 2.08    | 2.10           | 215.4      |
| Python3    | Pypy        | 2.34    | 2.38           | 244.8      |
| Ruby       | Topaz       | 2.95    | 2.97           | 328.8      |
| Python3    |             | 4.87    | 4.88           | 118.8      |
| C          | gcc         | 4.89    | 4.90           | 74.4       |
| Crystal    |             | 4.91    | 4.92           | 122.3      |
| Ruby       |             | 5.08    | 5.12           | 95.1       |
| Ruby       | JIT         | 5.18    | 5.22           | 94.7       |
| Python2    |             | 5.69    | 5.70           | 95.0       |
| Python2    | Cython      | 5.76    | 5.77           | 120.0      |
| Python3    | Cython      | 5.89    | 5.91           | 112.7      |
| Python2    | Jython      | 7.42    | 8.60           | 1153.1     |
| Ruby       | JRuby       | 8.29    | 9.38           | 307.3      |
| Lua        |             | 8.65    | 8.66           | 344.3      |
| Lua        | JIT         | 9.93    | 9.94           | 165.7      |
| Ruby       | GraalVM_JVM | 11.78   | 13.72          | 947.3      |
| Ruby       | GraalVM     | 18.13   | 18.15          | 649.4      |
| Javascript | GraalVM_JVM | 19.35   | 21.01          | 946.2      |
| Javascript | GraalVM     | 29.22   | 29.37          | 1790.8     |

## Revcomp

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| Python3    | GraalVM_JVM | 0.00    | 17.43          | 1830.5     |
| Python2    | Jython      | 0.00    | 4.39           | 1547.0     |
| C          | gcc         | 0.41    | 0.42           | 147.4      |
| Python2    | Cython      | 1.90    | 1.92           | 830.6      |
| Python2    |             | 2.07    | 2.12           | 832.6      |
| Python3    |             | 2.11    | 2.13           | 1183.2     |
| Python3    | Cython      | 2.31    | 2.34           | 1183.5     |
| Python2    | Pypy        | 2.51    | 2.58           | 1335.0     |
| Lua        | JIT         | 2.66    | 2.68           | 406.1      |
| Javascript | Node        | 3.47    | 3.60           | 228.6      |
| Crystal    |             | 3.67    | 3.69           | 916.6      |
| Ruby       | JIT         | 3.92    | 3.96           | 156.9      |
| Ruby       |             | 3.98    | 4.02           | 156.7      |
| Ruby       | Topaz       | 4.43    | 4.46           | 733.8      |
| Python3    | Pypy        | 4.83    | 4.89           | 1272.7     |
| Ruby       | JRuby       | 5.64    | 6.72           | 873.3      |
| Lua        |             | 8.87    | 9.00           | 910.4      |
| Ruby       | GraalVM_JVM | 13.75   | 15.46          | 1419.3     |
| Javascript | GraalVM     | 15.03   | 15.17          | 829.6      |
| Ruby       | GraalVM     | 16.96   | 16.99          | 992.0      |
| Javascript | GraalVM_JVM | 20.77   | 22.84          | 1082.9     |
| Python3    | GraalVM     | 53.56   | 53.64          | 2997.4     |


## Pidigits

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C          | gcc         | 2.30    | 2.31           | 3.3        |
| Javascript | Node        | 3.31    | 3.37           | 38.2       |
| Javascript | GraalVM     | 5.03    | 5.19           | 433.1      |
| Javascript | GraalVM_JVM | 6.77    | 8.75           | 585.8      |
| Crystal    |             | 7.38    | 7.38           | 7.6        |
| Python2    |             | 8.88    | 8.89           | 8.0        |
| Python3    |             | 9.02    | 9.02           | 9.0        |
| Python2    | Cython      | 9.26    | 9.27           | 8.0        |
| Python3    | Cython      | 9.35    | 9.36           | 9.5        |
| Ruby       | Topaz       | 10.91   | 10.92          | 35.2       |
| Python2    | Pypy        | 11.68   | 11.70          | 70.6       |
| Python3    | Pypy        | 12.06   | 12.08          | 65.7       |
| Ruby       | JRuby       | 12.92   | 13.99          | 386.4      |
| Python2    | Jython      | 14.84   | 15.99          | 525.6      |
| Ruby       | GraalVM_JVM | 14.86   | 16.61          | 747.5      |
| Ruby       | JIT         | 15.83   | 15.87          | 163.2      |
| Ruby       |             | 15.86   | 15.90          | 161.8      |
| Ruby       | GraalVM     | 20.62   | 20.64          | 390.9      |

## Spectralnorm

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C          | gcc         | 1.21    | 1.21           | 0.9        |
| Javascript | Node        | 1.27    | 1.32           | 37.0       |
| Crystal    |             | 1.30    | 1.30           | 4.4        |
| Lua        | JIT         | 1.39    | 1.39           | 2.3        |
| Ruby       | GraalVM     | 2.60    | 2.62           | 299.7      |
| Ruby       | GraalVM_JVM | 3.13    | 4.90           | 525.0      |
| Javascript | GraalVM     | 3.75    | 3.87           | 351.8      |
| Javascript | GraalVM_JVM | 4.78    | 6.46           | 537.8      |
| Python2    | Pypy        | 7.83    | 7.84           | 67.0       |
| Python3    | Pypy        | 8.91    | 8.94           | 61.9       |
| Ruby       | Topaz       | 16.63   | 16.64          | 31.8       |
| Lua        |             | 67.92   | 67.92          | 2.7        |
| Python2    | Cython      | 88.57   | 88.58          | 7.7        |
| Ruby       | JRuby       | 119.55  | 120.61         | 384.2      |
| Ruby       | JIT         | 120.56  | 120.59         | 15.1       |
| Python3    | GraalVM_JVM | 122.38  | 125.75         | 775.6      |
| Ruby       |             | 152.99  | 153.02         | 14.7       |
| Python2    |             | 164.76  | 164.76         | 7.7        |
| Python3    | Cython      | 200.36  | 200.37         | 9.4        |
| Python3    |             | 203.09  | 203.10         | 8.8        |
| Python3    | GraalVM     | 256.66  | 256.72         | 526.4      |
| Python2    | Jython      | 475.51  | 476.63         | 406.0      |


## Brainfuck

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C++        | g++         | 2.28    | 2.28           | 1.5        |
| Crystal    |             | 4.76    | 4.77           | 3.1        |
| Javascript | Node        | 5.38    | 5.44           | 35.9       |
| Python2    | Pypy        | 7.79    | 7.81           | 61.9       |
| Python3    | Pypy        | 10.08   | 10.13          | 59.8       |
| Ruby       | Topaz       | 17.85   | 17.87          | 29.0       |
| Ruby       | GraalVM_JVM | 22.15   | 23.87          | 559.0      |
| Ruby       | GraalVM     | 22.89   | 22.91          | 387.3      |
| Javascript | GraalVM_JVM | 43.66   | 45.27          | 621.2      |
| Javascript | GraalVM     | 59.78   | 59.91          | 405.0      |
| Ruby       | JIT         | 103.07  | 103.10         | 13.5       |
| Python3    | GraalVM_JVM | 113.79  | 117.87         | 988.4      |
| Ruby       | JRuby       | 116.74  | 117.81         | 234.2      |
| Ruby       |             | 122.93  | 122.97         | 13.3       |
| Python2    | Cython      | 179.15  | 179.16         | 6.3        |
| Python3    | Cython      | 202.92  | 202.94         | 8.9        |
| Python2    |             | 220.82  | 220.83         | 6.3        |
| Python3    |             | 235.10  | 235.11         | 7.8        |
| Python2    | Jython      | 307.53  | 308.73         | 402.3      |
| Python3    | GraalVM     | 398.31  | 398.54         | 546.3      |

## Brainfuck2

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C          | gcc         | 1.33    | 1.33           | 0.6        |
| Crystal    |             | 2.05    | 2.05           | 3.2        |
| Javascript | Node        | 3.91    | 3.96           | 36.1       |
| Lua        | JIT         | 6.31    | 6.31           | 2.2        |
| Ruby       | GraalVM     | 10.97   | 11.01          | 471.8      |
| Python3    | Pypy        | 11.32   | 11.38          | 62.8       |
| Python2    | Pypy        | 11.50   | 11.52          | 67.0       |
| Python3    | GraalVM_JVM | 11.50   | 15.54          | 774.5      |
| Ruby       | GraalVM_JVM | 12.16   | 14.10          | 764.2      |
| Python3    | GraalVM     | 12.70   | 12.93          | 557.5      |
| Javascript | GraalVM     | 15.64   | 15.77          | 410.3      |
| Javascript | GraalVM_JVM | 16.11   | 17.72          | 604.7      |
| Ruby       | Topaz       | 24.83   | 24.85          | 31.7       |
| Ruby       | JIT         | 58.85   | 58.89          | 13.6       |
| Lua        |             | 68.01   | 68.02          | 1.3        |
| Ruby       | JRuby       | 93.02   | 94.27          | 237.8      |
| Ruby       |             | 96.38   | 96.42          | 13.3       |
| Python3    |             | 154.20  | 154.22         | 7.8        |
| Python2    | Cython      | 155.92  | 155.93         | 6.6        |
| Python2    |             | 159.66  | 159.67         | 6.1        |
| Python3    | Cython      | 172.94  | 172.96         | 8.9        |
| Python2    | Jython      | 186.77  | 187.97         | 406.2      |

## Matmul

| Language   | Interpreter | Time, s | Script Time, s | Memory, Mb |
|------------|-------------|---------|----------------|------------|
| C          | gcc         | 2.60    | 2.60           | 69.9       |
| Crystal    |             | 2.71    | 2.71           | 63.4       |
| Javascript | Node        | 3.02    | 3.08           | 106.2      |
| Lua        | JIT         | 3.39    | 3.40           | 98.6       |
| Python2    | Pypy        | 3.56    | 3.58           | 129.9      |
| Python3    | Pypy        | 3.59    | 3.66           | 127.4      |
| Python3    | GraalVM_JVM | 25.20   | 29.28          | 692.5      |
| Python3    | GraalVM     | 27.19   | 27.41          | 592.0      |
| Ruby       | GraalVM     | 30.52   | 30.54          | 570.1      |
| Ruby       | GraalVM_JVM | 35.70   | 37.44          | 851.7      |
| Ruby       | Topaz       | 42.31   | 42.34          | 240.9      |
| Javascript | GraalVM_JVM | 58.96   | 60.73          | 605.7      |
| Lua        |             | 88.26   | 88.28          | 190.2      |
| Python2    | Cython      | 94.20   | 94.21          | 76.1       |
| Javascript | GraalVM     | 101.03  | 101.16         | 457.7      |
| Ruby       | JIT         | 138.19  | 138.23         | 82.9       |
| Python3    | Cython      | 152.07  | 152.09         | 78.0       |
| Ruby       |             | 175.59  | 175.62         | 82.5       |
| Python2    |             | 192.34  | 192.35         | 76.1       |
| Python3    |             | 223.27  | 223.29         | 77.9       |
| Ruby       | JRuby       | 391.16  | 392.30         | 1025.9     |
| Python2    | Jython      | 863.52  | 864.68         | 492.8      |


## Versions: 
* `Python 2.7.18`
* `Python 3.8.5`
* `Crystal 0.35.1 [5999ae29b] (2020-06-19)`
* `gcc (Debian 10.2.0-7) 10.2.0`
* `g++ (Debian 10.2.0-7) 10.2.0`
* `Lua 5.3.3  Copyright (C) 1994-2016 Lua.org, PUC-Rio`
* `LuaJIT 2.1.0-beta3 -- Copyright (C) 2005-2017 Mike Pall. http://luajit.org/`
* `Nodejs v12.18.3`
* `ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]`
* `topaz (ruby-2.4.0p0) (git rev 9cba3561) (kostya build: https://github.com/kostya/topaz) [x86_64-linux]`
* `jruby 9.2.13.0 (2.5.7) 2020-08-03 9a89c94bcc OpenJDK 64-Bit Server VM 14.0.2+12-Debian-1 on 14.0.2+12-Debian-1 +jit [linux-x86_64]`
* `Cython version 0.29.21`
* `Cython version 0.29.21`
* `truffleruby 20.2.0, like ruby 2.6.6, GraalVM CE Native [x86_64-linux]`
* `truffleruby 20.2.0, like ruby 2.6.6, GraalVM CE JVM [x86_64-linux]`
* `Python 2.7.13 (d0d41085a83c, Apr 06 2020, 17:09:17) [PyPy 7.3.1 with GCC 7.3.1 20180303 (Red Hat 7.3.1-5)]`
* `Python 3.6.9 (2ad108f17bdb, Apr 07 2020, 02:59:05) [PyPy 7.3.1 with GCC 7.3.1 20180303 (Red Hat 7.3.1-5)]`
* `openjdk version "14.0.2" 2020-07-14`
* `Python 3.8.2 (GraalVM CE Native 20.2.0)`
* `Python 3.8.2 (GraalVM CE JVM 20.2.0)`
* `GraalNode v12.18.0`
* `Jython 2.7.2`

