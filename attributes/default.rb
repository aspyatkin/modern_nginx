id = :modern_nginx

default[id][:version] = '1.9.12'
default[id][:tarball_checksum] = '1af2eb956910ed4b11aaf525a81bc37e135907e7127948f9179f5410337da042'

default[id][:with_http2] = true
default[id][:with_ipv6] = true
default[id][:with_dhparam] = true
default[id][:with_ct] = true

default[id][:openssl][:version] = '1.0.2g'
default[id][:openssl][:tarball_checksum] = 'b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33'

default[id][:ct][:version] = '1.0.0'
default[id][:ct][:url] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id][:ct][:tarball_checksum] = 'b7a2cae4707c88cc9a3ff14bf5803de76be2d69d553dfd30937253c4312a8227'

default[id][:ssl_data_bag_name] = 'ssl'
default[id][:ssl_configuration] = 'modern'  # or indermediate
