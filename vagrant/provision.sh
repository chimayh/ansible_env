#!/bin/bash

packages=(
  ansible
  git
)
sudo apt-get update
sudo apt-get install -y "${packages[@]}"

# ansible
git clone https://github.com/yteraoka/ansible-tutorial.git

cat <<EOF > hosts
[test-servers]
192.168.33.12
EOF

cat <<_EOF_ > simple-playbook.xml
---
- hosts: test-servers
  sudo: yes
  tasks:
    - name: update packages
      apt: update_cache=yes

    - name: be sure httpd is installed
      apt: name=apache2 state=installed

    - name: be sure httpd is running and enabled
      service: name=apache2 state=started enabled=yes
_EOF_


# serverspec
sudo gem install bundler

mkdir serverspec
cd serverspec
cat <<_EOF_ > Gemfile
source 'https://rubygems.org'

gem 'serverspec'
gem 'rake'
_EOF_
bundle install --path gems
