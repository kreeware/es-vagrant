#!/usr/bin/env bash

# User settings
ESVERSION='1.3.2'

# Allow installation of PPAs and update packages
apt-get update
apt-get install -y python-software-properties

# Automated install of Oracle Java
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java7-installer

# Install tools required to install node
apt-get install -y git curl
git clone https://github.com/isaacs/nave.git
./nave/nave.sh usemain stable
npm install -g esvm

echo "ElasticSearch is not running, SSH in to start it with 'esvm ${ESVERSION}'"