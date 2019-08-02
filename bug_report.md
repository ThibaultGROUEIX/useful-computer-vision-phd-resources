## Bug reports :



### #1 Symptoms : After auto update and ask to restart, low-res login screen, and login loop.



### Tried

* purging and changing nvidia drivers, didn't change anything. Was useless.
* Tracked the auto-update to :

```shell
less /var/log/apt/history.log

Start-Date: 2018-02-22  11:22:29
Commandline: aptdaemon role='role-commit-packages' sender=':1.1294'
Install: linux-headers-4.4.0-116:amd64 (4.4.0-116.140, automatic), linux-signed-image-4.4.0-116-generic:amd64 (4.4.0-116.140, automatic), linux-image-extra-4.4.0-116-generic:amd64 (4.4.0-116.140, automatic), linux-headers-4.4.0-116-generic:amd64 (4.4.0-116.140, automatic), linux-image-4.4.0-116-generic:amd64 (4.4.0-116.140, automatic)
Upgrade: libreoffice-style-breeze:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-math:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), linux-headers-generic:amd64 (4.4.0.112.118, 4.4.0.116.122), linux-libc-dev:amd64 (4.4.0-112.135, 4.4.0-116.140), linux-image-generic:amd64 (4.4.0.112.118, 4.4.0.116.122), libreoffice-core:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-gtk:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-style-human:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), linux-signed-image-generic:amd64 (4.4.0.112.118, 4.4.0.116.122), python3-uno:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), linux-signed-generic:amd64 (4.4.0.112.118, 4.4.0.116.122), libreoffice-style-galaxy:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-base-core:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-ogltrans:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-impress:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), ure:amd64 (5.1.6~rc2-0ubuntu1~xenial2, 5.1.6~rc2-0ubuntu1~xenial3), libreoffice-writer:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-common:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), linux-signed-generic-lts-xenial:amd64 (4.4.0.112.118, 4.4.0.116.122), fonts-opensymbol:amd64 (2:102.7+LibO5.1.6~rc2-0ubuntu1~xenial2, 2:102.7+LibO5.1.6~rc2-0ubuntu1~xenial3), libreoffice-pdfimport:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), uno-libs3:amd64 (5.1.6~rc2-0ubuntu1~xenial2, 5.1.6~rc2-0ubuntu1~xenial3), linux-generic-lts-xenial:amd64 (4.4.0.112.118, 4.4.0.116.122), libreoffice-gnome:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-calc:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), linux-generic:amd64 (4.4.0.112.118, 4.4.0.116.122), libreoffice-draw:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3), libreoffice-avmedia-backend-gstreamer:amd64 (1:5.1.6~rc2-0ubuntu1~xenial2, 1:5.1.6~rc2-0ubuntu1~xenial3)
End-Date: 2018-02-22  11:23:51
```

The faulty guy is the latest linux kernel 4.4.116.

* remove kernel 4.4.116 and loged in with kernel 112

  ```shell
  sudo apt-get remove linux-headers-4.4.116*
  sudo apt-get remove linux-image-4.4.116*
  ```

  ​

* ```shell
  #Fix compiz problem :

  sudo rm -fr ~/.cache/compizconfig-1
  sudo rm -fr ~/.compiz

  #Then try this if your session not loading :

  sudo rm -fr ~/.Xauthority
  sudo rm -fr ~/.config/autostart

  #Reinstall compiz

  sudo apt-get install --reinstall ubuntu-desktop unity compizconfig-settings-manager upstart

  #Finally clear the Unity Desktop :

  sudo dconf reset -f /org/compiz/
  setsid unity
  ```

  ​

If graphic environment works but CUDA fails, try recompiling the samples !



Thanks to **[Pierre-Alain Langlois](https://github.com/palanglois)** for his guidance on this bug!

[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/workflow_and_installs/bug_report.md?pixel)](https://github.com/ThibaultGROUEIX/workflow_and_installs/)