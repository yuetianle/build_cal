FROM centos:centos7.8.2003
MAINTAINER "joinbright"
ADD ext_lib /root/
ADD https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz /root/ext_lib/
RUN yum -y install gcc gcc-c++ make
WORKDIR "/root"
CMD ["/bin/bash"]