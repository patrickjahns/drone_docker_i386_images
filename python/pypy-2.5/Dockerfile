#######################################################################
# Modified by Patrick Jahns
# Copyright (c) 2014, Igor Kalnitsky <igor@kalnitsky.org>
# Licensed under 3-clause BSD
#
# See https://github.com/patrickjahns/pythonista-x86_32 
#######################################################################

FROM        drone32bit/buildpack 
MAINTAINER  Patrick Jahns <github@patrickjahns.de>

ADD get-python.sh  /var/tmp/get-python.sh

# Install CPython interpreters.
RUN ["sudo", "/bin/bash", "/var/tmp/get-python.sh", \
     "pypy-portable-2.5"]

# Install first-class tools
# RUN pip install tox virtualenv
