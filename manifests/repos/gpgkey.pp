# NOTE: this define does not depend on the other classes or define's
# NOTE: this define is used to create exported resources of gpgkeys!
# NOTE: this define uses the custom yum_repos_* facts in this module
define yum::repos::gpgkey(
    $tag = undef,
    $basepath = '/etc/pki/rpm-gpg/'
) {
    $f = sprintf("%s/${name}", regsubst($basepath, '\/$', ''))  # slash
    $failure = "# Problem getting fact!\n"
    # downcase is required because fact names can only be lowercase; weird!
    # this does a fact lookup and returns an error message if it is missing
    $content = inline_template("<%= scope.to_hash.fetch('yum_repos_gpgkey_${name}'.downcase, '${failure}') %>")
    if "${content}" == "${failure}" {
        warning("Problem getting fact: '${name}'.")
    }

    @@file { "${f}":
        tag => "${tag}",
        content => "${content}",
        owner => root, group => root, mode => '0644', backup => false,
        ensure => present,
    }
}
# vim: set ft=puppet si sts=2 et tw=80 sw=2:
