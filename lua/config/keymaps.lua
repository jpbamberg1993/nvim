-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "normal mode in terminal" })
vim.keymap.set("n", "<leader>gj", function()
  require("gitsigns").blame()
end, { desc = "Git blame file" })

-- Allow's copying of line reference
vim.keymap.set("n", "<leader>yl", function()
  local ref = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", ref)
  vim.notify("Copied " .. ref)
end, { desc = "Copy file:line reference" })
