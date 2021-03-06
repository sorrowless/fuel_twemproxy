notice('MODULAR: twemproxy/twemproxy.pp')

$memcache_nodes        = get_nodes_hash_by_roles(hiera('network_metadata'), hiera('memcache_roles'))
$memcache_address_map  = get_node_to_ipaddr_map_by_network_role($memcache_nodes, 'mgmt/memcache')

$memcache_array = suffix(values($memcache_address_map), ':11211:1')


class { 'twemproxy':
  clients_array => $memcache_array,
}
