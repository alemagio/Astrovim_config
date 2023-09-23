return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      ']t',
      function() require("todo-comments").jump_next() end,
      desc = "Next todo comment"
    },
    {
      '[t',
      function() require("todo-comments").jump_prev() end,
      desc = "Prev todo comment"
    },
    {
      '<leader>xt',
      "<cmd> TodoTrouble <CR>",
      desc = "Todo in Trouble"
    },
  }
}
