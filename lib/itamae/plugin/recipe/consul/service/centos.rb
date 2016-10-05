if node[:platform_version].to_i >= 7
  set_consul_systemd_unit "/etc/sysconfig/consul"
else
  set_consul_initd_script "/etc/sysconfig/consul"
end

include_recipe "consul::service::action"
