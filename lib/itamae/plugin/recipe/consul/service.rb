# Setup init.d script or systemd unit
include_recipe "consul::service::definitions"

directory "/etc/consul.d"

case node[:platform]
when "debian"
  include_recipe "consul::service::debian"

when "redhat"
  include_recipe "consul::service::centos"
end
