require 'base64'

directory 'Create nginx SSL certificates directory' do
  Chef::Resource::Directory.send(:include, ::ModernNginx::Helper)
  path get_ssl_cert_directory
  owner 'root'
  group node['root_group']
  mode 0700
  action :create
end

directory 'Create nginx SCTS directory' do
  Chef::Resource::Directory.send(:include, ::ModernNginx::Helper)
  path get_scts_base_directory
  owner 'root'
  group node['root_group']
  mode 0700
  recursive true
  action :create
end

directory 'Create nginx ACME challenge directory' do
  Chef::Resource::Directory.send(:include, ::ModernNginx::Helper)
  path get_acme_challenge_base_directory
  owner 'root'
  group node['root_group']
  mode 0700
  recursive true
  action :create
end

data_bag_item(node[:modern_nginx][:ssl_data_bag_name], node.chef_environment).to_hash.fetch('certs', []).each do |entry|
  domain = entry['domains'][0]

  file "SSL certificate for #{domain}" do
    Chef::Resource::File.send(:include, ::ModernNginx::Helper)
    path get_ssl_certificate_path domain
    owner 'root'
    group node['root_group']
    mode 0600
    content entry['chain']
    action :create
  end

  file "SSL certificate private key for #{domain}" do
    Chef::Resource::File.send(:include, ::ModernNginx::Helper)
    path get_ssl_certificate_private_key_path domain
    owner 'root'
    group node['root_group']
    mode 0600
    content entry['private_key']
    action :create
  end

  directory "SCTS directory for #{domain}" do
    Chef::Resource::Directory.send(:include, ::ModernNginx::Helper)
    path get_scts_directory domain
    owner 'root'
    group node['root_group']
    mode 0700
    recursive true
    action :create
  end

  entry.fetch('scts', {}).each do |name, data|
    file "SCTS #{name} for #{domain}" do
      Chef::Resource::File.send(:include, ::ModernNginx::Helper)
      path ::File.join get_scts_directory(domain), "#{name}.sct"
      owner 'root'
      group node['root_group']
      mode 0644
      content Base64.decode64 data
      action :create
    end
  end

  entry.fetch('acme-challenge', {}).each do |challenge_domain, challenge_entries|
    directory "ACME challenge directory for #{challenge_domain}" do
      Chef::Resource::Directory.send(:include, ::ModernNginx::Helper)
      path get_acme_challenge_directory challenge_domain
      owner 'root'
      group node['root_group']
      mode 0700
      recursive true
      action :create
    end

    challenge_entries.each do |key, value|
      file "ACME challenge #{key} for #{challenge_domain}" do
        Chef::Resource::File.send(:include, ::ModernNginx::Helper)
        path ::File.join get_acme_challenge_directory(challenge_domain), key
        owner 'root'
        group node['root_group']
        content value
        mode 0644
        action :create
      end
    end
  end
end
