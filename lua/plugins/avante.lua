local prefix = "<Leader>a"
return {
  "yetone/avante.nvim",
  build = vim.fn.has "win32" == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "User AstroFile", -- load on file open because Avante manages it's own bindings
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteEdit",
    "AvanteRefresh",
    "AvanteSwitchProvider",
    "AvanteShowRepoMap",
    "AvanteModels",
    "AvanteChat",
    "AvanteToggle",
    "AvanteClear",
    "AvanteFocus",
    "AvanteStop",
  },
  dependencies = {
    { "stevearc/dressing.nvim", optional = true },
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "AstroNvim/astrocore", opts = function(_, opts) opts.mappings.n[prefix] = { desc = " Avante" } end },
  },
  opts = {
    provider = "openrouter",
    providers = {
      ["openrouter"] = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "anthropic/claude-sonnet-4.5",
        api_key_name = "AVANTE_OPEN_ROUTER_API_KEY",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      -- moonshot = {
      --   endpoint = "https://api.moonshot.ai/v1",
      --   model = "kimi-k2-0711-preview",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 32768,
      --   },
      -- },
    },
    mappings = {
      ask = prefix .. "a",
      edit = prefix .. "e",
      refresh = prefix .. "r",
      new_ask = prefix .. "n",
      focus = prefix .. "f",
      select_model = prefix .. "?",
      stop = prefix .. "S",
      select_history = prefix .. "h",
      toggle = {
        default = prefix .. "t",
        debug = prefix .. "d",
        hint = prefix .. "H",
        suggestion = prefix .. "s",
        repomap = prefix .. "R",
      },
      diff = {
        next = "]c",
        prev = "[c",
      },
      files = {
        add_current = prefix .. ".",
        add_all_buffers = prefix .. "B",
      },
    },
  },
  specs = { -- configure optional plugins
    { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
    {
      -- make sure `Avante` is added as a filetype
      "MeanderingProgrammer/render-markdown.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.file_types then opts.file_types = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
      end,
    },
    {
      -- make sure `Avante` is added as a filetype
      "OXY2DEV/markview.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.preview then opts.preview = {} end
        if not opts.preview.filetypes then opts.preview.filetypes = { "markdown", "quarto", "rmd" } end
        opts.preview.filetypes = require("astrocore").list_insert_unique(opts.preview.filetypes, { "Avante" })
      end,
    },
    {
      "folke/snacks.nvim",
      optional = true,
      specs = {
        {
          "yetone/avante.nvim",
          opts = {
            selector = {
              provider = "snacks",
            },
          },
        },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        filesystem = {
          commands = {
            avante_add_files = function(state)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local relative_path = require("avante.utils").relative_path(filepath)

              local sidebar = require("avante").get()

              local open = sidebar:is_open()
              -- ensure avante sidebar is open
              if not open then
                require("avante.api").ask()
                sidebar = require("avante").get()
              end

              sidebar.file_selector:add_selected_file(relative_path)

              -- remove neo tree buffer
              if not open then sidebar.file_selector:remove_selected_file "neo-tree filesystem [1]" end
            end,
          },
          window = {
            mappings = {
              ["oa"] = "avante_add_files",
            },
          },
        },
      },
    },
  },
}
