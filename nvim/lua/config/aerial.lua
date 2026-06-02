-- lua/config/aerial.lua
require('aerial').setup({
  -- optionally use on_attach to set keymaps when lsp attaches
  on_attach = function(bufnr)
    -- Jump forwards/backwards
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end
})
-- Toggle with a keymap
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
