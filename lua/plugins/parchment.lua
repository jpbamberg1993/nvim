return {
  {
    "saeeedhany/parchment.nvim",
    commit = "ee521c7b24d6", -- audited 2026-09-28
    priority = 1000,
    config = function()
      require("parchment").setup({
        terminal_colors = true, -- set vim.g.terminal_color_*
        italic_comments = true,
        italic_strings = false,
        bold_functions = false,
        transparent_bg = true,
        styles = {
          SnacksDashboardHeader = { fg = "#b8944d" },
        },
      })
      for _, g in ipairs({
        "NormalFloat",
        "FloatBorder",
        "NormalNC",
        "SnacksPickerListNormal",
        "SnacksPickerInputNormal",
        "SnacksNormal",
        "SnacksNormalNC",
        "SnacksPickerNormal",
        "SnacksPickerBorder",
      }) do
        local hl = vim.api.nvim_get_hl(0, { name = g, link = false }) --[[@as vim.api.keyset.highlight]]
        hl.bg = nil
        vim.api.nvim_set_hl(0, g, hl)
      end
    end,
  },
}
