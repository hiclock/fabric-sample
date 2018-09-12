FROM centos:latest
MAINTAINER hiclock dotclock@hotmail.com

RUN yum update -y
RUN yum install -y wget git make gcc libtool-ltdl-devel

COPY install.sh /data/install/

RUN sh /data/install/install.sh
