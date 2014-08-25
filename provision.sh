#!/usr/bin/env bash

# User settings
ESVERSION='1.3.2'
ESURL="https://download.elasticsearch.org/elasticsearch/elasticsearch"
TARFILE="elasticsearch-${ESVERSION}.tar.gz"

# Allow installation of PPAs and update packages
apt-get update
apt-get install -y python-software-properties

# Automated install of Oracle Java
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java7-installer

# Grab and unpack ElasticSearch tarball
wget -q "${ESURL}/${TARFILE}"
su vagrant -c "tar -zxf ${TARFILE}"

echo "ElasticSearch is not running, SSH in to start it"