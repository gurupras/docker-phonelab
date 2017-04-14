# Hadoop master node
FROM hadoop-base:2.8.0
MAINTAINER shaseley@buffalo.edu

# Expose TCP ports 7077 8080
EXPOSE 7077 8080

RUN sudo apt-get install -y beanstalkd
RUN go get github.com/Luxurioust/aurora
RUN /bin/bash -c "cd ${GOPATH}/src/github.com/Luxurioust/aurora && go install"

COPY files/default_cmd /root/
COPY files/aurora.toml /root/

ENTRYPOINT ["/root/default_cmd"]
