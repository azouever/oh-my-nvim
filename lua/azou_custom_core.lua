-- Setup keymapping
local function set_keymap()
	local map = vim.keymap.set

	local option = { noremap = true, silent = true }

	-- 这几个配置可能不是很需要,暂时先放着
	-- clean line below
	map("n", ";j", "m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>", option)
	-- clean line above
	map("n", ";k", "m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>", option)

	-- add blank line below
	map("n", " j", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", option)
	-- add blank line above
	map("n", " k", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", option)

	map("i", "jk", "<Escape>", option)
	map("i", "kj", "<Escape>", option)

	-- zen-mode
	map("n", "<leader>z", ":ZenMode<CR>", option)


  -- 左右快速移动（按 10 个字符）
  map("n", "<S-Left>", "20zh", option)
  map("n", "<S-Right>", "20zl", option)



	-- communicate  with system clipboard
	vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>Y", '"+Y', { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>P", '"+P', { noremap = true })

	-- buffer management
	vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>bn", ":bn<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>bp", ":bp<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>bl", ":ls<CR>", { noremap = true })
	-- buffer save
	vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true })
	-- buffer save all
	vim.api.nvim_set_keymap("n", "<Leader>W", ":wa<CR>", { noremap = true })

	-- telescope setting
	vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
	-- marks
	vim.api.nvim_set_keymap("n", "<Leader>mm", ":Telescope marks<CR>", { noremap = true })
	-- jumps
	vim.api.nvim_set_keymap("n", "<Leader>jj", ":Telescope jumplist<CR>", { noremap = true })
	-- registers
	vim.api.nvim_set_keymap("n", "<Leader>rr", ":Telescope registers<CR>", { noremap = true })
	-- commands
	vim.api.nvim_set_keymap("n", "<Leader>cc", ":Telescope commands<CR>", { noremap = true })
end

local function set_custom_opt()
	-- set clipboard = unnamedplus
	vim.opt.clipboard = "unnamedplus"
end

set_keymap()
set_custom_opt()
