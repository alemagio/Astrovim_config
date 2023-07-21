return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "f-person/git-blame.nvim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  {
    'rcarriga/neotest',
    dependencies = {
      'marilari88/neotest-vitest'
    },
    keys = {
      {
        "<leader>tNF",
        "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
        desc =
        "Debug File"
      },
      {
        "<leader>tNL",
        "<cmd>lua require('neotest').run.run_last({strategy = 'dap'})<cr>",
        desc =
        "Debug Last"
      },
      { "<leader>tNa", "<cmd>lua require('neotest').run.attach()<cr>",                desc = "Attach" },
      { "<leader>tNf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
      { "<leader>tNl", "<cmd>lua require('neotest').run.run_last()<cr>",              desc = "Last" },
      {
        "<leader>tNn",
        "<cmd>lua require('neotest').run.run()<cr>",
        desc =
        "Nearest"
      },
      {
        "<leader>tNN",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        desc =
        "Debug Nearest"
      },
      { "<leader>tNo", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
      { "<leader>tNs", "<cmd>lua require('neotest').run.stop()<cr>",                    desc = "Stop" },
      {
        "<leader>tNS",
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        desc =
        "Summary"
      },
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-vitest')
        }
      })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "princejoogie/dir-telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
}
