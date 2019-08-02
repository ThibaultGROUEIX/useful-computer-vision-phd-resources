#Manage EXR files

## View original exr format

### Install FLTK

Download from [here](from http://www.fltk.org/software.php) the latest version of FLTK (a modern GUI toolkit).

You'll need to make sure that **.local/bin** is in your **PATH** and **.local/lib** in your **LD_LIBRARY_PATH**.

```shell
cd Downloads/
wget http://fltk.org/pub/fltk/1.3.4/fltk-1.3.4-1-source.tar.gz
tar xvf fltk-1.3.4-1-source.tar.gz -C ~/lib/
cd ~/lib/fltk-1.3.4-1/
./configure --prefix ~/.local/
make -j8
make install
```



### OpenEXR viewer

```shell
cd Downloads/
wget http://download.savannah.nongnu.org/releases/openexr/ilmbase-2.2.0.tar.gz
wget http://download.savannah.gnu.org/releases/openexr/pyilmbase-2.2.0.tar.gz
wget http://download.savannah.nongnu.org/releases/openexr/openexr-2.2.0.tar.gz
wget http://download.savannah.nongnu.org/releases/openexr/openexr_viewers-2.2.0.tar.gz

tar xvf ilmbase-2.2.0.tar.gz -C ~/lib/
tar xvf pyilmbase-2.2.0.tar.gz -C ~/lib/
tar xvf openexr-2.2.0.tar.gz -C ~/lib/
tar xvf openexr_viewers-2.2.0.tar.gz -C ~/lib/

cd ~/lib/ilmbase-2.2.0/
./configure
make -j8
make install

#not a requirement
cd ~/lib/ilmbase-2.2.0/pyilmbase-2.2.0
sudo apt-get install libboost-all-dev
./configure
make -j8
sudo make install

cd ~/lib/openexr-2.2.0/
./configure
make -j8
sudo make install
 
cd ~/lib/openexr_viewers-2.2.0/
./configure
make -j8
make install
```

Now you can use ``` exrdisplay myfile.exr``` to view your exr file.

## EXRTools

```shell
cd Downloads/
wget http://scanline.ca/exrtools/exrtools-0.4.tar.gz
tar xvf exrtools-0.4.tar.gz -C ~/lib/
cd ~/lib/exrtools-0.4/
./configure
make -j8
sudo make install
```



## Blender

```shell
sudo add-apt-repository ppa:thomas-schiex/blender #Blender 2.78
sudo apt update && sudo apt install blender
```



## Python

```shell
conda install opencv
luarocks install cv
```

and from python :

```python
import cv2
import numpy as np
b = cv2.imread('myimage.exr',cv2.IMREAD_UNCHANGED)
np.shape(b)
```

From torch

```lua
local cv = require 'cv'
require 'cv.imgcodecs' 
loadType = cv.IMREAD_COLOR
src = cv.imread{'myimage.exr', loadType}
print(src:size())
```

## Convert format

```shell
sudo apt-get install imagemagick
#adapt
convert source.exr dest.png
```

# [![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/workflow_and_installs/Manage_EXR_files.md?pixel)](https://github.com/ThibaultGROUEIX/workflow_and_installs/)