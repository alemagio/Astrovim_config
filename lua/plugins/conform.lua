return {
  "stevearc/conform.nvim",
  ---@class ConformOpts
  opts = {
    log_level = vim.log.levels.DEBUG,
    format_on_save = {
      -- I recommend these options. See :help conform.format for details.
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    formatters_by_ft = {
      quarto = { "quarto_prettier" },
      markdown = { "prettierd" },
    },
    formatters = {
      quarto_prettier = {
        command = "prettierd",
        args = {
          "--parser=markdown",
          "--stdin-from-filename",
          "$RELATIVE_FILEPATH",
        },
        -- cwd = require("conform.util").root_file { ".prettierrc" },
        stdin = true,
      },
    },
  },
}
