# ref. http://qiita.com/yunano/items/7ef5fa5670721de55627
directory "/etc/consul.d"

# Set systemd script
define :consul_system_script do
  environment_file = params[:name]

  template "/etc/systemd/system/consul.service" do
    variables(
      environment_file: environment_file,
      bin_path:         "#{node[:consul][:bin_dir]}/consul",
      data_dir:         node[:consul][:data_dir],
    )

    notifies :run,     "execute[systemctl daemon-reload]"
    notifies :restart, "service[consul]"
  end

  execute "systemctl daemon-reload" do
    action :nothing
  end
end

# Set init.d script
define :consul_initd_script do
  environment_file = params[:name]

  template "/etc/init.d/consul" do
    mode "755"
    variables(
      environment_file: environment_file,
      bin_path:         "#{node[:consul][:bin_dir]}/consul",
      data_dir:         node[:consul][:data_dir],
    )

    notifies :restart, "service[consul]"
  end
end

case node[:platform]
when "debian"
  # TODO:
when "redhat"
  environment_file = "/etc/sysconfig/consul"

  template environment_file do
    variables(
      gomaxprocs: node[:consul][:gomaxprocs],
      options:    node[:consul][:options],
    )
  end

  if node[:platform_version].to_i >= 7
    consul_system_script environment_file
  else
    consul_initd_script environment_file
  end

  service "consul" do
    action [:enable, :start]
  end
end
