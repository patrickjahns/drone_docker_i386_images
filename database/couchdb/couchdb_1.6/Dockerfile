FROM patrickjahns/ubuntu-debootstrap:14.04
RUN apt-get  update && apt-get upgrade && \
    apt-get -y install build-essential \
    	erlang-base-hipe erlang-dev erlang-manpages \
    	erlang-eunit erlang-nox libicu-dev wget \
	libmozjs185-dev libcurl4-openssl-dev && \
    wget http://apache.mirrors.pair.com/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz && \
    tar xzf apache-couchdb-1.6.1.tar.gz && \
    rm apache-couchdb-1.6.1.tar.gz      && \
    cd apache-couchdb-1.6.1             && \
    ./configure                         && \
    make                                && \
    make install                        && \
    cd ..                               && \
    rm -rf apache-couchdb-1.6.1         && \

    useradd -d /usr/local/var/lib/couchdb couchdb       && \
    chown -R couchdb:couchdb /usr/local/etc/couchdb     && \
    chown -R couchdb:couchdb /usr/local/var/lib/couchdb && \
    chown -R couchdb:couchdb /usr/local/var/log/couchdb && \
    chown -R couchdb:couchdb /usr/local/var/run/couchdb && \
    chmod -R 0770 /usr/local/etc/couchdb                && \
    chmod -R 0770 /usr/local/var/lib/couchdb            && \
    chmod -R 0770 /usr/local/var/log/couchdb            && \
    chmod -R 0770 /usr/local/var/run/couchdb            && \
    sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /usr/local/etc/couchdb/default.ini && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apt/archives/*.deb 

EXPOSE 5984
ENTRYPOINT "/usr/local/bin/couchdb"

# see  http://jswiki.lab-01.com/wiki/doku.php?id=install-couch-ubuntu
