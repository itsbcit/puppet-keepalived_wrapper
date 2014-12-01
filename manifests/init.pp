# keepalived_wrapper

# keepalived::global_defs_merge: true
# keepalived::global_defs:
#   'notification_email': 'server.alerts@iheki.co'
#   'notification_email_from': 'keepalived@%{::fqdn}'
#   'smtp_server': 'localhost'
#   'smtp_connect_timeout': '60'
#   'router_id': 'default_router_id'
# keepalived::service_ensure: 'running'
# keepalived::service_enable: true
# keepalived::vrrp_instances_merge: true
# keepalived::vrrp_instances: {}
# keepalived::vrrp_scripts_merge: true
# keepalived::vrrp_scripts: {}
class keepalived_wrapper {

  $keepalived_global_defs    = hiera_hash('keepalived::global_defs', {})
  $keepalived_vrrp_instances = hiera_hash('keepalived::vrrp_instances', {})
  $keepalived_vrrp_scripts   = hiera_hash('keepalived::vrrp_scripts', {})

  $global_defs_hash = {
    'keepalived::global_defs'    => $keepalived_global_defs,
  }

  class { 'keepalived': }
  create_resources('class', $global_defs_hash)
  create_resources('keepalived::vrrp::instance', $keepalived_vrrp_instances)
  create_resources('keepalived::vrrp::script', $keepalived_vrrp_scripts)
}
