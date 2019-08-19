# Initial steps after installing Ubuntu 16.04

You can follow this guide or download the script [initial_steps.sh](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/initial_steps.sh) and run it *line by line*, to check that no error occurs. Make sure to have a good internet connexion, because you'll be waiting for downloads most of the time otherwise.

The following are the packages I use. if you don't want them, or have no use for them, just skip the section. It's not a good idea to install random packages. It takes some space uselessly.

This should take about 15 minutes.

### Install **Minimal Ubuntu Packages**

  ``` sh
  $ sudo apt-get install ubuntu-minimal
  $ sudo apt-get install ubuntu-standard
  $ sudo apt-get install ubuntu-desktop 
  ```

### Update and upgrade

Add a few repos to keep things updated.

 ``` sh
$ sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
$ sudo add-apt-repository -y ppa:tuxpoldo/btsync
$ sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily
$ sudo add-apt-repository -y ppa:stefansundin/truecrypt
$ sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
 ```

And update, upgrade all your packages. This can take some time.

``` sh
$ sudo apt-get update
$ sudo apt-get upgrade
```

### Install **Sublime-Text-3** (very optional)

Let's put it that way, if you plan on using sublime-text-3 regularly, then follow this part because the rest will be faster. Otherwise, just skip it :)

``` sh
$ sudo add-apt-repository ppa:webupd8team/sublime-text-3
$ apt-get update
$ sudo apt-get install sublime-text-installer
```

At this point, you have to open Sublime and hit 'ctrl'+'shift'+'p' and type 'install package'. Click enter to install the package manager.
``` sh
$ subl
```

If you want to get my configuration of sublimes in a few clicks, you can do the following :

``` sh
$ sudo apt-get -y install git
$ cd ~/.config/sublime-text-3
$ git init
$ git remote add origin git@bitbucket.org:ThibaultGROUEIX/st3-settings.git
$ git fetch
$ git reset --hard origin/master
```

With the last line, the existing setting files will be overwritten by those from my repository. I use (right now): *Better Build System, Boxy Theme, BracketHighlighter, Calculate, Clickable URLs, Color Highlighter, FileSystem Autocompletion, GNU Octave Completions, Google Spell Check, Gremlins, HighlightWords, Inc-Dec-Value, LaTeX Snippets, LaTeXing, Markdown Preview, Matlab Completions, Package Control, SendREPL, SendText, SendTextPlus, SublimeGit, SublimeLinter, SyntaxHighlightTools*.

You can experience some **issues** with sublime because it has to install all the packages. So open it and close it a few times until the display is bug-free.

I install sublime-text at this point for **sendTextPlus** which allow you to send a line from sublime to your terminal and run it by 'ctrl'+'enter'. I find it convenient to just open the [script associated](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/initial_steps.sh) with this post, and run each line with 'ctrl'+'enter', while checking that everything is going smoothly.

To enable **sendTextPlus**, you need to install a Package:
``` sh
$ sudo apt-get install xdotool #to enable sendTextPlus
```

### Install **Chrome**

