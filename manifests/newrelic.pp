class ducktape::newrelic (
  $enabled = true,
) {

  validate_bool($enabled)

  if $enabled {
    create_resources('newrelic::server', hiera_hash('ducktape::newrelic::server', {}))
    if defined('::php') and defined(Class['::php']) {
      create_resources('newrelic::php', hiera_hash('ducktape::newrelic::php',{}))
    }
  }

}
