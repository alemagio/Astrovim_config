return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>S",
      function() require("spectre").toggle() end,
      desc = "Toggle Spectre",
    },
    {
      "<leader>sw",
      mode = { "n" },
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Search current word",
    },
    {
      "<leader>sw",
      mode = { "v" },
      function() require("spectre").open_visual() end,
      desc = "Search current word",
    },
    {
      "<leader>sp",
      mode = { "n" },
      function() require("spectre").open_file_search { select_word = true } end,
      desc = "Search on current file",
    },
  },
}
