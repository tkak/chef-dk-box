# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.define :node do |node|
    #node.vm.box = "tkak/centos-6.5-x86_64-chef-dk"
    node.vm.box = "centos-6.5-x86_64-chef-dk"
    #node.vm.box = "ubuntu-14.04-amd64-chef-dk"
  end

end
