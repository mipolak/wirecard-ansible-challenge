# Wirecard - Ansible challenge

This challenge was assignment during the my interview process.   
I spent there 2 years with great people. 

Notes:  
 -  2024 - playbook rewritten and simplified 
           


## Objective

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


## Usage 

Clone the repository to the machine 

```sh 
git clone https://github.com/mipolak/wirecard-ansible-challenge.git

```
navigate to the repository 

```sh
cd wirecard-ansible-challenge
```

build docker image from Dockerfile , docker daemon should be running

```sh

docker build -t wd-challenge:latest .
```
start container 
```sh
docker run -d --name wd --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro localhost/wd-challenge:test
```
* Note: the exposed ports `-p 80:80 -p 443:443`can be included in non rootless docker version 

connect to the container and execute the ansible playbook
```sh
docker exec -it wd bash

ansible-playbook playbook.yml
```




