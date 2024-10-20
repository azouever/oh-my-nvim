return {
	-- winbar
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
				theme = vim.g.hardhacker_barbecue_theme,
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",

				-- include this if you have set `show_modified` to `true`
				"BufModifiedSet",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("plugins/lualine/config")()
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins/neo-tree/config")()
		end,
	},

	-- Outline
	-- {
	-- 	"stevearc/aerial.nvim",
	-- 	opts = {},
	-- 	-- Optional dependencies
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("aerial").setup({
	-- 			lazy_load = false,
	-- 			open_automatic = require("custom_opts").auto_open_outline,
	-- 		})
	-- 	end,
	-- },

	-- Tab line
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/bufferline/config")()
		end,
	},

	-- cmd line
	{
		"folke/noice.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins/noice/config")()
		end,
	},
	{
		"gelguy/wilder.nvim",
		enabled = true,
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
				next_key = 0,
				previous_key = 0,
				reject_key = 0,
				accept_key = 0,
			})
			vim.api.nvim_command("silent! UpdateRemotePlugins") -- 需要载入一次py依赖 不然模糊过滤等失效
			-- 设置source
			wilder.set_option("pipeline", {
				wilder.branch(
					-- 当默认无输入时 展示15条历史记录
					{
						wilder.check(function(_, x)
							return vim.fn.empty(x)
						end),
						wilder.history(15),
					},
					-- 当输入时 展示所有匹配项(模糊匹配)
					wilder.cmdline_pipeline({
						fuzzy = 1,
						fuzzy_filter = wilder.vim_fuzzy_filter(),
					}),
					-- pipeline for search
					wilder.search_pipeline()
				),
			})
			-- 设置样式
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					-- 设置特定高亮
					highlights = {
						accent = "WilderAccent",
						selected_accent = "WilderSelectedAccent",
					},
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() }, -- 左侧加入icon
					right = { " ", wilder.popupmenu_scrollbar() }, -- 右侧加入滚动条
					border = "rounded",
					max_height = 17, -- 最大高度限制 因为要计算上下 所以17支持最多15个选项
				}))
			)
			-- 设置高亮
			vim.api.nvim_set_hl(0, "WilderAccent", { fg = "#5f87ff" })
			vim.api.nvim_set_hl(0, "WilderSelectedAccent", { fg = "#5f87ff", bg = "#4e4e4e" })
			-- 设置快捷键
			vim.api.nvim_set_keymap(
				"c",
				"<tab>",
				[[wilder#in_context() ? wilder#next() : '<tab>']],
				{ noremap = true, expr = true }
			)
			vim.api.nvim_set_keymap(
				"c",
				"<Down>",
				[[wilder#in_context() ? wilder#next() : '<down>']],
				{ noremap = true, expr = true }
			)
			vim.api.nvim_set_keymap(
				"c",
				"<up>",
				[[wilder#in_context() ? wilder#previous() : '<up>']],
				{ noremap = true, expr = true }
			)
			vim.api.nvim_set_keymap("c", "0", "0", {}) -- 不清楚原因导致0无法使用 强制覆盖
		end,
	},
	-- Improve the ui
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
