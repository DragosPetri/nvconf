return {
  require("nvim-tree").setup {
    filters = {
      dotfiles = true,
      git_ignored = false,
    },
    view = {
      side = "right",
    },
  },
}
