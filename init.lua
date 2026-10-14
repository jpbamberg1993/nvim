-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("cyberdream").setup({
  transparent = true,
  highlights = {
    Visual = { bg = "#8400D1" },
  },
})
vim.opt.swapfile = false
