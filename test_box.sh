#!/bin/sh -ex

box_name=$1
export BOX_NAME=${box_name}
vagrant box remove ${box_name}
vagrant box add $box_name ./builds/virtualbox/${box_name}.box
vagrant destroy -f && vagrant up && rake spec
