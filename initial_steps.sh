#!/usr/bin/env sh
# Author : Thibault GROUEIX 
# check this for more details : https://github.com/ThibaultGROUEIX/workflow_and_installs/blob/master/initial_steps.md


#minimal requirements
sudo apt-get install ubuntu-minimal
sudo apt-get install ubuntu-standart
sudo apt-get install ubuntu-desktop

# add repos
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
sudo add-apt-repository -y ppa:tuxpoldo/btsync
sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily
sudo add-apt-repository -y ppa:stefansundin/truecrypt
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

#update/upgrade initial
sudo apt-get update
sudo apt-get upgrade

#git
sudo apt-get -y install git

#you can skip the following if you do not wish to configure git
git config --global user.name "name"
git config --global user.email "mail"
git config --global push.default current # to create new branch on remote matching new branch on local when pushing new local branch
git config --global url."https://".insteadOf git:// # useful to work from work because ssh protocol can't be used when we are behind a firewall.
ssh-keygen #generate a new new pair of asymetric key.
ssh-agent #start an agent that will automatically give the password of the privatekey for as long as it lives
ssh-add ~/.shh/id_rsa #enter password at this point to give the password to the agent so that it will be able to check later on.
ssh -T git@github.com #add key to your github account
sudo apt-get install ssh-askpass #necessary for bitbucket.

# Sublime :
sudo apt-get install xdotool #to enable sendTextPlus
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

cd ~/.config/sublime-text-3
git init
git remote add origin git@bitbucket.org:ThibaultGROUEIX/st3-settings.git
git fetch
git reset --hard origin/master
# you can experience some issues with subl because it has to install all the packages. So open it and close it a few times until the display is bug-free.

#chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
# Then add ghostery and addblock plus extensions (mysms, whatsappweb...)

# Htop
sudo apt-get install htop

# MC - tool for supervising folder size
sudo apt-get install mc

#skype :
#visit https://www.skype.com/en/download-skype/skype-for-linux/downloading-web/?type=weblinux-deb
# install the downloaded package
#  hitting the web camera function key on the laptop adds/removes the device in hardware as if it has been physically connected/disconnected.
# You must hit Fn+<Camera Key> on your keyboard. It varies from laptop to laptop. Hit it and you should watch /dev/video0 appear and disappear.

##gimp
sudo apt-get install -y gimp

#dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd ## pour lancer le tread dropbox:
#In preference, tick "launch on system start-up" if you want it (doesn't work when dropbox is installed in command line)
#in 'start-up application', add new daemon with command line ~/.dropbox-dist/dropboxd 

#a good tool to edit pdf files
sudo apt-get install -y pdftk

#very useful for scanner and printer
sudo apt-get install -y xsane

#useful for codecs (streamio...)
sudo apt-get install vlc

# tool to create illustrations
sudo apt-get install inkscape

# tool edit videos
sudo apt-get install ffmpeg

#byobu
sudo apt-get install byobu
byobu-enable #on serveur, when connecting via ssh, will automatically launch byobu
# add to .bashrc for color-prompt: 
[ -r ~/.byobu/prompt ] && . ~/.byobu/prompt   #byobu-prompt#

# manage partition
sudo apt-get install gparted

# manage packages
sudo apt-get install synaptic

# nouvel utilisateur
sudo su
adduser my_new_user
# for a super user
usermod -aG sudo my_new_user
# switch to new account
su - my_new_user
# run a test
sudo ls -la /root
#allow ssh conenctions
sudo apt-get install open-ssh

#tasque
sudo apt-get install tasque
#last check
sudo apt-get update
sudo apt-get upgrade

# Reboot, always good
sudo reboot
