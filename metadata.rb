name 'modern_nginx'
description 'Installs and configures nginx'
version '2.6.0'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'chef_nginx', '~> 6.1.1'
depends 'dhparam', '~> 1.0.0'
depends 'logrotate', '~> 2.2.0'
