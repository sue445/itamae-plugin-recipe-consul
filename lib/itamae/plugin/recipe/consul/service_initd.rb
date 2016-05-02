# Use init.d
template "/etc/init.d/consul" do
  mode "755"
  variables(
    bin_path: "#{node[:consul][:bin_dir]}/consul",
    data_dir: node[:consul][:data_dir],
  )

  notifies :restart, "service[consul]"
end
