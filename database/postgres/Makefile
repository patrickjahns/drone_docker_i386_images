BASENAME = 'drone32bit/postgres'
DIRS = $(wildcard */)


postgresbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
