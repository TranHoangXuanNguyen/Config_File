-- lua/config/lint.lua
local lint = require("lint")

lint.linters_by_ft = {
  python = { "ruff" },
  lua = { "luacheck" },
  -- Add more languages as needed
}

-- Set up linting on events
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
