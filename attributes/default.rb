id = 'modern_nginx'

default[id]['install'] = 'mainline'

default[id]['stable']['version'] = '1.10.1'
default[id]['stable']['tarball_checksum'] = '1fd35846566485e03c0e318989561c135c598323ff349c503a6c14826487a801'

default[id]['mainline']['version'] = '1.11.1'
default[id]['mainline']['tarball_checksum'] = '5d8dd0197e3ffeb427729c045382182fb28db8e045c635221b2e0e6722821ad0'

default[id]['with_http2'] = true
default[id]['with_ipv6'] = true
default[id]['with_dhparam'] = true
default[id]['with_ct'] = true

default[id]['openssl']['version'] = '1.0.2h'
default[id]['openssl']['tarball_checksum'] = '1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919'

default[id]['ct']['version'] = '1.2.0'
default[id]['ct']['url'] = 'https://github.com/grahamedgecombe/nginx-ct/archive'
default[id]['ct']['tarball_checksum'] = '63e6dcb16a7860520513598ff67bdcd3e978b5fcd96d63b2afb08a0cfd29f232'

default[id]['ssl_configuration'] = 'modern' # or intermediate
