if node[:platform_version].to_i >= 8
  set_consul_systemd_unit "/etc/default/consul"

  include_recipe "consul::service::action"
end
