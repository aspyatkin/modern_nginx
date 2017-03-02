name 'modern_nginx'
description 'Installs and configures nginx'
version '2.0.0'

recipe 'modern_nginx', 'Installs and configures nginx'
depends 'chef_nginx', '~> 5.1.0'
