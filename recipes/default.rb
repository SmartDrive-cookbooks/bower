#
# Cookbook Name:: bower
# Recipe:: default
#
# Copyright 2015, Yuki Osawa
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nvm"

ndv = node["bower"]["nodejs"]["version"]

nvm_nodejs ndv do
  alias_default_flag true
end

# bower install
nvm_npm "bower" do
  nodejs_version ndv
  %w{version local_flag registry path}.each do |attr|
    send(attr, node["bower"][attr]) if node["bower"][attr]
  end
  action :install
end
