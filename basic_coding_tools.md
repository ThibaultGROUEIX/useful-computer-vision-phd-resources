# Basic coding tools - Git, Latek, and others



## Git

### Setup

*First* you need to install it.

```shell
sudo apt-get -y install git
```

*Then* to configure it :

```shell
git config --global user.name "name"
git config --global user.email "mail"
git config --global push.default current 
git config --global url."https://".insteadOf git://
```

The last line is useful if you are behind a firewall. **push.default current** will create a new remote branch with the same name as your local branch and connect them automatically when you push a new branch.

*Lastly* you need to automate your accesses to your online repositories.

Create a new pair of ssh key in ~/.ssh/ with :

```shell
ssh-keygen #generate a new new pair of asymetric key.
ssh-agent #start an agent that will automatically give the password of the privatekey for as long as it lives
ssh-add ~/.shh/id_rsa #enter password at this point to give the password to the agent
```

Now you have to give your public key to your online repos (in 'settings' for github and bitbucket for example).

You can copy your public-key with :

```shell
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
```

If you have a github account, you can *test* your configuration with :

```
ssh -T git@github.com #should output  You've successfully authenticated!
```

### Usecase

* view a previous commit in detached head

* ```shell
  git checkout 6e23a6a
  git checkout mybranch #tocomeback
  ```



# Latek

I will consider you don't lack space on your machine.

```shell
sudo apt-get install texlive-full qtikz
sudo apt-get install perl-tk --no-install-recommends ##for tlmgr
tlmgr init-usertree
```

You're basically ready...

You can use the gui tlmgr to install packages.

```shell
tlmgr --gui
```

### Usecase

