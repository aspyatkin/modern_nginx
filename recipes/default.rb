chef_gem 'chef-rewind'
require 'chef/rewind'

id = :modern_nginx

node.default['nginx']['install_method'] = 'source'
node.default['nginx']['source']['version'] = node[id][:version]
node.default['nginx']['source']['prefix'] = "/opt/nginx-#{node[id][:version]}"
node.default['nginx']['source']['url'] = "http://nginx.org/download/nginx-#{node[id][:version]}.tar.gz"
node.default['nginx']['source']['checksum'] = node[id][:tarball_checksum]
node.default['nginx']['source']['sbin_path'] = "#{node['nginx']['source']['prefix']}/sbin/nginx"
node.default['nginx']['source']['default_configure_flags'] = %W(
  --prefix=#{node['nginx']['source']['prefix']}
  --conf-path=#{node['nginx']['dir']}/nginx.conf
  --sbin-path=#{node['nginx']['source']['sbin_path']}
)

module_list = [
  'nginx::http_gzip_static_module',
  'nginx::http_ssl_module',
  'nginx::openssl_source'
]

if node[id][:with_http2]
  module_list << "#{id}::http_v2_module"
end

if node[id][:with_ipv6]
  module_list << 'nginx::ipv6'
end

node.default['nginx']['source']['modules'] = module_list

node.default['nginx']['openssl_source']['version'] = node[id][:openssl][:version]
node.default['nginx']['openssl_source']['url'] = "http://www.openssl.org/source/openssl-#{node[id][:openssl][:version]}.tar.gz"

node.default['nginx']['server_tokens'] = 'off'
node.default['nginx']['default_site_enabled'] = false

include_recipe 'nginx::source'

openssl_src_filename = ::File.basename node['nginx']['openssl_source']['url']
openssl_src_filepath = ::File.join Chef::Config[:file_cache_path], openssl_src_filename
extract_path = "#{Chef::Config['file_cache_path']}/openssl-#{node['nginx']['openssl_source']['version']}"

rewind :remote_file => openssl_src_filepath do
  source node['nginx']['openssl_source']['url']
  owner 'root'
  checksum node[id][:openssl][:tarball_checksum]
  group node['root_group']
  mode 0644
  action :create
end

ssl_defaults_conf = ::File.join node[:nginx][:dir], 'conf.d', 'ssl_defaults.conf'

dhparam_path = nil

if node[id][:with_dhparam]
  dhparam_path = ::File.join node[:nginx][:dir], 'dhparam.pem'

  execute 'Create OpenSSL dhparam file' do
    command "openssl dhparam 2048 -out #{dhparam_path}"
    user 'root'
    group node['root_group']
    creates dhparam_path
    action :run
  end
end

template ssl_defaults_conf do
  source 'ssl.defaults.erb'
  mode 0644
  notifies :reload, 'service[nginx]', :delayed
  variables ssl_dhparam: dhparam_path
  action :create
end
