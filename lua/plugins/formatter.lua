-- plugins.formatter
-- 职责：集中管理通用代码格式化插件（当前仅挂载 formatter.nvim，默认关闭）
return {
  -- 其他插件...
  -- 通用代码格式化入口（可按 filetype 绑定外部 formatter，当前整体未启用）
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
