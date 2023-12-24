return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>lf",
      function() require("conform").format { async = true } end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
    formatters = {
      biome = {
        args = { "check", "--apply", "--stdin-file-path", "$FILENAME" },
      },
    },
  },
  init = function()
    require("conform").formatters.biome.cwd = require("conform.util").root_file { "biome.json", "package.json" }
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
