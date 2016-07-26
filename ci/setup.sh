#!/bin/bash -xe

wget https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.rpm
rpm -i vagrant_1.8.4_x86_64.rpm
vagrant plugin install vagrant-digitalocean

# NOTE: vagrant v1.8.4 depends on bundler v1.12.5
# https://github.com/mitchellh/vagrant/blob/v1.8.4/vagrant.gemspec#L23
gem uninstall bundler --all --force
gem install bundler -v 1.12.5 --no-document
