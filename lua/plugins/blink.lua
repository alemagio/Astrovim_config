return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
    -- ... Other dependencies
  },
  opts = {
    completion = {
      menu = {
        draw = {
          columns = { { "label", "source_name", gap = 1 }, { "kind_icon", "kind" } },
        },
      },
    },
    sources = {
      -- Add 'avante' to the list
      default = { "lsp", "path", "buffer", "avante" },
      providers = {
        -- codeium = { name = "Codeium", module = "codeium.blink", async = true },
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          source_name = "Avante",
          opts = {
            kind_icons = {
              Avante = "󰖷",
            },
          },
        },
      },
    },
  },
}
