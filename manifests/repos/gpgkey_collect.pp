# collect the keys from the gpgkey defines that have the same tag...
class yum::repos::gpgkey_collect(
    $tag = undef
) {
    File <<| tag == "${tag}" |>>
}
# vim: set ft=puppet si sts=2 et tw=80 sw=2:
