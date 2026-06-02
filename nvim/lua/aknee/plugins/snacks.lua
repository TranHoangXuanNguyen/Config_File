return {
	-- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		-- NOTE: Options
		opts = {
			styles = {
				notification = {
					wo = { wrap = true }, -- Thông báo không bị cắt chữ
				},
				input = {
					relative = "editor",
					position = "center",
					border = "rounded", -- Bo góc cho sang trọng
					keys = {
						n_esc = { "<C-c>", "cancel", mode = "n" },
						i_esc = { "<C-c>", "stopinsert", mode = "i" },
					},
				},
			},
			-- Snacks Modules
			indent = {
				enabled = true,
				animate = {
					enabled = vim.fn.has("nvim-0.10") == 1,
					style = "out",
					easing = "linear",
					duration = {
						step = 20,
						total = 1500,
					},
				},
			},
			terminal = {
				win = {
					position = "float",
					border = "rounded",
				},
			},
			input = {
				enabled = true,
			},
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},
			-- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
			picker = {
				enabled = true,
				matchers = {
					frecency = true,
					cwd_bonus = false,
				},
				exclude = {
					".git",
					"node_modules",
					"dist",
					"build",
				},
				formatters = {
					file = {
						filename_first = true,
						filename_only = false,
						icon_width = 2,
					},
				},
				layout = {
					preset = "telescope",
					cycle = false,
				},
				layouts = {
					telescope = {
						reverse = true,
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.8,
							height = 0.9,
							border = "none",
							{
								box = "vertical",
								{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
								{
									win = "input",
									height = 1,
									border = "double",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.50,
								border = "rounded",
								title_pos = "center",
							},
						},
					},
				},
			},
			image = {
				enabled = false, -- Bật để hỗ trợ xem ảnh trong markdown
				doc = {
					max_width = 50,
					max_height = 30,
				},
			},
			dashboard = {
				enabled = true,
				preset = {
					header = [[
██╗  ██╗██╗    ███╗   ██╗ ██████╗ ██╗   ██╗██╗   ██╗███████╗███╗   ██╗
██║  ██║██║    ████╗  ██║██╔════╝ ██║   ██║╚██╗ ██╔╝██╔════╝████╗  ██║
███████║██║    ██╔██╗ ██║██║  ███╗██║   ██║ ╚████╔╝ █████╗  ██╔██╗ ██║
██╔══██║██║    ██║╚██╗██║██║   ██║██║   ██║  ╚██╔╝  ██╔══╝  ██║╚██╗██║
██║  ██║██║    ██║ ╚████║╚██████╔╝╚██████╔╝   ██║   ███████╗██║ ╚████║
╚═╝  ╚═╝╚═╝    ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═══╝
]],
				},
			},
		},
		-- NOTE: Keymaps
		keys = {
			{
				"<leader>ft",
				function()
					require("snacks").terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fw",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep Word",
			},
			{
				"<leader>h",
				function()
					require("snacks").dashboard()
				end,
				desc = "Go to dashboard",
			},
			{
				"<leader>rN",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete Buffer",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		optional = true,
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Todo Comments",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				view = "cmdline_popup", -- Đưa thanh lệnh ra giữa màn hình
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
				},
			},
		},
	},
}

