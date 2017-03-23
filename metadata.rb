name 'modern_nginx'
description 'Installs and configures nginx'
version '2.1.1'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'chef_nginx', '~> 5.1.2'
depends 'dhparam', '~> 1.0.0'
