FROM patrickjahns/ubuntu-debootstrap:14.04

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
	echo "deb http://mirrors.n-ix.net/mariadb/repo/5.5/ubuntu trusty main" > /etc/apt/sources.list.d/mariadb.list && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/* && \
	sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
	echo "mysqld_safe &" > /tmp/config && \
	echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
	echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
	bash /tmp/config && \
	apt-get clean && apt-get autoremove                                         && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*                               && \
	rm -rf /var/cache/apt/archives/*.deb                                       

EXPOSE 3306
ENTRYPOINT "/usr/sbin/mysqld"
