id = 'modern_nginx'

default[id]['install'] = 'stable'

default[id]['stable']['version'] = '1.14.0'
default[id]['stable']['checksum'] = \
  '5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'

default[id]['mainline']['version'] = '1.13.12'
default[id]['mainline']['checksum'] = \
  'fb92f5602cdb8d3ab1ad47dbeca151b185d62eedb67d347bbe9d79c1438c85de'

default[id]['with_openssl'] = true
default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_ct'] = true
default[id]['with_headers_more'] = true
default[id]['with_status'] = false
default[id]['with_realip'] = false
default[id]['with_geoip2'] = false
default[id]['with_secure_link'] = false
default[id]['with_debug'] = false

default[id]['openssl']['version'] = '1.1.0h'
default[id]['openssl']['checksum'] = \
  '5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517'

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
  '1a002b9321244c689ee20a46c1b368e2bf2e3ce5f29148de38820891b5db17d5'

default[id]['geoip2']['databases']['city']['name'] = 'GeoLite2-City.mmdb'
default[id]['geoip2']['databases']['city']['url'] = \
  'http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'
default[id]['geoip2']['databases']['city']['checksum'] = \
  'c86219316fbadccfe3973330e3946ce14bd57dbadafdb5e7c0f526c5bb27a933'

default[id]['ssl_configuration'] = 'modern' # or intermediate
