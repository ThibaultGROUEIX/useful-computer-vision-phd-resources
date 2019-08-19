# Using Torch, with CUDA, CUDNN, Itorch.

I will assume you have succesfully installed CUDA already. If not, you can check [this](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/cuda_install.md) !



## Install Torch and Pytorch

You are going to have **git** correctly set up. If you are behind a firewall, you **need** to run :

> ```shell
> git config --global url."https://".insteadOf git://
> ```

You need a few package that are usually in the dependencies, but I once had a bug because they were not installed. So let's make sure they are installed.

```shell
sudo apt-get install cmake
sudo apt-get install libreadline-dev
```

Then install [torch](http://torch.ch/) with this command lines. It takes a few minutes.

```shell
git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; bash install-deps;
./install.sh
```

After the installation completes, you can check your new install of torch by entering in a new terminal : ```th```.

You can also install pytorch very easily by following the instructions on the [main website](http://pytorch.org/).

## Get Itorch

```shell
cd lib
git clone https://github.com/facebook/iTorch.git
cd iTorch
luarocks make 
```

## Useful torch packages

#### How to ?

Like this !

```shell
luarocks install image
luarocks list #If you want to display all the installed packages
```

#### Torchnet

Torchnet is an engine to train a network, load your dataset, create batches... with minimal code ! 

```shell
luarocks install torchnet
```
#### Optnet

A very useful package to reduce your memory comsumption while training a network.

```shell
sudo apt-get install graphviz
luarocks install optnet
```

#### Display

A super useful package to display images in your browser during training.

```
luarocks install display
```

Once it is installed, you can just run ``` th -ldisplay.start``` in  a terminal and in your lua script:

```Lua
disp = require 'display'
disp.image(monTenseur, {win = id, title="mytitle"})
```

#### Debugger

```shell
sudo apt-get install libedit-dev 
luarocks install https://raw.githubusercontent.com/bshillingford/fbdebugger-minimal/master/fbdebugger-standalone-1.rockspec 
```

Once the package is installed, you can just add the following piece of code anywhere to launch it.

```lua
local debugger = require('fb.debugger')
debugger.enter()
```

#### MATLAB

If you want to load and export ".mat" files from torch, there are to convenient packages to do this. One is matio and the other mattorch. I found mattorch to be more stable but it requires a Matlab installation on the machine.

```shell
sudo apt-get install libmatio2
luarocks install matio
luarocks install mattorch # install matlab first
```

If Matlab is not found, you can add to your *.bashrc* :  ``` export MATLAB_ROOT='/home/thibault/R2014a'```.

## CUDNN

It's a good idea to get cudnn because it's faster than cunn from torch. The option ```   cudnn.benchmark = true``` in your Lua code make cudnn look for the best way to perform convolution among all the different implemented technics. It's usually a nice speedup.

 The first step to get cudnn is to download cudnn from [Nvidia's webpage]() (membership connection required).

Then you have to make ***cudnn.h*** in the **PATH** environment variable and ***libcudnn*** in the **LD_LIBRARY_PATH** environment variable. I like to put them in the cuda repo to keep similar stuff together.

```shell
tar xvzf cudnn-8.0-linux-x64-v5.1.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```



You're all set to start using it to your heart content ! ;)



[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/torch_workflow.md?pixel)](https://github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/)