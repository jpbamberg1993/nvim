-- Jest adapter for neotest (LazyVim's test.core extra ships with no JS/TS adapter)
return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest" },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          -- Run jest from the nearest package.json so it picks up jest.config.cjs
          cwd = function(file)
            return file and vim.fs.root(file, "package.json") or vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
