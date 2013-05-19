#
# Cookbook Name:: base_setting
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# SSH setting
service "sshd" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template '/etc/ssh/sshd_config' do
  source  'etc/ssh/sshd_config.erb'
  owner   'root'
  group   'root'
  mode    '0600'
  notifies :reload, 'service[sshd]'
end

# Disable SELinux
template '/etc/selinux/config' do
  source  'etc/selinux/config'
  owner   'root'
  group   'root'
  mode    '0644'
end

# /etc/skel setting
template '/etc/skel/.zshrc' do
  source  'etc/skel/dot_zshrc'
  owner   'root'
  group   'root'
  mode    '0644'
end

template '/etc/skel/.zshrc.mine' do
  source  'etc/skel/dot_zshrc.mine'
  owner   'root'
  group   'root'
  mode    '0644'
end

template '/etc/skel/.bashrc' do
  source  'etc/skel/dot_bashrc'
  owner   'root'
  group   'root'
  mode    '0644'
end


# Disable unnecessary services
%w{cpid apmd atd auditd autofs avahi-daemon avahi-dnsconfd bluetooth cups dhcdbd firstboot gpm hidd ip6tables iptables isdn mcstrans mdmonitor netfs nfslock pand pcscd portmap readahead_early restorecond rpcgssd rpcidmapd yum-updatesd xfs}.each do |service_name|
  service service_name do
    action [:disable, :stop]
  end
end
