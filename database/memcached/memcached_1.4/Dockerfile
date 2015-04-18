FROM patrickjahns/ubuntu-debootstrap:14.04
RUN apt-get -qq update && apt-get -y install gcc make wget libevent-dev         && \
    wget --quiet http://memcached.org/files/memcached-1.4.22.tar.gz		 && \
    tar xzf memcached-1.4.22.tar.gz                                             && \
    rm memcached-1.4.22.tar.gz                                                  && \
    cd memcached-*                                                              && \
    ./configure --prefix=/usr/local                                             && \
    make install                                                                && \
    cd .. && rm -rf memcached-* 						&& \
    apt-get clean && apt-get autoremove 					&& \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 				&& \
    rm -rf /var/cache/apt/archives/*.deb 					&& \
    rm -rf /tmp/*


EXPOSE 11211
ENTRYPOINT ["/usr/local/bin/memcached"]
CMD ["-u", "root", "-m", "64"]
