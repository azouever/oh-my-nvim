return {
	-- 其他插件...
	{
		"mhartington/formatter.nvim",
		enabled = false,
		config = function()
			require("formatter").setup({
				filetype = {
					--   lua = {
					--     function()
					--       return {
					--         exe = "lua-format",
					--         args = { "--indent-width=2" },
					--         stdin = true,
					--       }
					--     end,
					--   },
					--   python = {
					--     function()
					--       return {
					--         exe = "black",
					--         args = { "-" },
					--         stdin = true,
					--       }
					--     end,
					--   },
					-- 其他文件类型的配置...
					-- toml = {
					--   function()
					--     return {
					--       exe = "taplo",
					--       args = { "format", "-" },
					--       stdin = true,
					--     }
					--   end,
					-- },
				},
			})
		end,
	},
}
