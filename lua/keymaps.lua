vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

function jump_to_diagnostic(direction)
  local diagnostics = vim.diagnostic.get(0) -- Get diagnostics for the current buffer
  local cur_pos = vim.api.nvim_win_get_cursor(0) -- Current cursor position

  -- Categorize diagnostics
  local errors, warnings, hints = {}, {}, {}

  for _, diag in ipairs(diagnostics) do
    if diag.severity == vim.diagnostic.severity.ERROR then
      table.insert(errors, diag)
    elseif diag.severity == vim.diagnostic.severity.WARN then
      table.insert(warnings, diag)
    elseif diag.severity == vim.diagnostic.severity.HINT then
      table.insert(hints, diag)
    end
  end

  -- Function to find the closest diagnostic in a given list
  local function find_closest(diagnostic_list)
    local closest = nil
    local min_distance = nil

    for _, diag in ipairs(diagnostic_list) do
      local distance = direction * (diag.lnum - cur_pos[1])
      if distance > 0 and (min_distance == nil or distance < min_distance) then
        closest = diag
        min_distance = distance
      end
    end

    if not closest and #diagnostic_list > 0 then
      if direction == 1 then
        closest = diagnostic_list[1] -- Wrap to the first diagnostic
      else
        closest = diagnostic_list[#diagnostic_list] -- Wrap to the last diagnostic
      end
    end

    return closest
  end

  -- Try to jump to the closest error, then warning, then hint
  local target = find_closest(errors) or find_closest(warnings) or find_closest(hints)

  if target then
    vim.api.nvim_win_set_cursor(0, { target.lnum + 1, target.col })
  else
    print "No more diagnostics of this type in the specified direction."
  end
end

-- Bindings to jump to the next/previous diagnostic
vim.api.nvim_set_keymap("n", "<leader>e", ":lua jump_to_diagnostic(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>E", ":lua jump_to_diagnostic(-1)<CR>", { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
