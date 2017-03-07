name 'modern_nginx'
description 'Installs and configures nginx'
version '2.1.0'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'chef_nginx', '~> 5.1.0'
depends 'dhparam', '~> 1.0.0'
