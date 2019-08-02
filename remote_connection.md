# Remote connection



I use two tools :

## SSH with port forwarding

## Team viewer

Teamviewer is a free software for personal use that enables very easy X forwarding as long as your remote machine is connected to internet. I can be easier than SSH if the remote machine is not directly accessible from outside.

https://www.teamviewer.com/en/download/linux/

the only annoying thing is the password change everytime you restart it :

```shell
teamviewer --passwd mypassword #fix the password
teamviewer -info #get the ID
```

