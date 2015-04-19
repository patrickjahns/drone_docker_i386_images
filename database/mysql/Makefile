BASENAME = 'drone32bit/mysql'
DIRS = $(wildcard */)


mysqlbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
