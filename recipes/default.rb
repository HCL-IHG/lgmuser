#
# Cookbook:: ihg_lmconfig
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
script 'install_something' do
  interpreter 'bash'
  user 'root'
  cwd '/tmp'
  code <<-EOH
    id -u lgmuser1 2>&1 >/dev/null && echo "user lgmuser1 exists" || useradd -r -m lgmuser1 -c "LogicMonitor local linux ssh account"
    su - lgmuser1
    wget http://www.sbeams.org/sample_data/Microarray/External_test_data.tar.gz
    tar xvfz External_test_data.tar.gz
  EOH
end

