# Benchmarking your HDD or SSD and your NVIDIA-GPU

#### Disk

We are going to benchmark the speed of reading of your disk.
First find where is mounted your disk with the "Disks" GUI application. It should be something like */dev/YOUR_DISK* .
You can now start the benchmark.

``` sh
$ sudo hdparm -Tt /dev/YOUR_DISK
```


Disk | Timing cached reads | Timing buffered disk reads
--- | --- | ---
*serveur SSD (Samsung 960 EVO 1 To)  * | 10881 MB/sec | 795 MB/sec
*serveur SSD (Samsung SSD 850 PRO 512GB) * | 11703 MB/sec | 513 MB/sec
*serveur HDD ( Western Digital Red WDC WD30EFRX-68EUZN0)* | 11404 MB/sec | 152 MB/sec 
*On my laptop SSD* | 10737 MB/sec | 1273 MB/sec 
*On my laptop HDD* | 10420 MB/sec | 135 MB/sec



#### GPU NVIDIA
I assume that you have a Nvidia GPU with Cuda installed. If not [install cuda 8](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/torch_workflow.md).

Cuda comes with a set of samples that allow you to test your GPU. You need to compile them first.
``` sh
$ cd /usr/local/cuda/samples/
$ make
```
Or if you have n processors :
``` sh
$ make -jn
```

Then find the executable and launch a Benchmark :
``` sh
$ cd ./bin/x86_64/linux/release/
$ ./nbody -benchmark -numbodies=256000
```

Here are the results for different GPU I encountered in my life. Feel free to send me your result, I will add them.

GPU | cuda | total time for 10 iterations (ms) | billion interactions per second | single-precision GFLOP/s at 20 flops per interaction
--- | --- | --- | --- | ---
*TITAN X (Pascal)* | 10 | 1656 | 395 | 7910
*TITAN X (Pascal)* | 9 | 1664 | 393 | 7875
*TITAN X (Pascal)* | 8 | 1727 | 379 | 7589
*GeForce GTX TITAN X* | 8 | 3688 | 177 | 3553
*GTX970M* | 8 | 9148 | 71 | 1432

#CPU
* Macbook pro
``` sh
sysbench --test=cpu --cpu-max-prime=20000 run
WARNING: the --test option is deprecated. You can pass a script name or path on the command line without any options.
sysbench 1.0.7 (using bundled LuaJIT 2.1.0-beta2)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Prime numbers limit: 20000

Initializing worker threads...

Threads started!


General statistics:
    total time:                          10.0009s
    total number of events:              4135

Latency (ms):
         min:                                  2.21
         avg:                                  2.42
         max:                                  4.40
         95th percentile:                      3.07
         sum:                               9999.11

Threads fairness:
    events (avg/stddev):           4135.0000/0.00
    execution time (avg/stddev):   9.9991/0.00
``` 
* MSI Ghost Pro
``` sh
Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 20000


Test execution summary:
    total time:                          33.8106s
    total number of events:              10000
    total time taken by event execution: 33.8093
    per-request statistics:
         min:                                  2.87ms
         avg:                                  3.38ms
         max:                                  9.74ms
         approx.  95 percentile:               9.34ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   33.8093/0.00

``` 

[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/workflow_and_installs/benchmark.md?pixel)](https://github.com/ThibaultGROUEIX/workflow_and_installs/)
