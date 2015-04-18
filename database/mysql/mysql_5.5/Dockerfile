FROM patrickjahns/ubuntu-debootstrap:14.04

# https://github.com/dotcloud/docker/issues/1024
RUN apt-get -qq update                                                                    && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.5 pwgen              && \
    sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf  && \
    /bin/bash -c "/usr/sbin/mysqld &"                                                     && \
    sleep 10                                                                              && \
    echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apt/archives/*.deb && \
    rm -rf /tmp/
EXPOSE 3306
ENTRYPOINT "/usr/sbin/mysqld"
