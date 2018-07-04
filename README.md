# Challenge

The challenge objective is to evaluate your logic and capacity to use one of the major configuration management tools.
The task objective is to have a web application deployed using Infrastructure as Code backed by a Reverse Proxy running secured by SSL.



To deploy the application you can select one of these options:

1. Ansible
2. Puppet
3. Chef

You should be able to:

1. Spin up a WebServer of your choice
2. Deploy the WAR file located in the directory assets named devopschallenge.war
3. Manage and Install a Reverse Proxy with SSL;
4. Write Unit and Integration Tests
 
The evaluator will check out your repository and will review:

1. Code design
2. Best practices
3. Outcomes achievement
4. Your tests

The evaluator will execute your code and it should be able to see a web application running,

Requirements
------------
The test page should be accessed through this address:

https://<host>/hello

The server certificate can be Self Signed,
Tests should show that this page is reachable, you should provide a way to test your code: `kitchen`, `molecule`, `vagrant`, `docker`...

Test Directions
----------------
There is one branch for each configuration management tool.

If you want to use ansible, for example, use the branch ansible: `git checkout ansible`

You should write all of your code inside the folder `challenge-wirecard`.


##  LAB MACHINE DETAILS

#####Parameters of VM:
```
2 CPUs, 3GB of RAM,  Disk 8GB
VM in Oracle Virtualbox 5.2.12
HW Virtualization: enabled VT-x/AMD-V, enabled Nested Paging
Network: Adapter1 connected to bridged adapter

OS: CentOS Linux release 7.5.1804 (Core)

Hostname: master.challenge.me
IP: 192.168.1.200/24

DNS resolve settings for proper yum functionality (/etc/resolv.conf) 
search challenge.me
nameserver 8.8.8.8
nameserver 192.168.1.1

Packages installed from epel reposity with dependencies:
git-1.8.3.1-14.el7_5.x86_64
ansible-2.5.5-1.el7.noarch
docker-1.13.1-63.git94f4240.el7.centos.x86_64

Test user: user
Sudo rights: user    ALL=(ALL)       NOPASSWD: ALL
```

Additional settings:
```
git repository cloned to /home/user/challenge 
Ansible configuration file moved from /etc/ansible/ to /home/user/challenge/challenge-wirecard
Folder /etc/ansible/ removed and created link to folder challenge-wirecard 
```


##  STRUCTURE 
```
challenge/
├── assets
│   └── devopschallenge.war
├── challenge-wirecard
│   ├── ansible.cfg
│   ├── cleanup.sh
│   ├── hosts
│   ├── playbook-docker.yml
│   ├── playbook-systemd.yml
│   ├── README.md
│   ├── roles
│   │   ├── common
│   │   │   ├── files -> ../../../assets
│   │   │   ├── templates
│   │   │   │   ├── challenge.conf.j2
│   │   │   │   ├── httpd.conf.j2
│   │   │   │   ├── tomcat.service.j2
│   │   │   │   ├── tomcat_start.j2
│   │   │   │   └── tomcat_stop.j2
│   │   │   └── vars
│   │   │       └── main.yml
│   │   ├── deployment-docker
│   │   │   ├── files -> ../common/files
│   │   │   ├── tasks
│   │   │   │   ├── main.yml
│   │   │   │   └── tomcat.yml
│   │   │   └── vars -> ../common/vars
│   │   ├── deployment-systemd
│   │   │   ├── files -> ../common/files
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── tasks
│   │   │   │   ├── main.yml
│   │   │   │   └── tomcat.yml
│   │   │   └── vars -> ../common/vars
│   │   ├── installation-docker
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── tasks
│   │   │   │   ├── httpd.yml
│   │   │   │   ├── main.yml
│   │   │   │   ├── ssl-certs.yml
│   │   │   │   └── tomcat.yml
│   │   │   ├── templates -> ../common/templates
│   │   │   └── vars -> ../common/vars
│   │   ├── installation-systemd
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── tasks
│   │   │   │   ├── httpd.yml
│   │   │   │   ├── main.yml
│   │   │   │   ├── ssl-certs.yml
│   │   │   │   └── tomcat.yml
│   │   │   ├── templates -> ../common/templates
│   │   │   └── vars -> ../common/vars
│   │   └── monitoring
│   │       ├── tasks
│   │       │   └── main.yml
│   │       └── vars -> ../common/vars
│   └── test_result.txt
├── CHANGELOG.md
├── Dockerfile
├── PageScreenshot.png
└── README.md

```


## TESTS EXECUTION
####DOCKER VERSION

- build docker image from Docker file as root , docker daemon should be running
-  or pull prepared image for execution from docker hub ( `docker pull mipolak/testing` )
```sh
cd challenge
docker build .
```
- create docker container with generated image ID
```sh
docker create -t -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -p 443:443 -i <image ID> bash
```
- start docker container with generated container ID
```sh
docker start -a -i <docker container ID>
```

- execute ansible docker playbook
```sh
ansible-playbook challenge-wirecard/playbook-docker.yml
```



**Other way to test docker playbook**
- uncomment last line with ansible-playbook in Dockerfile and build it again, docker playbook will be executed during build process



####LOCAL SERVER WITH SYSTEMD

- navigate to challenge folder and execute systemd playbook as user
```sh
cd challenge
ansible-playbook challenge-wirecard/playbook-systemd.yml
```


**All test result were coppied to test_result.txt** 


