#!/bin/bash

# The script is designed to help you download, compile and install
# a given Python interpreter into your system. Sometimes you need
# to test your software in old Python envs and you can't fine it
# in your repo. In that case you have no choice except compile
# Python from the sources.
#
# Usage:
#
#   $ bash ./get-python.sh <py_version>...
#
# Note: the script has a lot of abstract function because in the
#       future it may be easier to port it to RH-based systems.
#
# Copyright (c) 2014, Igor Kalnitsky <igor@kalnitsky.org>
# Licensed under 3-clause BSD.

DEB_REQUIREMENTS=(
    "libsqlite3-0"
    "libssl1.0.0"
    "libexpat1"
    "libffi6"
    "ca-certificates"
)

DEB_BUILD_REQUIREMENTS=(
    "wget"
    "build-essential"
    "libsqlite3-dev"
    "libreadline-dev"
    "libssl-dev"
    "zlib1g-dev"
    "libbz2-dev"
    "libncurses5-dev"
    "libffi-dev"
    "libexpat-dev"
)


#
# A sorf of entry point - download, compile and install given Pythons.
#
function main {
    cd /tmp
    remove_python
    install_packages "${DEB_REQUIREMENTS[@]}"
    install_packages "${DEB_BUILD_REQUIREMENTS[@]}"
    install_pyenv

    for pyversion in ${@}; do
        install_python $pyversion
    done
    chown -R ubuntu:ubuntu /opt/python
    #remove_packages "${DEB_BUILD_REQUIREMENTS[@]}"
    cleanup
}



#
# Remove old python installations
#
#
function remove_python {
	rm -rf /usr/lib/python* && \
	rm -rf /usr/bin/pydb* && \
	rm -rf /usr/bin/pyvenv-* && \
	rm -rf /usr/bin/python* && \
	rm -rf /usr/lib/pydoc* && \
	rm -rf /usr/local/lib/python* && \
	rm -rf /usr/local/share/python-build
}



#
# Install a given packages to the system.
#
# $@ - array of packages to be installed
#
function install_packages {
    apt-get update
    apt-get -y install "${@}"
}


#
# Install and configure the PyEnv tool.
#
function install_pyenv {
    wget https://github.com/yyuu/pyenv/archive/master.tar.gz
    tar -xzf master.tar.gz
    bash pyenv-master/plugins/python-build/install.sh
    rm -rf pyenv-master/ master.tar.gz
}


#
# Install a given Python interpreter version.
#
# $1 - a Python interpreter version
#
function install_python {
    CFLAGS="-g -O2" python-build "$1" "/opt/python/$1"
    echo "export PATH=\"\$PATH:/opt/python/$1/bin/\"" >> /etc/drone.d/python.sh
    chmod +x /etc/drone.d/python.sh
}


#
# Remove a given packages from the system.
#
# $@ - array of packages to be removed
#
function remove_packages {
    apt-get -y purge --auto-remove "${@}"
    apt-get -y autoremove
}




#
# Remove unused packages.
#
function cleanup {
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    rm -rf /var/cache/apt/archives/*.deb
    rm -rf /tmp/*
}


main ${@}
