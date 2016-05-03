describe file("/etc/default/consul"), if: node[:platform] == "debian" do
  let(:environment_file) do
    <<-EOS
GOMAXPROCS=#{node[:consul][:gomaxprocs]}
OPTIONS="#{node[:consul][:options]}"
    EOS
  end

  it { should exist }
  it { should be_file }
  its(:content) { should eq environment_file }
end

describe file("/etc/systemd/system/consul.service"), if: node[:platform] == "debian" && node[:platform_version].to_i >= 8 do
  it { should exist }
  it { should be_file }
  its(:content) { should include "ExecStart=#{node[:consul][:bin_dir]}/consul" }
  its(:content) { should include "-data-dir=#{node[:consul][:data_dir]}" }
end
