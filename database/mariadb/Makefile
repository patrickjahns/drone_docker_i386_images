BASENAME = 'drone32bit/mariadb'
DIRS = $(wildcard */)


mariadbbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
