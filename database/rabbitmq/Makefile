BASENAME = 'drone32bit/rabbitmq'
DIRS = $(wildcard */)


rabbitmqbuild:
	for dir in $(DIRS); do \
		TAG=`cat $$dir/TAG`; \
		docker build --rm -t ${BASENAME}:$$TAG $$dir;\
	done
