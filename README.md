fuel_twemproxy
==============

This plugin installs and configure twemproxy as a memcached load-balancer. It
installs to all *-controller and *-compute nodes and will be used as a
memcached point to all services that use it.

Swift nodes won't be touched by this plugin as they used separate memcached
instance.

