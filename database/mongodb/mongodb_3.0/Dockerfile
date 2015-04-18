FROM patrickjahns/ubuntu-debootstrap:14.04
RUN apt-get -qq update && apt-get upgrade -y				&& \
    apt-get -y install wget gcc-4.8 gcc scons python2.7 		&& \
    wget https://fastdl.mongodb.org/linux/mongodb-linux-i686-3.0.2.tgz 	&& \
    tar -zxvf mongodb-linux-i686-3.0.2.tgz                              && \
    install -t /usr/bin mongodb-linux-i686-3.0.2/bin/*                	&& \
    mkdir -p /data/db /var/lib/mongodb/                                 && \
    rm mongodb-linux-i686-3.0.2.tgz                                   	&& \
    rm -rf mongodb-linux-i686-3.0.2					&& \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apt/archives/*.deb && \
    rm -rf /tmp/*


EXPOSE 27017
ENTRYPOINT ["usr/bin/mongod"]
CMD ["--noprealloc", "--smallfiles"]

