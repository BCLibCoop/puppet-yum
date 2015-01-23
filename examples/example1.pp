# causes the equivalent of /usr/bin/yum -y groupinstall "Development tools"
# also works with normal rpm packages

yum::package { '@Development tools':
  ensure => present,
}
# vim: set ft=puppet si sts=2 et tw=80 sw=2:
