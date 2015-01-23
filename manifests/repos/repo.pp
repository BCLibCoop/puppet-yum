define yum::repos::repo(
    $baseurl = '',      # This can be used instead of or with the mirrorlist option.
    $mirrorlist = '',   # This can be used instead of or with the baseurl option.
    $enabled = true,
    $gpgcheck = true,
    $gpgkeys = '',      # single str or array
    $namespace = '',    # use to enable macaronic magic with this string
    $priority = 99,     # TODO: cobbler seems to add this option with 99 as default. what should i do ?
    $includepkgs = [],  # This is a list of packages you want to use from a repository. If this option lists only one package then that is all yum will ever see from the repository.
    $excludepkgs = [],  # This is a list of packages to never include or update from this repo.
    $ensure = present
) {
    include 'yum::repos'

    $bool_enabled = $enabled ? {
        true => '1',
        default => '0',
    }

    $bool_gpgcheck = $gpgcheck ? {
        true => '1',
        default => '0',
    }

    file { "/etc/yum.repos.d/${name}.repo":
        content => template('yum/repo.erb'),
        owner => root,
        group => root,
        mode => '0644', # should be readable by all so users can yum X
        require => File['/etc/yum.repos.d/'],
        ensure => $ensure,
    }
}
# vim: set ft=puppet si sts=2 et tw=80 sw=2:
