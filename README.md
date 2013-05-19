gem install vagrant

cd /tmp/
wget http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box
vagrant box add cent-ma01 https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box

cd program/
mkdir vagrant
cd vagrant/
mkdir cent-ma01
cd cent-ma01

vagrant init cent-ma01
vagrant up
vagrant ssh

gem install knife-solo
knife solo init chef-repo
cd chef-repo

knife solo prepare vagrant@localhost -p 2222

vim nodes/localhost.json

vim nodes/localhost.json
knife solo cook vagrant@localhost -p 2222

knife cookbook site vendor yum 
knife cookbook create yumsetup -o site-cookbooks
knife cookbook create base_packages -o site-cookbooks
knife cookbook create base_setting -o site-cookbooks
knife cookbook create add_users -o site-cookbooks

openssl passwd -1
git push -u origin master
knife solo cook vagrant@localhost -p 2222
