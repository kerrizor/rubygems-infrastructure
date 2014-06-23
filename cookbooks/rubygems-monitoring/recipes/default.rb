#
# Cookbook Name:: rubygems-monitoring
# Recipe:: default
#

include_recipe 'chef-vault'

dnsimple_credentials = chef_vault_item('dnsimple', 'credentials')

include_recipe 'dwradcliffe-dnsimple'

dwradcliffe_dnsimple_record "create CNAME point monitoring.rubygems.org to #{node.name}" do
  name     'monitoring.rubygems.org'
  content  node['cloud_v2']['public_hostname']
  type     'CNAME'
  domain   'rubygems.org'
  username dnsimple_credentials['username']
  password dnsimple_credentials['password']
  action   :create
end

include_recipe 'rubygems-sensu::server'
include_recipe 'rubygems'
