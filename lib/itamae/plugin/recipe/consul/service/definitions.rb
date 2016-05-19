environment_content =
  <<-EOS
GOMAXPROCS=#{node[:consul][:gomaxprocs]}
OPTIONS="#{node[:consul][:options]}"
  EOS

# Set systemd unit file
define :set_consul_systemd_unit do
  environment_file = params[:name]

  file environment_file do
    mode    "644"
    content environment_content
    notifies :restart, "service[consul]"
  end

  template "/etc/systemd/system/consul.service" do
    mode "644"
    variables(
      environment_file: environment_file,
      bin_path:         "#{node[:consul][:bin_dir]}/consul",
      data_dir:         node[:consul][:data_dir],
    )

    notifies :restart, "service[consul]"
  end
end

# Set init.d script
define :set_consul_initd_script do
  environment_file = params[:name]

  file environment_file do
    mode    "644"
    content environment_content
    notifies :restart, "service[consul]"
  end

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
