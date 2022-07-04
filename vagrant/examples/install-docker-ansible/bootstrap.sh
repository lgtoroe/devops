#!/usr/bin/env bash

# This assumes vagrant mounts your working directory to /vagrant on the guest machine.

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y remove ansible
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# make sure ansible can run locally w/o ssh

echo 'localhost ansible_connection=local' >> /etc/ansible/hosts

# run playbook

ansible-playbook /vagrant/install_docker-ce.yml
