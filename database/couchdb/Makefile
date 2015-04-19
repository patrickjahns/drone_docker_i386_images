BASENAME = 'drone32bit/couchdb'
DIRS = $(wildcard */)


couchdbbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
