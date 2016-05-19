id = :modern_nginx

default[id][:version] = '1.10.0'
default[id][:tarball_checksum] = '8ed647c3dd65bc4ced03b0e0f6bf9e633eff6b01bac772bcf97077d58bc2be4d'

default[id][:with_http2] = true
default[id][:with_ipv6] = true
default[id][:with_dhparam] = true
default[id][:with_ct] = true

default[id][:openssl][:version] = '1.0.2h'
default[id][:openssl][:tarball_checksum] = '1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919'

default[id][:ct][:version] = '1.2.0'
default[id][:ct][:url] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id][:ct][:tarball_checksum] = '63e6dcb16a7860520513598ff67bdcd3e978b5fcd96d63b2afb08a0cfd29f232'

default[id][:ssl_data_bag_name] = 'ssl'
default[id][:ssl_configuration] = 'modern' # or indermediate
