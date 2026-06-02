local utils = require("utils")

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("config.mason")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300 -- Chờ 0.3 giây là hiện menu (quan trọng!)
    end,
    opts = {
    }
  },
  { "machakann/vim-swap",       event = "VeryLazy" },
  {
    "smoka7/hop.nvim",
    keys = { "f" },
    config = function()
      require("config.nvim_hop")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    branch = "main",
    keys = { "*", "#", "n", "N" },
    config = function()
      require("config.hlslens")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("config.fzf-lua")
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    main = "render-markdown",
    opts = {},
    ft = { "markdown" },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {},
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      require("config.nvim_ufo")
    end,
  },
  { "itchyny/vim-highlighturl", event = "BufReadPost" },
  { "nvim-lua/plenary.nvim",    lazy = true },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    enabled = function()
      return vim.g.is_win or vim.g.is_mac
    end,
    config = function()
      require("config.gx")
    end,
    submodules = false,
  },

  { "windwp/nvim-autopairs", event = "InsertEnter",                           config = true },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("config.comment")
    end,
    keys = { { "gc", mode = "n" }, { "gc", mode = "v" } },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("config.nvim-surround")
    end,
  },
  { "gbprod/yanky.nvim",     config = function() require("config.yanky") end, cmd = "YankyRingHistory" },
  { "tpope/vim-eunuch",      cmd = { "Rename", "Delete" } },
  { "tpope/vim-repeat",      event = "VeryLazy" },
  {
    "nvim-zh/better-escape.vim",
    init = function()
      vim.cmd([[ let g:better_escape_interval = 200 ]])
    end,
    event = { "InsertEnter" },
  },
  {
    "lyokha/vim-xkbswitch",
    init = function()
      vim.cmd([[ let g:XkbSwitchEnabled = 1 ]])
    end,
    enabled = function()
      return vim.g.is_mac and utils.executable("xkbswitch")
    end,
    event = { "InsertEnter" },
  },
  { "Neur1n/neuims",                    enabled = function() return vim.g.is_win end, event = { "InsertEnter" } },
  { "kevinhwang91/nvim-bqf",            ft = "qf",                                    config = function() require(
    "config.bqf") end },
  { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } },
  { "godlygeek/tabular",                ft = { "markdown" } },
  {
    "chrisbra/unicode.vim",
    init = function()
      vim.cmd([[ nmap ga <Plug>(UnicodeGA) ]])
    end,
    event = "VeryLazy",
  },
  {
    "lervag/vimtex",
    init = function()
      vim.cmd(dofile(vim.fs.joinpath(vim.fn.stdpath("config"), "viml_conf/vimtex.vim")))
    end,
    enabled = function()
      return utils.executable("latex")
    end,
    ft = { "tex" },
  },
  {
    "tmux-plugins/vim-tmux",
    enabled = function()
      return utils.executable("tmux")
    end,
    ft = { "tmux" },
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_timeout = 100
      vim.g.matchup_matchparen_insert_timeout = 30
      vim.g.matchup_override_vimtex = 1
      vim.g.matchup_delim_noskips = 0
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    event = "BufRead",
  },
  { "tpope/vim-scriptease", cmd = { "Scriptnames", "Messages", "Verbose" } },
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle" },
    config = function()
      require("config.overseer")
    end,
  },
  { "cespare/vim-toml",     ft = { "toml" },                               branch = "main" },
  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
  },
  { "tpope/vim-obsession", cmd = "Obsession" },
  {
    "ojroques/vim-oscyank",
    enabled = function()
      return vim.g.is_linux
    end,
    cmd = { "OSCYank", "OSCYankReg" },
  },
  {
    "jdhao/whitespace.nvim",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
    },
    opts = {
      debug = true,
    },
    cmd = { "CopilotChat" },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {}
    end,
  },
  {
    "smjonas/live-command.nvim",
    event = "VeryLazy",
    config = function()
      require("config.live-command")
    end,
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require("config.conform")
    end,
  },
}

