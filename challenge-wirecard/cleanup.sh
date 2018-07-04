#!/bin/bash
#
sudo systemctl stop tomcat
sudo systemctl stop httpd
sudo rm -f /etc/systemd/system/tomcat.service
sudo rm -rf /opt/{apache-tomcat*,tomcat-latest}
sudo userdel tomcat
sudo yum -y remove httpd java-1.8.0-openjdk mod_ssl
sudo systemctl daemon-reload
sudo rm -rf /etc/httpd
sudo rm -f /etc/pki/tls/certs/server.{crt,key}
