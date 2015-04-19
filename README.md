==============

This repository hosts 32bit images that can be used for testing with drone.
The Dockerfiles have been take from the [official drone repository](https://github.com/drone/images) and modified 
for personal use cases.

For a __32 bit docker version__ check out [this repository](https://github.com/dokku32bit/docker_32bit)

**base image**

The base image used for the containers is called `drone32bit/buildpack` and it is stripped down to take up less space
and still provide enough libraries to build on top of it.

The image includes
* common repository tools (git, mercurial, subversion, bzr)
* socat for communication between containers
* common libraries for building various containers

It does __not__ include
* no xvfb
* commong programming languages (python, node, ruby, golang etc.)
* any browser related installations (no chromium, firefox)
* no selenium or phantomjs


More details can be found by examing `base/Dockerfile` and `base/build-base.sh` 

The dockerfiles in here can be easily used to build your own on top of it.
If you want to change from 32bit containers to 64bit containers, replace the base container
in `base/Dockerfile` just with `ubuntu-debootstrap:14.04` as well as in all the database Dockerfiles as well.
Adapt the naming conventions in the makefiles accordingly and just run `make` in the base directory again


### Building your own images
The buildpack images provides an easy way for adding any variable to your environment.
Simply create a bash script with what you want to export in `/init.d/drone.d/` - these scripts will be executed within the bash shell 


###TODO
* buildpacks
  * node
  * golang
  * ruby
  * php
  * ????
* databases
  * elasticsearch
  * neo4j
  * riak
  * ???
