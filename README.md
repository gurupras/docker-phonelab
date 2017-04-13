# Dockerfiles for HDFS

The contents of this repo contains Dockerfiles for the phonelab cluster.

## Requirements

 - **Docker**: Tested with Docker version 1.11.1, build 5604cbe
 - **OS**: Tested on Ubuntu 14.04 (Trusty)
 - HDFS expects a /phonelab-data mount. When running `docker run`, use `-v <actual_path>:/phonelab-data`.
