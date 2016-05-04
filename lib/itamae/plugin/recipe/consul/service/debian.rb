if node[:platform_version].to_i >= 8
  set_consul_systemd_unit "/etc/default/consul"

  service "consul" do
    action [:enable, :start]
  end
end
