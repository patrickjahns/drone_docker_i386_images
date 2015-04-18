#!/bin/bash
set -x
set -e

# update packages
sudo apt-get -qq update
sudo apt-get -y upgrade

# essentials
sudo apt-get install -y \
		python-software-properties \
		git \
		git-core \
		subversion \
		mercurial \
		bzr \
		socat

#utils
sudo apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget \

# common recommended libraries
sudo apt-get install -y \
		autoconf \
		build-essential \
		imagemagick \
		libbz2-dev \
		libcurl4-openssl-dev \
		libevent-dev \
		libffi-dev \
		libglib2.0-dev \
		libjpeg-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmysqlclient-dev \
		libncurses-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		zlib1g-dev \

#cleanup
sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
sudo rm -rf /var/cache/apt/archives/*.deb
