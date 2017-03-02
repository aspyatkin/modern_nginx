chef_gem 'chef-rewind'
require 'chef/rewind'

id = 'modern_nginx'

node.default['nginx']['install_method'] = 'source'

node.default['nginx']['version'] = node[id][node[id]['install']]['version']

node.default['nginx']['source']['version'] = node['nginx']['version']
node.default['nginx']['source']['prefix'] = \
  "/opt/nginx-#{node['nginx']['source']['version']}"
node.default['nginx']['source']['conf_path'] = \
  "#{node['nginx']['dir']}/nginx.conf"
node.default['nginx']['source']['sbin_path'] = \
  "#{node['nginx']['source']['prefix']}/sbin/nginx"
node.default['nginx']['source']['default_configure_flags'] = %W(
  --prefix=#{node['nginx']['source']['prefix']}
  --conf-path=#{node['nginx']['dir']}/nginx.conf
  --sbin-path=#{node['nginx']['source']['sbin_path']}
)

node.default['nginx']['configure_flags'] = []
node.default['nginx']['source']['url'] = \
  "http://nginx.org/download/nginx-#{node['nginx']['source']['version']}.tar.gz"
node.default['nginx']['source']['checksum'] = \
  node[id][node[id]['install']]['checksum']

module_list = %w(
  chef_nginx::http_gzip_static_module
  chef_nginx::http_ssl_module
  chef_nginx::openssl_source
)

module_list << 'chef_nginx::http_v2_module' if node[id]['with_http2']
module_list << 'chef_nginx::ipv6' if node[id]['with_ipv6']
module_list << "#{id}::ngx_ct_module" if node[id]['with_ct']

node.default['nginx']['source']['modules'] = module_list
node.default['nginx']['source']['use_existing_user'] = false

node.default['nginx']['openssl_source']['version'] = \
  node[id]['openssl']['version']
node.default['nginx']['openssl_source']['url'] = \
  'http://www.openssl.org/source/openssl-'\
  "#{node[id]['openssl']['version']}.tar.gz"

openssl_src_filename = ::File.basename(node['nginx']['openssl_source']['url'])
openssl_src_filepath = ::File.join(
  ::Chef::Config['file_cache_path'],
  openssl_src_filename
)

node.default['nginx']['server_tokens'] = 'off'
node.default['nginx']['default_site_enabled'] = false

include_recipe 'chef_nginx::default'

rewind remote_file: openssl_src_filepath do
  source node['nginx']['openssl_source']['url']
  checksum node[id]['openssl']['checksum']
  not_if { ::File.exist?(openssl_src_filepath) }
end

dhparam_path = nil

if node[id]['with_dhparam']
  dhparam_path = ::File.join(node['nginx']['dir'], 'dhparam.pem')

  execute 'Create OpenSSL dhparam file' do
    command "openssl dhparam 2048 -out #{dhparam_path}"
    user 'root'
    group node['root_group']
    creates dhparam_path
    action :run
  end
end

ssl_defaults_conf = ::File.join(
  node['nginx']['dir'],
  'conf.d',
  'ssl_defaults.conf'
)

template ssl_defaults_conf do
  source 'ssl.defaults.erb'
  mode 0644
  variables(
    ssl_dhparam: dhparam_path,
    ssl_configuration: node[id]['ssl_configuration']
  )
  notifies :reload, 'service[nginx]', :delayed
  action :create
end
