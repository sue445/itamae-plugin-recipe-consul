# Check required node values
node.validate! do
  {
    consul: {
      version: string,
    },
  }
end

# Set default node values
node.reverse_merge!(
  consul: {
    src_dir:    "/usr/local/src",
    bin_dir:    "/usr/local/bin",
    data_dir:   "/tmp/consul",
    gomaxprocs: 2,
  },
)
