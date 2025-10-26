return {
  "stevearc/conform.nvim",
  ---@class ConformOpts
  opts = {
    format_on_save = {
      -- I recommend these options. See :help conform.format for details.
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    formatters = {
      -- Prettier configuration in conform.nvim
      prettier = {
        options = {
          ext_parsers = {
            qmd = "markdown",
          },
        },
      },
    },
    formatters_by_ft = {
      -- ...
      quarto = { "prettierd", "prettier" },
      -- ...
    },
  },
}
