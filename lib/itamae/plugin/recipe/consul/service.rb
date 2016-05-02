# ref. http://qiita.com/yunano/items/7ef5fa5670721de55627
directory "/etc/consul.d"

template "/etc/sysconfig/consul" do
  variables(
    gomaxprocs: node[:consul][:gomaxprocs],
  )
end

case node[:platform]
when "debian"
  # TODO:
when "redhat"
  if node[:platform_version].to_i >= 7
    include_recipe "./service_systemd"
  else
    # TODO:
  end
end

service "consul" do
  action [:enable, :start]
end
