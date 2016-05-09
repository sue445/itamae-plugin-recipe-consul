describe file("/etc/sysconfig/consul"), if: node[:platform] == "redhat" do
  let(:environment_file) do
    <<-EOS
GOMAXPROCS=#{node[:consul][:gomaxprocs]}
OPTIONS="#{node[:consul][:options]}"
    EOS
  end

  it { should exist }
  it { should be_file }
  it { should be_mode "644" }
  its(:content) { should eq environment_file }
end

describe file("/etc/systemd/system/consul.service"), if: node[:platform] == "redhat" && node[:platform_version].to_i >= 7 do
  it { should exist }
  it { should be_file }
  it { should be_mode "644" }
  its(:content) { should include "ExecStart=#{node[:consul][:bin_dir]}/consul" }
  its(:content) { should include "-data-dir=#{node[:consul][:data_dir]}" }
end

describe file("/etc/init.d/consul"), if: node[:platform] == "redhat" && node[:platform_version].to_i < 7 do
  it { should exist }
  it { should be_file }
  it { should be_mode "755" }
  its(:content) { should include %Q(exec="#{node[:consul][:bin_dir]}/consul") }
  its(:content) { should include %Q(datadir="#{node[:consul][:data_dir]}") }
end
