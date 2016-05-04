# Setup init.d script or systemd unit
include_recipe "./definitions"

directory "/etc/consul.d"

case node[:platform]
when "debian"
  include_recipe "./service_debian"

when "redhat"
  include_recipe "./service_centos"
end
