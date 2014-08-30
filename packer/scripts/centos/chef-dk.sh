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
  service docker start
  chkconfig docker on
}

install_chefdk(){
  CHEFDK='chefdk-0.2.1-1.el6.x86_64.rpm'
  wget -O "/tmp/${CHEFDK}" \
    "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/${CHEFDK}"
  rpm -Uvh "/tmp/${CHEFDK}"
  
  echo 'eval "$(chef shell-init bash)"' >> /home/vagrant/.bashrc
  echo 'eval "$(chef shell-init zsh)"' >> /home/vagrant/.zshrc
}

install_devtools
install_docker
install_chefdk
