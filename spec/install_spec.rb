describe file("#{node[:consul][:src_dir]}/consul_#{node[:consul][:version]}_linux_amd64.zip") do
  it { should exist }
  it { should be_file }
end

describe file("#{node[:consul][:bin_dir]}/consul") do
  it { should exist }
  it { should be_file }
  it { should be_executable }
end

describe command("#{node[:consul][:bin_dir]}/consul --version") do
  its(:exit_status) { should eq 0 }
  its(:stderr)      { should be_empty }
  its(:stdout)      { should include "Consul v#{node[:consul][:version]}" }
end
