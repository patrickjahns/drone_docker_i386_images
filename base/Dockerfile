FROM patrickjahns/ubuntu-debootstrap:14.04
MAINTAINER Patrick Jahns <github@patrickjahns.de>

RUN apt-get update -y && \ 
	apt-get upgrade -y && \ 
	apt-get install -y language-pack-en sudo \
	&& mkdir -p /home/ubuntu && \
	addgroup ubuntu && \
	adduser --home /home/ubuntu --shell /bin/bash --no-create-home --ingroup ubuntu ubuntu &&\
	apt-get clean && \
    	rm -rf /var/lib/apt/lists/* /tmp/*
ADD rootfs/etc /etc/
ADD rootfs/root /root/
ADD rootfs/home/ubuntu /home/ubuntu/
RUN whoami && chown -R ubuntu:ubuntu /home/ubuntu && chmod 0440 /etc/sudoers 


WORKDIR /home/ubuntu
USER ubuntu
ENV HOME /home/ubuntu
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LOGNAME ubuntu
ENV TERM xterm

ADD build-base.sh /tmp/build-base.sh
RUN cd /tmp && sudo chmod +x build-base.sh && sudo /tmp/build-base.sh 
