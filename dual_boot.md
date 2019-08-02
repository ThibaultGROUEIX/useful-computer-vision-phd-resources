# Dual boot from Windows 10 to Windows 10 + Ubuntu 16.04

This guide describe how to set up a dual boot on a windows 10 machine, with ubuntu 16.04 installed. It worked for me on 15-02-17 but I only tried it *once*.

### Step 1: Prepare Windows Machine for Dual-Boot
1. You need to log in with an account which has **administrative rights**. Then open a terminal (admin).

**Start Menu -> Command Prompt (Admin)**

2. Now we want to partition the disk to create some space for linux. There are *two ways* to do this. One is to use the Disk Management provided by Windows, but it has limitations I will discuss. The other is to use Active@ Partition Manager.

  * **Windows Disk Management**

    - Open it in the terminal with :

  ``` C:\Windows\system32\> diskmgmt.msc```

    - Shrink Volume with a right click on the partition

    - Notice that you can only divide you disk by two at the maximum. It won't allow you to leave less space for Windows regardless of the size of your disk. This is why I favour the next solution.

  * **Active@ Partition** 

    - Download Active@ Partition 
    - Partition your disk and reboot your computer
    - Check with Windows Disk Management that the partition worked out well.


### Step 2: Create a live USB

    1. Download iso file for Ubuntu [here](http://releases.ubuntu.com/16.04/) or just run


  ``` sh
  $ wget http://releases.ubuntu.com/16.04/ubuntu-16.04.1-desktop-amd64.iso 
  ```

  2- Download [usb-live creator](http://www.linuxliveusb.com/fr/download)

  3- Create the USB Live by selecting the downloaded Iso file, and the inserted USB chip (at least a few GBs). Check the option : format FAT32.

### Step 3: Install Ubuntu 16.04 with Windows Dual-Boot

1- Reboot the machine (and not shutdown from Windows which sometimes sets the machine in deep sleep mode)

2- Enter the BIOS by hiting  the specific key on startup (usually ```F2```, ```Del``` or ```Esc```)

* Every Bios is different so you will have to adapt the procedure for your machine.
* Look for **Boot Order** in the settings and put the USB Boot in **first** position
* Exit BIOS saving changes

3- If everything works, your live-key and your BIOS has been correctly configured, an ubuntu menu appears.

* Strike install ubuntu
* Select your language and country
* Leave both options from Preparing to Install Ubuntu unchecked and hit on Continue button

4- Chose your installation type

* you have two options :

  * You can choose to Install Ubuntu alongside Windows Boot Manager
  * You can chose something else to customise your partition (size of swap for example).

* I chose Install Ubuntu alongside Windows Boot Manager and dealt with the size of my swap memory with GParted later.


5- Finish your installation and reboot

* Give a name and password to your session
* Reboot

### Step 4: Set Ubuntu as default 

1. It can be automatic. After restarting though, if you end up with Windows, you need to take a few more steps.


2. Enter BIOS by hiting  the specific key on startup (usually ```F2```, ```Del``` or ```Esc```).

  * Browse through the parameters (each BIOS is different...). You're looking for something like UEFI settings, and place Ubuntu before Windows.

### Step 5: Resize your Swap
 * The default installation of Ubuntu creates a swap as big as the RAM which is a good thing. Now if your are on a serveur with 128GB, you don't want to use 128GB of your SSD for your swap. So in this specific case, you need to take additional steps to resize your swap.

   ```sh 
   $ sudo apt-get install gparted 
   ```
   ```sh
   $ sudo gparted 
   ```

* GParted analyses your disk. You can select the swap partition, **run " swapoff"** and then **delete this partition**.

* You now have used space on the right of you Ubuntu partition.

* You can **extend your Ubuntu partition** to fill the entire space left by the swap partition

* Apply changes

* Reboot

* Check that the deletion of the swap was done by :

   ```sh
   $ sudo apt-get install htop
   ```
   ```sh
   $ htop 
   ```

* You should see "0 K" for the swap.

   ​




### Step 6: Update, Install the basic tool on Ubuntu to set up a good workflow [here](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/useful_basic_install)!

### Step 7: change your boot order

``` shell
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```

### Acknowledgement 

 My main [inspiration](http://www.tecmint.com/install-ubuntu-16-04-alongside-with-windows-10-or-8-in-dual-boot/) ! 
 
 
### ISSUES

1. Hardware Error: If you have a quite new motherboard and CPU as *Gigabyte x299* and *i7-7820x*, you might suffer from 'Hardware error' when booting from USB. In this case, check the handware at first, make sure it is not a problem of CPU or motherboard. Then, try to install **Ubuntu 14.04** version. In case of booting to black screen during the installation of 14.04, set *acpi = off* might be helpful. More details can be seen from [here](https://askubuntu.com/questions/943461/cannot-install-ubuntu-14-16-17-on-i7-7820x-and-gigabyte-x299-ud4)

2. Internet connextion settings (IP, DNS, GW, MASK) via commands

  * IP and MASK: ```sudo ifconfig eth0 *YOUR_IP_HERE* netmask *YOUR_MASK_HERE*```
  
  * GW: ```sudo route add default gw *YOUR_GW_Here*```
  
  * DNS: open the file ```/etc/resolv.conf```, creating a new line and adding ```nameserver *YOUR_DNS_HERE*```


[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/workflow_and_installs/dual_boot.md?pixel)](https://github.com/ThibaultGROUEIX/workflow_and_installs/)
