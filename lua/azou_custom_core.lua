
-- Setup keymapping
local function set_keymap()
	local map = vim.keymap.set

	local option = { noremap = true, silent = true }

	-- 这几个配置可能不是很需要,暂时先放着
	-- clean line below
	map("n",";j", "m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>", option)
	-- clean line above
	map("n",";k", "m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>", option)

	-- add blank line below
	map("n"," j", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", option)
	-- add blank line above
	map("n"," k", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", option)

	map("i", "jk", "<Escape>", option)
    map("i", "kj", "<Escape>", option)

	-- zen-mode
    map("n", "<leader>z", ":ZenMode<CR>", option)

end


set_keymap()
