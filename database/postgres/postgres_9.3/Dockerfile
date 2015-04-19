FROM patrickjahns/ubuntu-debootstrap:14.04
RUN apt-get -qq update                                                                                          && \
    apt-get install -y -qq python-software-properties software-properties-common wget                           && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list   && \
    wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get -qq update                                                                                          && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y -qq postgresql-9.3 postgresql-contrib-9.3	&& \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apt/archives/*.deb

ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
USER postgres
EXPOSE 5432
ENTRYPOINT ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf", "-c", "listen_addresses=*"]
