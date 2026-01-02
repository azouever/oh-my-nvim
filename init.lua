-- Neovim 入口配置
-- 1. 设置全局按键前缀
-- 2. 使用 lazy.nvim 加载各类模块化配置（plugins / my_plugins / base / code）
-- 3. 加载核心逻辑和自定义配置
-- 4. 定义一些通用的高亮与自动命令

-- Basic settings
vim.g.maplocalleader = ";"
vim.g.mapleader = ";"

require("basic")

-- Load plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = require("custom_keys").leader

-- 通过 lazy.nvim 统一管理插件以及基础配置
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "my_plugins" },
    { import = "base" },
    { import = "code" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
})

-- 加载核心按键映射 / 窗口透明度等设置
require("core")

-- 加载个性化定制逻辑（额外增强）
require("azou_custom_core")

-- pcall(require, "custom")

-- 复制后短暂高亮被复制的内容，便于确认 yank 范围
-- 原始出处: https://www.reddit.com/r/neovim/comments/suy5j7/highlight_yanked_text/
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=200})
augroup END
]])

-- 自定义 Visual 模式的高亮样式（黑字白底，更明显）
vim.cmd([[highlight Visual guifg=#000000 guibg=#FFFFFF gui=none]])

require("config.options")
require("config.custom_cmd")
require("config.autocmds")
--require "config.lazy"

--if vim.fn.argc(-1) == 0 then
--  vim.api.nvim_create_autocmd("User", {
--    group = vim.api.nvim_create_augroup("NeovimPDE", { clear = true }),
--    pattern = "VeryLazy",
--    callback = function()
--      require "config.autocmds"
--      require "config.keymaps"
--    end,
--  })
--else
--  require "config.autocmds"
--  require "config.keymaps"
--end
