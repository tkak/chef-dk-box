#!/bin/bash -eux

install_devtools(){
  apt-get install -y curl vim git zsh sysv-rc-conf
  touch /home/vagrant/.zshrc
  wget --no-check-certificate http://install.ohmyz.sh -O - | sudo -i -u vagrant sh
}

install_docker(){
  curl -sSL https://get.docker.io/ubuntu/ | sudo sh
  initctl docker start
  sysv-rc-conf docker on
}

install_chefdk(){
  CHEFDK='chefdk_0.2.1-1_amd64.deb'
  wget -O "/tmp/${CHEFDK}" \
    "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/${CHEFDK}"
  dpkg -i /tmp/${CHEFDK}
  
  echo 'eval "$(chef shell-init bash)"' >> /home/vagrant/.bashrc
  echo 'eval "$(chef shell-init zsh)"' >> /home/vagrant/.zshrc
}

install_devtools
install_docker
install_chefdk
