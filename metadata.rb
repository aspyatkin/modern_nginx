name 'modern_nginx'
description 'Installs and configures nginx'
version '2.11.0'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'nginx', '~> 8.1.2'
depends 'dhparam', '~> 1.0.0'
depends 'logrotate', '~> 2.2.0'
