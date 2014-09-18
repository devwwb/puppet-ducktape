class ducktape::openvpn (
  $enabled  = true,
) {

  validate_bool($enabled)

  if $enabled {
    include ::ducktape::openvpn::autoload

    # External checks.
    if defined('::monit') and defined(Class['::monit']) {
      include ::ducktape::openvpn::external::monit
    }
  }

}
