class yum::repos(
    $exclusive = false  # do we allow exclusive management or not ?
) {
    file { '/etc/yum.repos.d/':
        ensure => directory,    # make sure this is a directory
        recurse => true,    # recursively manage directory
        purge => $exclusive,    # purge all unmanaged files or not ?
        force => true,      # also purge subdirs and links
        owner => root,
        group => root,
        mode => '0644',     # u=rw,go=r
    }
}
# vim: set ft=puppet si sts=2 et tw=80 sw=2:
