# Itamae::Plugin::Recipe::Consul

Itamae plugin to install [Consul](https://www.consul.io/) with init scripts

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-consul.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-consul)
[![test](https://github.com/sue445/itamae-plugin-recipe-consul/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/itamae-plugin-recipe-consul/actions/workflows/test.yml)

## Supported
* Debian 10+ (systemd)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-consul'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-consul

## Usage

### Recipe

Install Consul executable file and init scritps (systemd or init.d)

```ruby
# recipe.rb
include_recipe "consul"
```

Or `include_recipe` just what you need manually:

```ruby
include_recipe "consul::setup"
include_recipe "consul::install"
include_recipe "consul::service"
```

### Node

```yml
# node.yml
consul:
  # install consul version (required)
  version: "0.6.4"

  # download zip platform (default: "linux_amd64")
  platform: "linux_amd64"

  # path to downloaded zip file (default: "/usr/local/src")
  src_dir: "/usr/local/src"

  # path to consul executable file (default: "/usr/local/src")
  bin_dir: "/usr/local/bin"

  # consul agent -data-dir option (default: "/tmp/consul")
  data_dir: "/tmp/consul"

  # consul agent other options (default: none)
  options: "-server -bootstrap-expect 1"

  gomaxprocs: 2

  # consul service actions when after install (default: enable, start)
  service_actions:
    - enable
    - start
    # - disable
    # - stop
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing
requirements [Docker](https://www.docker.com/)

e.g) test on CentOS 7.0

```sh
docker run --privileged -d --name container-with-service centos:7 /sbin/init
bundle exec itamae docker --node-yaml=recipes/node.yml recipes/install.rb --container=container-with-service --tag itamae-plugin:latest
DOCKER_CONTAINER=container-with-service bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/itamae-plugin-recipe-consul.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Special thanks
systemd unit file and init.d script

http://qiita.com/yunano/items/7ef5fa5670721de55627
