return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
    require("nvim-treesitter.configs").setup {
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = "@parameter.inner",
            ["<leader>nm"] = "@function.outer",
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner",
            ["<leader>pm"] = "@function.outer",
          },
        },
      },
    }
  end,
}
