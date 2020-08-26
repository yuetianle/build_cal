FROM centos:centos7.28.2003
MAINTAINER "joinbright"
ADD ext_lib /root/
ADD https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz /root/ext_lib/
RUN yum install gcc gcc-c++ make && /root/build.sh
WORKDIR "/root"
CMD ["/bin/bash"]