return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        auto_install = true,
        indent = { enable = true },
        fold = { enable = true },
        highlight = { enable = true },
        ensure_installed = {
          "cpp",
          "gitignore",
          "bash",
          "c",
          "json",
          "dockerfile",
          "diff",
          "html",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "query",
          "vim",
          "vimdoc",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
