-- lua/config/overseer.lua
require('overseer').setup({
  -- Configuration for overseer goes here
  -- For example, to add task templates:
  templates = {"builtin", "user.my_compiler"},
})
