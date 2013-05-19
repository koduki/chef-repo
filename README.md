# koduki's Vagrant recipe 

vagrant + chef-solo standard recipe.

## Install Vagrant
    gem install vagrant

## Create VirtualMachine
    vagrant box add cent-ma01 https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box

    mkdir -p vagrant/cent-ma01
    cd cent-ma01

    vagrant init cent-ma01
    vagrant up

    # connection test.
    vagrant ssh

## Install knife-solo on local
    gem install knife-solo
    knife solo init chef-repo

## Install chife-solo on remote(virtual machine)
    cd chef-repo
    knife solo prepare vagrant@localhost -p 2222

## Modify Server Setting

    vim nodes/localhost.json

### modify yum setting.
    knife cookbook site vendor yum 
    knife cookbook create yumsetup -o site-cookbooks
    knife solo cook vagrant@localhost -p 2222

### modify base package and setting.
    knife cookbook create base_packages -o site-cookbooks
    knife cookbook create base_setting -o site-cookbooks
    knife solo cook vagrant@localhost -p 2222

### add users
    knife cookbook create add_users -o site-cookbooks
    # openssl passwd -1
    knife solo cook vagrant@localhost -p 2222