I like using Makefiles to compile my tex documents (I got the idea from [Lilian Besson](http://perso.crans.org/besson/index.fr.html). They look like :

```bash
# Quick Makefile to compile easily the poster, uses PDFLaTeX (pdflatex) and BibTeX (bibtex)
all: clean pdf evince clean

pdf:
	pdflatex -synctex=1 my_doc.tex
	pdflatex -synctex=1 my_doc.tex
	# bibtex my_doc 
	# pdflatex -synctex=1 my_doc.tex
	# pdflatex -synctex=1 my_doc.tex

evince:
	-evince my_doc.pdf >/dev/null 2>/dev/null &

clean:
	-rm -rfv *.fls *.fdb_latexmk *.ps *.dvi *.htoc *.tms *.tid *.lg *.log *.id[vx] *.vrb *.toc *.snm *.nav *.htmp *.aux *.tmp *.out *.haux *.hidx *.bbl *.blg *.brf *.lof *.ilg *.ind *.meta *.fdb_latexmk *.fls *.synctex.gz*

# Download my script from https://bitbucket.org/lbesson/bin/src/master/PDFCompress
compress:
	PDFCompress my_doc.pdf
```



# Markdown

```shell
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
# add Typora's repository
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt-get update
sudo apt-get install typora
sudo apt-get install pandoc #for latex in markdown
```

It's the Best !

# Sublime

It's detailled [here](https://github.com/ThibaultGROUEIX/workflow_and_installs/tree/master/initial_steps.md)!



# Docker

I'm not so familiar with docker but here is what I use it for. 

I allows you to create images (programs) that encapsulate all the dependencies you need to run your code. So let's say you need opencv + ubuntu 16.04 + pytorch. Then you create your image and you can work and launch experiments on any device without needing to install anything. So it solves dependencies problem and stuff. it is a good practice when several people use the same cluster. It's better that VM because in practice it runs as a program on the lowest level the machine while VM don't, hence are much slower (but more stable).

Now let's [install it](https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository) :

```shell
#install
sudo apt-get remove docker docker-engine
sudo apt-get update
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
    
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#only for amd64
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world

#post installation steps
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world #test without sudo
sudo systemctl enable docker #start docker on startup
```

To use GPU based containers, you need a wrapper called nvidia-docker

```shell
# Install nvidia-docker and nvidia-docker-plugin
sudo apt-get purge nvidia-docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Test nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi
```



Troubleshooting :

```shell
#if the network connection doesn't work in your containers, you can check out this [issue](https://github.com/moby/moby/issues/866#issuecomment-19218300)
pkill docker
sudo iptables -t nat -F
sudo ifconfig docker0 down
sudo brctl delbr docker0
service docker restart
```

And a quick how to :

```shell
docker images #list all docker images
docker ps -a #list all processes and closed processes (better to delete those to save space)
docker pull dockerstuff #download from Docker Hub some image
docker rmi image #delete image
docker run image
```

Options for ``` Docker run```

* -it : an interactive tty in the container
* --rm : doesn't store exited process
* --volume :



Useful commands :

```shell
docker rm $(docker ps -a -q -f status=exited) #deletes all exited processes
```

Docker commands :

| attach  | Attach to a running container            |
| ------- | ---------------------------------------- |
| build   | Build an image from a Dockerfile         |
| commit  | Create a new image from a container's changes |
| cp      | Copy files/folders from a container's filesystem to the host path |
| diff    | Inspect changes on a container's filesystem |
| events  | Get real time events from the server     |
| export  | Stream the contents of a container as a tar archive |
| history | Show the history of an image             |
| images  | List images                              |
| import  | Create a new filesystem image from the contents of a tarball |
| info    | Display system-wide information          |
| inspect | Return low-level information on a container |
| kill    | Kill a running container                 |
| load    | Load an image from a tar archive         |
| login   | Register or log in to the Docker registry server |
| logs    | Fetch the logs of a container            |
| port    | Lookup the public-facing port that is NAT-ed to PRIVATE_PORT |
| pause   | Pause all processes within a container   |
| ps      | List containers                          |
| pull    | Pull an image or a repository from a Docker registry server |
| push    | Push an image or a repository to a Docker registry server |
| restart | Restart a running container              |
| rm      | Remove one or more containers            |
| rmi     | Remove one or more images                |
| run     | Run a command in a new container         |
| save    | Save an image to a tar archive           |
| search  | Search for an image on the Docker Hub    |
| start   | Start a stopped container                |
| stop    | Stop a running container                 |
| tag     | Tag an image into a repository           |
| top     | Lookup the running processes of a container |
| unpause | Unpause a paused container               |
| version | Show the Docker version information      |
| wait    | Block until a container stops, then print its exit code |

Build an image :

| Command    | Description                              |
| ---------- | ---------------------------------------- |
| ADD        | Copies a file from the host system onto the container |
| CMD        | The command that runs when the container starts |
| ENTRYPOINT |                                          |
| ENV        | Sets an environment variable in the new container |
| EXPOSE     | Opens a port for linked containers       |
| FROM       | The base image to use in the build. This is mandatory and must be the first command in the file. |
| MAINTAINER | An optional value for the maintainer of the script |
| ONBUILD    | A command that is triggered when the image in the Dcokerfile is used as a base for another image |
| RUN        | Executes a command and save the result as a new layer |
| USER       | Sets the default user within the container |
| VOLUME     | Creates a shared volume that can be shared among containers or by the host machine |
| WORKDIR    | Set the default working directory for the container |



```shell
docker build -t "groueix/test" . #optionally add a tag like test:latest/v01/...
#-t gives a nice name and tag to the image
# . tells build to take the Dockerfile in the current repo
docker run [OPTIONS] IMAGE [COMMAND] [ARG...] #testing Command is the cmd that the containers run when it starts
docker login #enter credentials
docker push groueix/test #now everyone can download and use my dockerfile
```

You can check the last lines executed on your dockerfile with

```shell
docker history -t "groueix:dockerfile"
```

Exchange HOST and Container

```shell
# Copy a file from you machine to a running container
nvidia-docker cp path/to/your/file container-name:/destination
```

Exchange data folders :

```shell
docker run -v /src/webapp:/webapp #will mount /sr/webapp folder to /webapp on container
docker run --volume /src/webapp:/webapp #identical
#or in Dockerfile :
VOLUME /src/webapp:/webapp

docker inspect web #to check mount info of a running container.
```

TODO NOW : try creating a simple ubuntu image with anaconda, pytorch and a few pytorch stuff. using commit and review the history of commands easily.



TODO : how to link the dataset to the docker image ?

TODO : need a pytorch image with pytorch built from sources.

[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/workflow_and_installs/basic_coding_tools.md?pixel)](https://github.com/ThibaultGROUEIX/workflow_and_installs/)