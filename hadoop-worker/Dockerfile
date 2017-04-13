# Hadoop worker node
FROM hadoop-base:2.8.0
MAINTAINER shaseley@buffalo.edu

# Instead of using a random port, bind the worker to a specific port
EXPOSE 8888

COPY files/default_cmd /root/default_cmd
RUN echo 'PATH=$PATH:${HADOOP_PREFIX}/bin' >>${HOME}/.bashrc
# Add the entrypoint script for the master
ENTRYPOINT ["/root/default_cmd"]
