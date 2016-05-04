# Setup init.d script or systemd unit
include_recipe "./definitions"

directory "/etc/consul.d"

case node[:platform]
when "debian"
  include_recipe "./debian"

when "redhat"
  include_recipe "./centos"
end
