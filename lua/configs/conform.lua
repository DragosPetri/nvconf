local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format-18" },
  },

  format_on_save = {
  -- These options will be passed to conform.format()
  timeout_ms = 500,
  lsp_fallback = true,
  },
}

return options
