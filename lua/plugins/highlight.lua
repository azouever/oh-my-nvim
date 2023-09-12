return {
    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                indent = {
                    enable = true,
                        disable = {},
                },
                ensure_installed = {"lua", "html","css","vim","javascript","typescript","markdown", "markdown_inline", "regex" },
                sync_install = false,
                auto_install = true,
                ignore_install = {},

                highlight = {
                    enable = true,
                    disable = {},
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                -- 启用增量选择
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        node_incremental = '<CR>',
                        node_decremental = '<BS>',
                        scope_incremental = '<TAB>',
                    }
                },
                -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
                indent = {
                    enable = true
                }
            })

            -- let it to use 'markdown' parser for mdx filetype.
            vim.treesitter.language.register('markdown', 'mdx')
        end,
    },

    -- Colors highlighting
    {
        "NvChad/nvim-colorizer.lua",
        config = function(plun)
            require("colorizer").setup({
                user_default_options = {
                    names = false,
                },
            })
        end,
    },
}
