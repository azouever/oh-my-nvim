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

-- -- Final settings

require("core")

require("azou_custom_core")

-- pcall(require, "custom")

-- from https://www.reddit.com/r/neovim/comments/suy5j7/highlight_yanked_text/
-- :h vim.highlight.on_yank
-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=200})
augroup END
]])


vim.cmd([[highlight Visual guifg=#000000 guibg=#FFFFFF gui=none]])

require "config.options"
require "config.custom_cmd"
require "config.autocmds"
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
