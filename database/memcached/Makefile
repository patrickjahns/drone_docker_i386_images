BASENAME = 'drone32bit/memcached'
DIRS = $(wildcard */)


memcachedbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
