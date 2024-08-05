require "nvchad.options"

local o = vim.o
o.scrolloff = 15
o.smartindent = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = "setlocal shiftwidth=4 tabstop=4 ",
})
