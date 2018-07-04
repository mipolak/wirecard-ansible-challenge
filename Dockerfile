FROM williamyeh/ansible:centos7

MAINTAINER Michal Polak <misopo@gmail.com>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN mkdir -p /run/httpd
VOLUME [ "/sys/fs/cgroup" ]
EXPOSE 80
EXPOSE 443
CMD ["/usr/sbin/init"]

# ==> Copying Ansible playbook...
WORKDIR /tmp
COPY  .  /tmp

# ==> Executing Ansible...
#RUN ansible-playbook challenge-wirecard/playbook-docker.yml 
