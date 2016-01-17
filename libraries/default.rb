module ModernNginx
  module Helper
    def get_ssl_cert_directory
      ::File.join node['nginx']['dir'], 'cert'
    end

    def get_ssl_certificate_path(domain)
      ::File.join get_ssl_cert_directory, "#{domain}.chain.crt"
    end

    def get_ssl_certificate_private_key_path(domain)
      ::File.join get_ssl_cert_directory, "#{domain}.key"
    end

    def get_scts_base_directory
      ::File.join node['nginx']['dir'], 'scts'
    end

    def get_scts_directory(domain)
      ::File.join get_scts_base_directory, domain
    end

    def get_acme_challenge_base_directory
      ::File.join node['nginx']['dir'], 'acme-challenge'
    end

    def get_acme_challenge_directory(domain)
      ::File.join get_acme_challenge_base_directory, domain
    end

    def get_ssl_certificate_entry(domain)
      data_bag_item(node[:modern_nginx][:ssl_data_bag_name], node.chef_environment).to_hash.fetch('certs', []).detect do |entry|
        entry['domains'].include? domain
      end
    end

    def get_hpkp_pins(domain)
      entry = get_ssl_certificate_entry domain
      if entry.nil?
        []
      else
        entry.fetch 'hpkp_pins', []
      end
    end
  end
end
