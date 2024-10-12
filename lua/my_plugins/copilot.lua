return {
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			-- Mapping tab is already used by NvChad
			-- vim.g.copilot_no_tab_map = true
			-- vim.g.copilot_assume_mapped = true;
			-- vim.g.copilot_tab_fallback = "";
			-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},

  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   lazy = true,
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  --   opts = {
  --     debug = false,
  --     window = {
  --       width = 0.25,
  --     },
  --   },
  --   keys = {
  --     {
  --       "<Leader>ch",
  --       ":'<,'>CopilotChat<CR>",
  --       mode = { "v" },
  --       desc = "Copilot Chat Selection",
  --     },
  --     {
  --       "<Leader>ch",
  --       ":CopilotChatToggle<CR>",
  --       mode = { "n" },
  --       desc = "Toggle Copilot Chat",
  --     },
  --   },
  -- },
}
