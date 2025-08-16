-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      flavour = "macchiato",
      integrations = {
        rainbow_delimiters = true,
      },
    },
  },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.utility.lua-json5" },
  { import = "astrocommunity.diagnostics.trouble-nvim", opts = { position = "right", width = 100 } },
  { import = "astrocommunity.recipes.ai" },
}
