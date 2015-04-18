BASETAG=drone32bit
all: py

py:
	make -C python/


buildpack:
	docker build --rm -t ${BASETAG}/buildpack ./base/

db:
	make -C database/


