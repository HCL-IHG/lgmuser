luser = node['lgmuser']['user']
lgroup = node['lgmuser']['group']
lurl = node['lgmuser']['url']

group lgroup do
  gid 1234
  group_name lgroup
  not_if "getent group #{lgroup}"
end

directory "/home/#{luser}" do
  owner luser
  group lgroup
  mode '0755'
  action :create
end

user luser do
  comment 'LogicMonitor local linux ssh account'
  uid 1234
  username luser
  gid lgroup
  home "/home/#{luser}"
  shell '/bin/bash'
  not_if "getent passwd #{luser}"
end

remote_file '/tmp/logicmonitor_ihg_ssh.tgz' do
  source lurl
  user   luser
  group  lgroup
  mode   '0444'
  action :create
end

archive_file 'logicmonitor_ihg_ssh.tgz' do
  owner luser
  group lgroup
  mode '700'
  path '/tmp/logicmonitor_ihg_ssh.tgz'
  destination "/home/#{luser}"
end
