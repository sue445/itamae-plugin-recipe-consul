node.validate! do
  {
    consul: {
      version: string,
    },
  }
end

node.reverse_merge!(
  consul: {
    src_dir:    "/usr/local/src",
    bin_dir:    "/usr/local/bin",
    data_dir:   "/tmp/consul",
    gomaxprocs: 2,
  },
)

include_recipe "./download"
include_recipe "./service"
