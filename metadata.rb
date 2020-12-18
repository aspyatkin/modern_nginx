name 'modern_nginx'
description 'Installs and configures nginx'
version '2.13.1'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'nginx'
depends 'dhparam', '~> 2.0'
depends 'logrotate', '~> 2.2'
