id = 'modern_nginx'

default[id]['install'] = 'mainline'

default[id]['stable']['version'] = '1.12.0'
default[id]['stable']['checksum'] = \
  'b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30'

default[id]['mainline']['version'] = '1.13.1'
default[id]['mainline']['checksum'] = \
  'a5856c72a6609a4dc68c88a7f3c33b79e6693343b62952e021e043fe347b6776'

default[id]['with_openssl'] = true
default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_ct'] = true
default[id]['with_headers_more'] = true
default[id]['with_status'] = false

default[id]['openssl']['version'] = '1.0.2l'
default[id]['openssl']['checksum'] = \
  'ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c'

default[id]['ct']['version'] = '1.3.2'
default[id]['ct']['url'] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id]['ct']['checksum'] = \
  'b4ceae549b9dbf84b2e511633982e4efeee0388e3b7a038a8bac555008a77b88'

default[id]['headers_more']['version'] = '0.32'
default[id]['headers_more']['url'] = \
  "https://github.com/openresty/headers-more-nginx-module/archive/v%{version}.tar.gz"
default[id]['headers_more']['checksum'] = \
  'c6d9dab8ea1fc997031007e2e8f47cced01417e203cd88d53a9fe9f6ae138720'

default[id]['ssl_configuration'] = 'modern' # or intermediate
