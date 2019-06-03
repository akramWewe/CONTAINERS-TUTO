#!/bin/bash

TERRAFORM_VERSION="0.11.10"
echo "Run this in mode root"
cd /tmp

echo "Upgrading installed packages..."
yum upgrade -y

echo "install git"
yum install -y git

echo "install ocitools"
wget http://download-ib01.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release*rpm
yum -y --enablerepo=epel-testing install ocitools

echo "install docker"
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker

echo "install riddler"
export RIDDLER_SHA256="cf319c1be2f6007736c6a618d0746dcff4f291fc112c9d7150c5270b4c182580"
# Download and check the sha256sum.
$ curl -fSL "https://github.com/genuinetools/riddler/releases/download/v0.6.3/riddler-linux-amd64" -o "/usr/local/bin/riddler" \
	&& echo "${RIDDLER_SHA256}  /usr/local/bin/riddler" | sha256sum -c - \
	&& chmod a+x "/usr/local/bin/riddler"

echo "echo install buildah"
sudo yum -y install buildah
sudo yum -y install podman