name             'tram'
maintainer       'Nick Gerakines'
maintainer_email 'nick@gerakines.net'
license          'MIT'
description      'Installs/Configures tram'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

depends 'apt'
depends 'yum'
depends 'golang'

supports 'centos'
supports 'ubuntu'
