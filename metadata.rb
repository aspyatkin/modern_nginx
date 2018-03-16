name 'modern_nginx'
description 'Installs and configures nginx'
version '2.10.1'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'nginx', '~> 8.1.0'
depends 'dhparam', '~> 1.0.0'
depends 'logrotate', '~> 2.2.0'
