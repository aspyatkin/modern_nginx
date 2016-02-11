id = :modern_nginx

default[id][:version] = '1.9.11'
default[id][:tarball_checksum] = '6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f'

default[id][:with_http2] = true
default[id][:with_ipv6] = true
default[id][:with_dhparam] = true
default[id][:with_ct] = true

default[id][:openssl][:version] = '1.0.2f'
default[id][:openssl][:tarball_checksum] = '932b4ee4def2b434f85435d9e3e19ca8ba99ce9a065a61524b429a9d5e9b2e9c'

default[id][:ct][:version] = '1.0.0'
default[id][:ct][:url] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id][:ct][:tarball_checksum] = 'b7a2cae4707c88cc9a3ff14bf5803de76be2d69d553dfd30937253c4312a8227'

default[id][:ssl_data_bag_name] = 'ssl'
