describe file("/etc/consul.d") do
  it { should exist }
  it { should be_directory }
end

describe service("consul") do
  it { should be_enabled }
  it { should be_running }
end
