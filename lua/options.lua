require "nvchad.options"

local o = vim.o
o.scrolloff = 15
o.smartindent = true
o.foldmethod = "expr"
o.foldlevelstart = 99
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldtext = "nvim_treesitter#foldtext()"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = "setlocal shiftwidth=4 tabstop=4 ",
})
