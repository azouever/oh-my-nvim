-- my_plugins.find_and_replace
-- 职责：配置 grug-far.nvim，用于工程级查找与替换
-- my_plugins.find_and_replace
-- 职责：配置 grug-far.nvim，用于工程级查找与替换
return {
  -- 交互式查找替换工具 grug-far（基于 ripgrep），支持多文件批量替换
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      })
    end,
  },
}
