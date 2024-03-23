local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	opts = {
		filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	},
	config = function(_, opts)
		vim.opt.foldlevelstart = 99
		require("ufo").setup(opts)
	end,
}

return M
