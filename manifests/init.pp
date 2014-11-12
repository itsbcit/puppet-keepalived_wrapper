# keepalived_wrapper
class keepalived_wrapper {
  # TODO: implement merge behaviour

  $keepalived_global_defs = hiera_hash('keepalived_wrapper::global_defs', {})
  $keepalived_vrrp_instances = hiera_hash('keepalived_wrapper::vrrp_instances', {})
  $keepalived_vrrp_scripts = hiera_hash('keepalived_wrapper::vrrp_scripts', {})
}
