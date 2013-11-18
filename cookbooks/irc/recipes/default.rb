#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'tdi' do
  action :create
end

user 'tdi' do
  action :create
  uid 1000
  gid 'tdi'
  supports :manage_home => true
  comment "Test Driven Infrastructure"
  home "/Users/tdi"
  shell "/bin/bash"
end

package "irssi" do
  action :install
end

directory "/Users/tdi/.irssi" do
  owner 'tdi'
  group 'tdi'
end

cookbook_file "/Users/tdi/.irssi/config" do
  source 'irssi-config'
  owner 'tdi'
  group 'tdi'
end
