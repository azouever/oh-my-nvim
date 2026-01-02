-- 基础编辑选项配置
-- 职责：集中管理 Neovim 的常用编辑行为（缩进、折叠、UI、性能相关等）
local opt = vim.opt

opt.autoindent = true
opt.breakindent = true
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.cmdheight = 0
opt.completeopt = "menuone,noselect"
opt.conceallevel = 0
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "1" -- '0' is not bad
opt.foldenable = true
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.formatoptions = "jqlnt" -- tcqj
opt.hidden = true
opt.hlsearch = false
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.joinspaces = false
opt.laststatus = 0
opt.list = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrollback = 100000
opt.scrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.title = true
opt.undofile = true
opt.updatetime = 200
opt.wildmode = "longest:full,full"

-- 全局 leader 与本地 leader
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

vim.g.markdown_recommended_style = 0

-- 空格键在普通/可视模式下不再触发默认行为
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
