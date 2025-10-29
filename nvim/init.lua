-----------------------------------------------------------
-- 🌸 Neovim by Xuân Nguyên — IDE như VSCode ✨ (Pro+ Edition)
-----------------------------------------------------------

-- === Bootstrap Lazy.nvim ===
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- === Basic Settings ===
-----------------------------------------------------------
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400

-----------------------------------------------------------
-- === Plugins ===
-----------------------------------------------------------
require("lazy").setup({

  -----------------------------------------------------------
  -- 🌈 Giao diện & Hiệu ứng
  -----------------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "stevearc/dressing.nvim" },
  { "nvim-lualine/lualine.nvim", config = function()
      require("lualine").setup({ options = { theme = "catppuccin" } })
    end
  },
  { "akinsho/bufferline.nvim", config = function()
      require("bufferline").setup({ options = { separator_style = "slant" } })
    end
  },
  { "karb94/neoscroll.nvim", config = true },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },
  { "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }, config = true },

  -----------------------------------------------------------
  -- 🏠 Dashboard (Màn hình mở đầu)
  -----------------------------------------------------------
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      local db = require("dashboard")
      db.setup({
        theme = "hyper",
        config = {
          week_header = { enable = true },
          shortcut = {
            { desc = "🗂 Files", group = "@property", action = "Telescope find_files", key = "f" },
            { desc = "🔍 Grep", group = "@string", action = "Telescope live_grep", key = "g" },
            { desc = "📦 Plugins", group = "@constant", action = "Lazy", key = "l" },
            { desc = "🚀 Quit", group = "@keyword", action = "qa", key = "q" },
          },
        },
      })
    end,
  },

-----------------------------------------------------------
-- 📂 File Explorer (Neo-tree)
-----------------------------------------------------------
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- ✅ thay thế nvim-material-icon
  },
  config = function()
    require("neo-tree").setup({
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = { hide_dotfiles = false, hide_gitignored = false },
      },
      window = { width = 34 },
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
      },
    })

    -- Keymap mở/tắt file explorer
    vim.keymap.set("n", "<leader>e", ":Neotree toggle left<CR>", { desc = "Toggle File Explorer" })

    -- Tự mở Neo-tree khi mở Neovim mà không truyền file
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        if vim.fn.isdirectory(data.file) == 1 then
          vim.cmd("Neotree show")
        end
      end,
    })
  end,
},

  -----------------------------------------------------------
  -- 🖼️ Image Preview (yêu cầu Kitty/WezTerm)
  -----------------------------------------------------------
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
      vim.keymap.set("n", "<leader>ip", ":ImagePreview<CR>", { desc = "Preview Image" })
    end,
  },

  -----------------------------------------------------------
  -- 🔭 Telescope (Command Palette & Search)
  -----------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 5,
        },
      })
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")

      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search in Files" })
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Search Buffers" })
      vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
      vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Command Palette" })
    end,
  },

  -----------------------------------------------------------
  -- 🧠 Treesitter (Highlight & Structure)
  -----------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "html", "css", "python", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -----------------------------------------------------------
  -- 🧩 LSP + Completion
  -----------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls", "pyright" } })

      local lspconfig = require("lspconfig")
      local cmp = require("cmp")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({ { name = "nvim_lsp" } }),
      })

      for _, server in ipairs({ "lua_ls", "ts_ls", "pyright" }) do
        lspconfig[server].setup({ capabilities = capabilities })
      end
    end,
  },

  -----------------------------------------------------------
  -- 💡 Tiện ích khác
  -----------------------------------------------------------
  { "lewis6991/gitsigns.nvim", config = true },
  { "folke/which-key.nvim", config = function() require("which-key").setup() end },
  { "windwp/nvim-autopairs", config = true },
  { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim", config = true },
})

-----------------------------------------------------------
-- === Keymaps ===
-----------------------------------------------------------
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>rn", ":set relativenumber!<CR>", { desc = "Toggle relative number" })
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "Open LazyGit" })
