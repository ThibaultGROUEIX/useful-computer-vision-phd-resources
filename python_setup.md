## Python setup on Ubuntu 16.04 (conda, notebooks...)

Go through the steps you deem useful and comment if some useful tools can be added!

### Dowload Anaconda  for linux :snake: 

```shell
wget -P ~/Downloads/ https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh
cd Downloads
bash Anaconda2-4.3.0-Linux-x86_64.sh 
```

Accept licence and path. 

### Update your Paths

Check that you see the line : ```export PATH="/home/your_name/anaconda2/bin:$PATH"``` at the end of your **.bashrc**

For some specific task, adding this line helps but most of the times it breaks down stuff. **So don't add it !**

:danger:

```shell
export PYTHONPATH="/home/your_name/anaconda2/lib/python2.7:$PYTHONPATH"
```

:danger:

Don't forget to source your **.bashrc** !

### Enable Autocompletion for "source activate"

Save in /etc/bash_completion.d/

```shell
# command: source
# Allow autocomplete for conda environments

_complete_source_activate_conda(){
      if [ ${COMP_WORDS[COMP_CWORD-1]} != "activate" ]
      then
          return 0
      fi
      local cur=${COMP_WORDS[COMP_CWORD]}
      COMPREPLY=($(ls ~/anaconda3/envs | xargs -I dirs bash -c "compgen -W dirs $cur"))
      return 0
}

complete -F _complete_source_activate_conda source
```



### Create relevant envs

```shell
conda create -n py27 python=2.7
conda create -n py36 python=3.6
```

You can use ```source activate env``` and  ```source deactivate```  to navigate.

### Create jupyter kernels

```shell
source activate py27
conda install notebook ipykernel
ipython kernel install --user

source activate py36
conda install notebook ipykernel
ipython kernel install --user
```

You can launch jupyter with ```jupyter notebook``` and check that you can create notebooks with python2.7 and python3.6.

### Get jupyter extensions

All the explanations are [here](https://github.com/ipython-contrib/jupyter_contrib_nbextensions)! You can hide some code (for exercises), convert from python2 to python3, get some notification when a cell finished running and much more...

```
conda install -c conda-forge jupyter_contrib_nbextensions
```

To enable the extensions : open a notebook and visit ``` http://localhost:8888/nbextensions```.

### Get autocompletion for pip

If you want to be able to hit 'tab' using pip, you're not the first one ! See the [repo webpage](https://github.com/ekalinin/pip-bash-completion) if you want to install this locally, and get more details on how to use it.

```shell
cd ~/lib
git clone https://github.com/ekalinin/pip-bash-completion.git
sudo cp ./pip-bash-completion/pip /etc/bash_completion.d/
. /etc/bash_completion.d/pip
```

You may now do ```pip ``` + tab !

### Update a package

```shell
source activate your_env
conda update my_package #can be conda to update conda itself, or python
#alternatively
pip install --upgrade my_package
```

It can be beneficial to use either pip or conda, because the latest version aren't neccessarily the same for each of them. For example, at the current time, the latest PyDot from conda is pydot-1.0.28 and the latest PyDot from pip is pydot-1.2.3



### Test environment to do Machine Learning

```shell
source activate py27
conda install matplotlib numpy scikit-learn pygame
pip install --upgrade pydot
```

You can test that everything is correctly set-up by lauching the following [file](https://github.com/ThibaultGROUEIX/workflow_and_installs/blob/master/test_python_setup.py) (created by [Nicolas Baskiotis](http://www-connex.lip6.fr/~baskiotisn/))  with ```python test_python_setup.py```

### Source :information_source:

[Anaconda website](https://www.continuum.io/downloads)

[stackoverflow](http://stackoverflow.com/questions/30492623/using-both-python-2-x-and-python-3-x-in-ipython-notebook)

[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/python_setup.md?pixel)](https://github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/)

