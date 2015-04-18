BASENAME = 'drone32bit/mongodb'
DIRS = $(wildcard */)


pybuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
