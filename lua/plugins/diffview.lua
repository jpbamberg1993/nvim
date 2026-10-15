return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gn", "<cmd>DiffviewOpen develop...HEAD<cr>", desc = "Diff vs develop" },
      { "<leader>gp", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "Open" },
    },
  },
  -- free <leader>gp from Octo's PR list
  {
    "pwntester/octo.nvim",
    keys = { { "<leader>gp", false } },
  },
}
