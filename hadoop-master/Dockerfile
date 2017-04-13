# Hadoop master node
FROM hadoop-base:2.8.0
MAINTAINER shaseley@buffalo.edu

# Expose TCP ports 7077 8080
EXPOSE 7077 8080

COPY files/default_cmd /root/

ENTRYPOINT ["/root/default_cmd"]
