-- plugins.coding
-- 职责：与编码相关的通用插件（补全、片段等），按需启用/关闭
return {
  -- auto-tag
  -- {
  -- 	"windwp/nvim-ts-autotag",
  -- 	config = function()
  -- 		require("nvim-ts-autotag").setup()
  -- 	end,
  -- },

  -- -- auto-pairs
  -- {
  -- 	"windwp/nvim-autopairs",
  -- 	config = function()
  -- 		require("nvim-autopairs").setup({
  -- 			enable_check_bracket_line = false,
  -- 			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  -- 		})
  -- 	end,
  -- },

  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "hrsh7th/cmp-buffer" },
  -- { "hrsh7th/cmp-path" },
  -- { "hrsh7th/cmp-cmdline" },

  -- { "onsails/lspkind.nvim" }, -- icons in autocomplete source
  -- 通用代码片段集合（多语言 snippets，供 LuaSnip 等使用）
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },

  -- 片段引擎 LuaSnip，配合补全/快捷插入代码片段
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("plugins.luasnip.config")
    end,
  },
  -- {
  -- 	"saadparwaiz1/cmp_luasnip",
  -- 	dependencies = { "L3MON4D3/LuaSnip" },
  -- 	lazy = true,
  -- },

  -- -- todo comments
  -- -- Preview
  -- -- TODO: todo
  -- -- FIX: fix
  -- -- WARNING: warning
  -- -- HACK: hack
  -- -- NOTE: note
  -- -- PERF: perf
  -- -- TEST: test
  -- --
  -- {
  -- 	"folke/todo-comments.nvim",
  -- 	dependencies = { "nvim-lua/plenary.nvim" },
  -- 	config = function()
  -- 		require("todo-comments").setup({
  -- 			keywords = {
  -- 				FIX = {
  -- 					icon = " ", -- icon used for the sign, and in search results
  -- 					color = "error", -- can be a hex color, or a named color (see below)
  -- 					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
  -- 					-- signs = false, -- configure signs for some keywords individually
  -- 				},
  -- 				TODO = { icon = " ", color = "todo" },
  -- 				HACK = { icon = " ", color = "warning" },
  -- 				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
  -- 				PERF = { icon = "󱢍", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
  -- 				NOTE = { icon = " ", color = "info", alt = { "INFO" } },
  -- 				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  -- 			},
  -- 			colors = {
  -- 				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
  -- 				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
  -- 				todo = { "DiagnosticOk", "#2563EB" },
  -- 				info = { "DiagnosticInfo", "#10B981" },
  -- 				default = { "Identifier", "#7C3AED" },
  -- 				test = { "Identifier", "#FF00FF" },
  -- 			},
  -- 		})
  -- 	end,
  -- },

  -- -- guess indent
  -- {
  -- 	"nmac427/guess-indent.nvim",
  -- 	config = function()
  -- 		require("guess-indent").setup({})
  -- 	end,
  -- },
}
