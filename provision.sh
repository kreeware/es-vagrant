#!/usr/bin/env bash

# User settings
ESVERSION='1.3.2'

# Allow installation of PPAs and update packages
apt-get update
apt-get install -y python-software-properties

# Set the time zone
echo "America/Phoenix" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Automated install of Oracle Java
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer

# Install tools required to install node
apt-get install -y git curl unzip screen
git clone https://github.com/isaacs/nave.git
./nave/nave.sh usemain 2.4.0
npm install -g esvm

# Make elasticsearch not choke
echo "#### Elasticserch settings" >> /etc/security/limits.conf
echo "* soft nproc 65535" >> /etc/security/limits.conf
echo "* hard nproc 65535" >> /etc/security/limits.conf
echo "* soft nofile 65535" >> /etc/security/limits.conf
echo "* hard nofile 65535" >> /etc/security/limits.conf
echo "* soft memlock unlimited" >> /etc/security/limits.conf
echo "* hard memlock unlimited" >> /etc/security/limits.conf
ulimit -n 65535
ulimit -l unlimited

echo "ElasticSearch is not running, SSH in to start it. esvm.rc is in /vagrant"
