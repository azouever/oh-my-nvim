return {
	-- 	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "nvim-lua/plenary.nvim" },
	-- {
	--   "tpope/vim-fugitive",
	--   cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
	--   dependencies = {
	--     "tpope/vim-rhubarb",
	--   },
	--   -- stylua: ignore
	--   keys = {
	--     { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
	--   },
	-- },
	-- {
	-- 	"folke/persistence.nvim",
	-- 	event = "BufReadPre",
	-- 	opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{ "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
	-- 		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
	-- 		{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
	-- 	},
	-- },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