(or you can stick to firefox, which is better. I use chrome because I'm used to it.)

``` sh
$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
$ sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
$ sudo apt-get update
$ sudo apt-get install google-chrome-stable
```

Then you can install useful extension on Chrome. I use Ghostery to stop trackers and Addblock to stop pop-ups. I also use MySms to send texts from my browser.

If you can't open external links (open a new window but not the link). Follow [this](http://askubuntu.com/questions/689449/external-links-are-opened-as-blank-tabs-in-new-browser-window-in-chrome).

In ```.local/share/application/google-chrome.desktop``` :

```shell
#Replace
Exec=/opt/google/chrome/chrome
#with
Exec=/opt/google/chrome/chrome %U
```

### Small useful things

#### **Htop** -- monitor your CPU
``` sh
$ sudo apt-get install htop
```
Running htop in a terminal shows you the state of your processors and RAM, as well as all you process and info about them. It's GREAT.

#### **MC** -- monitor your disks
``` sh
$ sudo apt-get install mc
```
Running mc in a terminal shows you the state of your hard-drive. I use it to monitor the size of each folder. ('ctrl'+'space' on a folder to compute its size)

#### **Dropbox** -- save and share your data

``` sh
$ sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
$ ~/.dropbox-dist/dropboxd
```

I don't present this famous useful online data storage. I use it to backup some files and share them. 
Sometimes the deamon Dropbox isn't launch automatically on start-up. If that is the case for you, you should open start-up application -> add a new daemon with command line ->  "~/.dropbox-dist/dropboxd"

#### **Gimp** -- edit pictures
``` sh
$ sudo apt-get install -y gimp
```

#### **pdftk** -- edit pdf files
Always the same ...

``` sh
$ sudo apt-get install -y pdftk
```

pdftk is a really convenient tool for editing pdf files. You can easily burst a multi page pdf into separate files, concatenate them, rotate a page and much more if you are a more advanced user.

The command I use most are :

``` sh
$ pdftk in.pdf cat 1east 2-end output out.pdf
$ pdftk input1.pdf input2.pdf cat output join.pdf
$ pdftk in.pdf burst
```

#### **xsane** -- scan files

``` sh
$ sudo apt-get install -y xsane
```

xsane is a good tool to scan a file. You can connect *most* scanner without any worries.

#### **VLC (Video)** -- Watch videos

``` sh
$ sudo apt-get install vlc
```

#### **Skype** -- call you friends

Visit this [website](https://www.skype.com/en/download-skype/skype-for-linux/downloading-web/?type=weblinux-deb) and download the package.

You can install it with the GUI or :

``` sh
$ sudo dpkg -i DEB_PACKAGE
$ sudo apt-get install -f #for missing dependencies
```

It's possible that your webcam isn't enabled. You can enable it with 'fn'+'webcam-button'. The 'webcam-button' vary from laptop to laptop. Each time you strike this configuration, it adds/removes the device in hardware as if it has been physically connected/disconnected. You can watch /dev/video0 appear and disappear.

#### **Inkscape** -- Make nice illustrations

``` sh
$ sudo apt-get install inkscape
```

Inkscape is a very useful package to create figures, and illustrations. It has a useful "latex" plug-in.

#### **ffmpeg** -- create videos from frames

``` sh
$ sudo apt-get install ffmpeg
```

ffmpeg is really useful and unavoidable to manipulate videos and frames. I use it to create videos from multiple frames to show the evolution of a phenomenon captured at different moment in time.
I have created [this](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/make_video_out_frames.md) small script to do just that. 

#### **byobu** -- Don't get lost in your terminals

Byobu allows you to have multiple panels in your terminal just like your browser. It's actually very useful if you need a lot of them.

``` sh
$ sudo apt-get install byobu
$ byobu-enable #on server, when connecting via ssh, will automatically launch byobu
```

You can add this line to your ~/.bashrc to have color-prompt in byobu, which looks nicer:

``` sh
[ -r /home/user/.byobu/prompt ] && . /home/user/.byobu/prompt
```

#### **gparted** -- manage partition

``` sh
$ sudo apt-get install gparted
```
GParted is a useful tool to manage your partition. I have used it to install Ubuntu alongside windows [here](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/dual_boot.md)

#### **synaptic** -- manage packages

``` sh
$ sudo apt-get install synaptic
```
Synaptic is a package manager that allows to install packages with a GUI. I use it because it's one of the easiest way to see which package are already installed on the machine.



### tasque -- TO DO List Gui

It's always useful to keep a todo list !

```shell
sudo apt-get install tasque
```



# GCC G++

## Install and configure

```shell
sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo apt-get install gcc-4.8 gcc-4.9 gcc-5 gcc-6 g++-4.8 g++-4.9 g++-5 g++-6

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 30
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 40

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 40

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++
```

```shell
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```



### ISUTF8

Check if a file is in utf8 format and stops at first error;

```shell
sudo apt-get install moreutils
isutf8 file
```



### Benchmark

If you want to test your new hardware, or see of it decays over time, check the [dedicated post](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/benchmark.md) ! ;) 


### Add new user on your machine

Especially if you are setting up a server, which will be used by many people. You can easily add a new user : 

``` sh
$ sudo su
$ adduser my_new_user
```

If you want to grant him administrative rights :

``` sh
$ usermod -aG sudo my_new_user
```

You can test the new account : 

``` sh
$ # switch to new account
$ su - my_new_user
$ # run a test, works only if account has administrative rights
$ sudo ls -la /root
```

Want to connect with ssh to your new machine ?

```shell
sudo apt-get install openssh-server
```

You can connect either with password or sshkey if you set it up. This is a [good tuto](http://www.linuxproblem.org/art_9.html).

You may want to add more security to the ssh connexions but it's beyond the scope of this.

### Last Check

``` sh
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo reboot # Reboot, always good
```

### Going further ?

If like me, you work in academia; you'll want to install Sublime-text, Latex, Python, Cuda, and Torch. Browse through the repo and check if something can interest you !

If you think I forgot something important or super useful, don't hesitate to help contribute to make this post better :)

### Acknowledgment
If you reach this point without any errors, as you should, you want to say, thank you 'apt-get' ! 


[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/initial_steps.md?pixel)](https://github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/)
