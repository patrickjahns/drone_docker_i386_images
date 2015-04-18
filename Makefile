BASETAG=drone32bit
all: python database

python:
	make -C python/


buildpack:
	docker build --rm -t ${BASETAG}/buildpack ./base/

database:
	make -C database/


.PHONY: python base database
