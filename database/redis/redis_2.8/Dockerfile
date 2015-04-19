FROM patrickjahns/ubuntu-debootstrap:14.04
RUN apt-get -qq update && apt-get -y install gcc make wget                 && \
    wget --quiet http://download.redis.io/releases/redis-2.8.19.tar.gz     && \
    tar xzf redis-2.8.19.tar.gz                                            && \
    cd redis-2.8.19                                                        && \
    make                                                                   && \
    install -t /usr//bin src/redis-server                                  && \
    cd ..                                                                  && \
    rm redis-2.8.19.tar.gz && rm -rf redis-2.8.19                          && \
    mkdir /etc/redis                                                       && \
    wget --quiet --no-check-certificate http://raw.github.com/antirez/redis/2.8/redis.conf -O /etc/redis/redis.conf && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apt/archives/*.deb

EXPOSE 6379
ENTRYPOINT  ["/usr/bin/redis-server"]
