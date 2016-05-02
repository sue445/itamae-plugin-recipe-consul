node.validate! do
  {
    consul: {
      version: string,
    },
  }
end

node.reverse_merge!(
  consul: {
    src_dir: "/usr/local/src",
    bin_dir: "/usr/local/bin",
  },
)

include_recipe "./download"
