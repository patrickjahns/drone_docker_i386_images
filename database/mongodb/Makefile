BASENAME = 'drone32bit/mongodb'
DIRS = $(wildcard */)


mongodbbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
