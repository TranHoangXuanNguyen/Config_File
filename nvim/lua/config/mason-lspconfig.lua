-- lua/config/mason-lspconfig.lua
require("mason-lspconfig").setup({
  -- A list of servers to automatically install if they're not already installed.
  -- This is different from the `ensure_installed` in mason.lua, as this specifically
  -- refers to LSP servers.
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    -- Add more LSP servers here as needed
  },

  -- This function runs every time a new LSP server is installed by Mason-LSPconfig.
  -- It's a good place to set up keymaps and autocommands.
  handlers = {
    -- Default handler for any LSP server not explicitly listed below.
    -- It will automatically call `lspconfig.SERVER_NAME.setup({})`.
    function(server_name)
      require("lspconfig")[server_name].setup({
        -- You can add general LSP settings here that apply to all servers
        -- For example, adding capabilities from nvim-cmp
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,

    -- You can override the default handler for specific servers if needed.
    -- For example:
    -- ["pyright"] = function()
    --   require("lspconfig").pyright.setup({
    --     settings = {
    --       python = {
    --         analysis = {
    --           typeCheckingMode = "basic",
    --         },
    --       },
    --     },
    --   })
    -- end,
  },
})
