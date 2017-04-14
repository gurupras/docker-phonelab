SHELL=/bin/bash

all: hadoop-base hadoop-master hadoop-worker buildenv

hadoop-base:
	cd apache-hadoop-hdfs-trusty; \
	docker build -t hadoop-base:2.8.0 .

hadoop-master: hadoop-base
	cd hadoop-master; \
	docker build -t hadoop-master:2.8.0 .

hadoop-worker: hadoop-base
	cd hadoop-worker; \
	docker build -t hadoop-worker:2.8.0 .

buildenv: hadoop-base
	cd buildenv; \
	docker build -t buildenv:1.0.0 .
