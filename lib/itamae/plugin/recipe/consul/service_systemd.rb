# Use systemd
template "/etc/systemd/system/consul.service" do
  variables(
    bin_path: "#{node[:consul][:bin_dir]}/consul",
    data_dir: node[:consul][:data_dir],
  )

  notifies :run,     "execute[systemctl daemon-reload]"
  notifies :restart, "service[consul]"
end

execute "systemctl daemon-reload" do
  action :nothing
end
