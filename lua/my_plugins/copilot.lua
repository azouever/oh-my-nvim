return {
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			-- Mapping tab is already used by NvChad
			vim.g.copilot_no_tab_map = true
			-- vim.g.copilot_assume_mapped = true;
			-- vim.g.copilot_tab_fallback = "";
			-- The mapping is set to other key, see custom/lua/mappings
			-- or run <leader>ch to see copilot mapping section
			--vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},
}
