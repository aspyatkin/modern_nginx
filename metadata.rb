name 'modern_nginx'
description 'Installs and configures nginx'
version '2.8.0'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'chef_nginx', '~> 6.2.0'
depends 'dhparam', '~> 1.0.0'
depends 'logrotate', '~> 2.2.0'
