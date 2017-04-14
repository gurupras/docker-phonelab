# Base Ubuntu Trusty 14.04 LTS image
#
FROM ubuntu:trusty
MAINTAINER shaseley@buffalo.edu

ENV HADOOP_VERSION 2.8.0
# Setup a volume for data
#VOLUME ["/data"]

# Set correct source list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main universe" >> /etc/apt/sources.list

# install a few other useful packages plus Open Jdk 7
RUN apt-get update && apt-get upgrade -y && apt-get install -y less openjdk-7-jre-headless net-tools git screen vim-tiny sudo openssh-server iputils-ping python2.7 aria2 build-essential gcc make

# Install Hadoop and override the configuration
RUN mkdir /usr/local/hadoop-install
#ADD http://mirror.cc.columbia.edu/pub/software/apache/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz /usr/local/hadoop-install/
#COPY files/hadoop-2.7.2.tar.gz /usr/local/hadoop-install/
RUN aria2c -s 8 http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -d /usr/local/hadoop-install -o hadoop-${HADOOP_VERSION}.tar.gz
RUN tar -xzf /usr/local/hadoop-install/hadoop-${HADOOP_VERSION}.tar.gz -C /usr/local/hadoop-install
RUN rm /usr/local/hadoop-install/hadoop-${HADOOP_VERSION}.tar.gz
ENV HADOOP_PREFIX /usr/local/hadoop-install/hadoop-${HADOOP_VERSION}

ENV HOME /root

# go
RUN aria2c -s 8 https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz -d /usr/local
RUN tar -xzf /usr/local/go1.8.linux-amd64.tar.gz -C /usr/local
RUN mkdir -p ${HOME}/workspace/go
ENV GOPATH ${HOME}/workspace/go
ENV PATH ${PATH}:/usr/local/go/bin
ENV PATH $PATH:${HOME}/workspace/go/bin
RUN echo 'export GOPATH=${HOME}/workspace/go' >> ${HOME}/.bashrc
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> ${HOME}/.bashrc
RUN echo 'export PATH=$PATH:${HOME}/workspace/go/bin' >> ${HOME}/.bashrc

# go packages
RUN /bin/bash -c 'go get github.com/shaseley/phonelab-go'
RUN /bin/bash -c 'cd ${GOPATH}/src/github.com/shaseley/phonelab-go/phonelab-go && go get && go install'
RUN /bin/bash -c 'cd ${GOPATH}/src/github.com/shaseley/phonelab-go/phonelab-go-server && go get && go install'
RUN /bin/bash -c 'cd ${GOPATH}/src/github.com/shaseley/phonelab-go/phonelab-go-worker && go get && go install'

# Finish any other image setup logic before this point
# Beyond this point, most lines will be short commands that consume
# no significant time during 'make'. For example, certain configuration files
# that are potentially modified often are copied below.

# Copy hdfs configuration files
COPY files/core-site.xml ${HADOOP_PREFIX}/etc/hadoop/
COPY files/hdfs-site.xml ${HADOOP_PREFIX}/etc/hadoop/
COPY files/hadoop-env.sh ${HADOOP_PREFIX}/etc/hadoop/


# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Setup sshd for starting worker nodes
RUN mkdir /root/.ssh
RUN chmod go-rx /root/.ssh
COPY files/authorized_keys /root/.ssh/
COPY files/id_rsa /root/.ssh/
RUN chmod go-wx /root/.ssh/authorized_keys
RUN chmod go-rwx /root/.ssh/id_rsa
RUN mkdir /var/run/sshd

RUN echo "StrictHostKeyChecking no" > /root/.ssh/config
