# Cookbook Name:: base_packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{zsh tmux emacs-nox vim java-1.7.0-openjdk java-1.7.0-openjdk-devel}.each do |pkg|
  package pkg do
    action :install
  end
end
