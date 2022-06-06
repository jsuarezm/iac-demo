#!/bin/bash

echo "Installing Ansible ..."
cd /home/adminuser
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible --yes
ansible --version
git clone https://github.com/jsuarezm/iac-demo.git
cd /home/adminuser/iac-demo/web
sudo ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 playbook.yml