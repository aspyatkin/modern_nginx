id = 'modern_nginx'

default[id]['install'] = 'mainline'

default[id]['stable']['version'] = '1.10.3'
default[id]['stable']['checksum'] = \
  '75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90'

default[id]['mainline']['version'] = '1.11.13'
default[id]['mainline']['checksum'] = \
  '360b601ef8ed2998c80fa56a27bf3cd745c3ce18c5fb10892e6595467b1415d3'

default[id]['with_openssl'] = true
default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_ct'] = true
default[id]['with_status'] = false

default[id]['openssl']['version'] = '1.0.2k'
default[id]['openssl']['checksum'] = \
  '6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0'

default[id]['ct']['version'] = '1.3.2'
default[id]['ct']['url'] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id]['ct']['checksum'] = \
  'b4ceae549b9dbf84b2e511633982e4efeee0388e3b7a038a8bac555008a77b88'

default[id]['ssl_configuration'] = 'modern' # or intermediate
