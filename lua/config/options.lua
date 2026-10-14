-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = function(_, opts)
--       local sk = LazyVim.opts("sidekick.nvim") ---@type sidekick.Config|{}
--       if vim.tbl_get(sk, "nes", "enabled") ~= false then
--         opts.servers = opts.servers or {}
--         opts.servers.copilot = opts.servers.copilot or {}
--       end
--     end,
--   },
-- }

vim.opt.tabstop = 4 -- tab char displays as 4 cols
vim.opt.shiftwidth = 4 -- >>, <<, autoindent width
vim.opt.softtabstop = 4 -- <Tab>/<BS> in insert move 4 cols
vim.opt.expandtab = true -- insert spaces (set false for real tab chars)
