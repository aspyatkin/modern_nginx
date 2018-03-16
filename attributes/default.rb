id = 'modern_nginx'

default[id]['install'] = 'stable'

default[id]['stable']['version'] = '1.12.2'
default[id]['stable']['checksum'] = \
  '305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416'

default[id]['mainline']['version'] = '1.13.8'
default[id]['mainline']['checksum'] = \
  '8410b6c31ff59a763abf7e5a5316e7629f5a5033c95a3a0ebde727f9ec8464c5'

default[id]['with_openssl'] = true
default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_ct'] = true
default[id]['with_headers_more'] = true
default[id]['with_status'] = false
default[id]['with_realip'] = false
default[id]['with_geoip2'] = false
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

default[id]['geoip2']['version'] = '2.0'
default[id]['geoip2']['url'] = 'https://github.com/leev/ngx_http_geoip2_module/archive'
default[id]['geoip2']['checksum'] = \
  'ebb4652c4f9a2e1ee31fddefc4c93ff78e651a4b2727d3453d026bccbd708d99'

default[id]['geoip2']['databases']['dir'] = '/etc/chef-nginx/geolite2'

default[id]['geoip2']['databases']['country']['name'] = 'GeoLite2-Country.mmdb'
default[id]['geoip2']['databases']['country']['url'] = \
  'http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz'
default[id]['geoip2']['databases']['country']['checksum'] = \
  '7f4b455ba611b623ae9f45afe5249aae9f881befd4f78489d21dee6f94faf1fa'

default[id]['geoip2']['databases']['city']['name'] = 'GeoLite2-City.mmdb'
default[id]['geoip2']['databases']['city']['url'] = \
  'http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'
default[id]['geoip2']['databases']['city']['checksum'] = \
  '82400c9519f8c3d90b7b4eea451053c55efbc939d9de69f1fbc3bd443be652ed'

default[id]['ssl_configuration'] = 'modern' # or intermediate
