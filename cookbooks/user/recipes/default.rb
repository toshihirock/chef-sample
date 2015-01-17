#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{toshi abc}.each do |name|
  user name do
    shell "/bin/bash"
    action :create
  end
end

# add the EPEL repo
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :create
end

%w{python s3cmd ntpd}.each do |name|
  package name do
    action :install
  end
end

# set Japan time
file "/etc/localtime" do
  content IO.read("/usr/share/zoneinfo/Japan"
  action :create
end

cookbook_file "clock" do
  path /etc/sysconfig/clock
  action :create
end

execute "get japan time"
  command "ntpdate" "ntp.nict.jp"
end
