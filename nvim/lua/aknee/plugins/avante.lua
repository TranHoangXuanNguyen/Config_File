return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = "nvidia", 
    auto_suggestions_provider = "nvidia",
    vendors = {
      nvidia = {
        __inherited_from = "openai",
        api_key_name = "NVIDIA_API_KEY",
        endpoint = "https://integrate.api.nvidia.com/v1",
        model = "nvidia/llama-3.1-nemotron-70b-instruct", -- Model Nemotron rất mạnh của Nvidia
      },
    },
  },
  build = "make", -- Hỗ trợ cài đặt core bằng Rust, cần cài `make` và `cargo` (hoặc `rustc`) trong máy
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- Optional dependencies
    "nvim-tree/nvim-web-devicons", -- Hoặc mini.icons
    -- "zbirenbaum/copilot.lua", -- Nếu bạn định dùng Copilot làm provider

    {
      -- Render markdown đẹp hơn cho Avante
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
    {
      -- Hỗ trợ paste hình ảnh thẳng vào prompt
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
  },
}
