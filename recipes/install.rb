case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"
end

directory "/tmp/itamae_tmp"

include_recipe "consul"
