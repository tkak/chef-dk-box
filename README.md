ChefDK Box
==========

Packer template to prepare Chef Development Environment with ChefDK and
Docker(kitchen-docker)


## Environment

|Box                      |OS               |Tools                                                    |
|-------------------------|-----------------|---------------------------------------------------------|
|centos-6.5-x86_64-chef-dk|CentOS 6.5 x86_64|Docker, ChefDK, kitchen-docker, git, vim, zsh + oh-my-zsh|


## Requirement

* Virtual Box
* Vagrant
* Packer


## Usage

### Make Vagrant Box Image

```
$ git clone git@github.com:tkak/chef-dk-box.git
$ cd packer
$ packer build centos-6.5-x86_64.json
$ vagrant box add centos-6.5-x86_64-chef-dk ../builds/virtualbox/centos-6.5-x86_64-chef-dk.box
$ vagrant box list
```


### Develop Chef Cookbook

```
$ cd /path/to/chef-dk-box
$ vagrant up
$ vagrant ssh
```

## References

* [ChefDK](http://downloads.getchef.com/chef-dk/)
* [Packer](http://www.packer.io/)
* [Bento](https://github.com/opscode/bento)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [sample-chef-repo](https://github.com/tkak/sample-chef-repo)

