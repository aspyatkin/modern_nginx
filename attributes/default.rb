id = 'modern_nginx'

default[id]['install'] = 'stable'

default[id]['stable']['version'] = '1.12.2'
default[id]['stable']['checksum'] = \
  '305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416'

default[id]['mainline']['version'] = '1.13.6'
default[id]['mainline']['checksum'] = \
  '8512fc6f986a20af293b61f33b0e72f64a72ea5b1acbcc790c4c4e2d6f63f8f8'

default[id]['with_openssl'] = true
default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_ct'] = true
default[id]['with_headers_more'] = true
default[id]['with_status'] = false
default[id]['with_realip'] = false
default[id]['with_debug'] = false

default[id]['openssl']['version'] = '1.1.0g'
default[id]['openssl']['checksum'] = \
  'de4d501267da39310905cb6dc8c6121f7a2cad45a7707f76df828fe1b85073af'

default[id]['ct']['version'] = '1.3.2'
default[id]['ct']['url'] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id]['ct']['checksum'] = \
  'b4ceae549b9dbf84b2e511633982e4efeee0388e3b7a038a8bac555008a77b88'

default[id]['headers_more']['version'] = '0.33'
default[id]['headers_more']['url'] = \
  "https://github.com/openresty/headers-more-nginx-module/archive/v%{version}.tar.gz"
default[id]['headers_more']['checksum'] = \
  'a3dcbab117a9c103bc1ea5200fc00a7b7d2af97ff7fd525f16f8ac2632e30fbf'

default[id]['ssl_configuration'] = 'modern' # or intermediate
