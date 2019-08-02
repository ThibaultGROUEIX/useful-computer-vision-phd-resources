# Meshlab

There is an incompatibility between US and UE version which is very annoying (notice it by "unexpected eof" when you try to import a mesh). It is best to use the US version. Associated is a python file to write and read .ply files for meshlab. The difference is essentially , against .



To install the US version :

```shell
export LANG=C
git clone https://github.com/cnr-isti-vclab/meshlab.git
cd meshlab
cd external && mkdir build && cd build
qmake ../external.pro && make 
cd ../../ && mkdir build && cd build
#replace in meshlab_full.pro line 153 by "+linux-g++:LIBS += -L../../src/external/lib/linux-g++ -ljhead -L../distrib -lcommon -lGLU"
#from https://github.com/eboudrand/meshlab/commit/1e8f64b3457f3fddef1cd081d7d47e40f0d8c728

qmake ../meshlab_full.pro && make
```

