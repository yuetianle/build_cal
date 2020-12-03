FROM centos:centos7.8.2003
MAINTAINER "joinbright"
ADD ext_lib /root/ext_lib/
ADD https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz /root/ext_lib/
RUN yum -y install gcc gcc-c++ make passwd openssl openssh-server openssh-clients  && yum clean all \
 && ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' \
 && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''\
 && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''\
 && mkdir  /var/run/sshd/ \
 && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config\
 && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config \
 && chmod a+x -R /root/ext_lib/ && /root/ext_lib/build.sh
RUN echo "123456" | passwd --stdin root
WORKDIR "/root"
EXPOSE 22
CMD ["/usr/sbin/sshd -D"]