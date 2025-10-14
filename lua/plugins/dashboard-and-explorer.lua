local dbAnim = require("dashboardAnimation")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_dashboard",
  callback = function()
    dbAnim.shouldPlayAnimation = true
    dbAnim.asciiImg = dbAnim.frames[1]
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function()
    dbAnim.shouldPlayAnimation = false
  end,
})

return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.defer_fn(function()
        dbAnim.theAnimation(dbAnim.theAnimation)
      end, 100)
    end,

    ---@type snacks.Config
    opts = {
      image = { enabled = true },

      -- terminal = {
      --   win = {
      --     keys = {
      --       exit = { "<ESC>", "<cmd>q<cr>", desc = "Exit", expr = true, mode = { "t", "n" } },
      --       term_normal = {
      --         "<c-/>",
      --         function()
      --           vim.cmd("stopinsert")
      --           local timer = vim.loop.new_timer()
      --           if timer then
      --             timer:start(
      --               10,
      --               0,
      --               vim.schedule_wrap(function()
      --                 vim.api.nvim_feedkeys("/", "n", true)
      --               end)
      --             )
      --           end
      --         end,
      --         mode = { "t", "n" },
      --         expr = true,
      --         desc = "Double escape to normal mode",
      --       },
      --       hide_search_highlight = {
      --         "<c-.>",
      --         "<cmd>noh<cr>",
      --         desc = "Turn off highlighting until the next search",
      --         expr = true,
      --         mode = { "t", "n" },
      --       },
      --     },
      --   },
      -- },
      --
      -- picker = {
      --   sources = {
      --     explorer = {
      --       path = LazyVim.root(),
      --       auto_close = true,
      --       layout = {
      --         preset = "vscode",
      --         layout = { position = "right" },
      --       },
      --     },
      --   },
      -- },

      dashboard = {
        on_close = function()
          dbAnim.shouldPlayAnimation = false
        end,
        preset = {
          header = false,
          pick = nil,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "header",
            padding = 1,
            function()
              return { header = dbAnim.asciiImg }
            end,
          },
          { section = "keys",    gap = 1,        padding = 1 },
          { section = "startup", enabled = false },
        },
      },
    },
  },
}
