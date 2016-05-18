# Download and install consul executable file
package "unzip"

zip_name = "consul_#{node[:consul][:version]}_#{node[:consul][:platform]}.zip"

http_request "#{node[:consul][:src_dir]}/#{zip_name}" do
  url "https://releases.hashicorp.com/consul/#{node[:consul][:version]}/#{zip_name}"
end

execute "unzip #{node[:consul][:src_dir]}/#{zip_name} -d #{node[:consul][:bin_dir]}" do
  not_if "#{node[:consul][:bin_dir]}/consul --version | grep #{node[:consul][:version]}"
end
