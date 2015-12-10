notice('MODULAR: twemproxy/hiera_override.pp')

$hiera_dir   = '/etc/hiera/override'
$plugin_yaml = 'twemproxy.yaml'
$plugin_name = 'twemproxy'
$content     = "memcached_addresses: [127.0.0.1]\nmemcache_server_port: '22122'"

file { '/etc/hiera/override':
  ensure  => directory,
}

file { "${hiera_dir}/${plugin_yaml}":
  ensure  => file,
  content => $content,
  require => File['/etc/hiera/override'],
}

file_line { "${plugin_name}_hiera_override":
  path  => '/etc/hiera.yaml',
  after => '    - "override/module/%{calling_module}"',
  line  => "    - override/${plugin_name}",
}
