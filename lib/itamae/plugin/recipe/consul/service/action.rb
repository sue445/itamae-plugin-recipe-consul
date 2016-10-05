service "consul" do
  action node[:consul][:service_actions]
end
