#!/bin/bash -eux

install_devtools(){
  yum install -y vim-enhanced git zsh
  touch /home/vagrant/.zshrc
  wget --no-check-certificate http://install.ohmyz.sh -O - | sudo -i -u vagrant sh
}

install_docker(){
  EPEL='epel-release-6-8.noarch.rpm'
  wget -O "/tmp/${EPEL}" "http://dl.fedoraproject.org/pub/epel/6/x86_64/${EPEL}"
  rpm -Uvh "/tmp/${EPEL}"

  yum install -y docker-io
  /sbin/service docker start
  /sbin/chkconfig docker on
}

install_chefdk(){
  CHEFDK="chefdk-${CHEFDK_VERSION}-1.x86_64.rpm"
  wget --no-check-certificate -O "/tmp/${CHEFDK}" \
    "https://packagecloud.io/chef/stable/download?distro=6&filename=${CHEFDK}"
  rpm -Uvh "/tmp/${CHEFDK}"
  
  echo 'eval "$(chef shell-init bash)"' >> /home/vagrant/.bashrc
  echo 'eval "$(chef shell-init zsh)"' >> /home/vagrant/.zshrc
}

install_devtools
install_docker
install_chefdk
