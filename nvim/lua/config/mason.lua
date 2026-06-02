-- lua/config/mason.lua
require("mason").setup({
  -- Customize where Mason installs things
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  -- Automatically install LSPs and formatters for certain filetypes
  ensure_installed = {
    "lua_ls",
    "stylua",
    "pyright",
    "black",
    "isort",
    -- Add more servers/tools here as needed
  },
})
