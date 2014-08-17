#!/bin/bash -eux

CHEFDK='chefdk-0.2.0-2.el6.x86_64.rpm'
wget -O "/tmp/${CHEFDK}" \
  "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/${CHEFDK}"
rpm -Uvh "/tmp/${CHEFDK}"

echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc

yum install -y vim-enhanced
