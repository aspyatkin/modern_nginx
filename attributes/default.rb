id = 'modern_nginx'

default[id]['install'] = 'stable'

default[id]['stable']['version'] = '1.12.1'
default[id]['stable']['checksum'] = \
  '8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb'

default[id]['mainline']['version'] = '1.13.4'
default[id]['mainline']['checksum'] = \
  'de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'

default[id]['with_openssl'] = true
default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_ct'] = true
default[id]['with_headers_more'] = true
default[id]['with_status'] = false
default[id]['with_realip'] = false

default[id]['openssl']['version'] = '1.1.0f'
default[id]['openssl']['checksum'] = \
  '12f746f3f2493b2f39da7ecf63d7ee19c6ac9ec6a4fcd8c229da8a522cb12765'

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
