#
# Cookbook Name:: add_users
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# shared users
user "glassfish" do

  comment "glassfish user"
  home "/home/glassfish"
  shell "/bin/bash"
  supports :manage_home => true
end

# operation users
user "koduki" do
  comment "operation user"
  home "/home/koduki"
  shell "/bin/zsh"
  group "users"
  password "$1$CpUuFdgl$OH95aHPqqir.GOtNrmK75."
  supports :manage_home => true
end

group "wheel" do
  action :modify
  members ['koduki']
  append true
end
