FROM centos:centos7.8.2003
MAINTAINER "joinbright"
ADD ext_lib /root/ext_lib/
ADD https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz /root/ext_lib/
RUN yum -y install gcc gcc-c++ make && chmod a+x -R /root/ext_lib/ && /root/ext_lib/build.sh
WORKDIR "/root"
CMD ["/bin/bash"]