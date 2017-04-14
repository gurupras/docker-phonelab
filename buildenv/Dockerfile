# Hadoop worker node
FROM hadoop-base:2.8.0
MAINTAINER shaseley@buffalo.edu

COPY files/default_cmd /root/default_cmd

# Add the entrypoint script for the master
ENTRYPOINT ["/root/default_cmd"]
