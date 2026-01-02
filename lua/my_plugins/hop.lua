-- my_plugins.hop
-- 职责：配置 hop.nvim 提供快速跳转能力（按键序列可按需自定义）
return {
  -- 快速光标跳转插件 hop.nvim：通过输入一两字符跳转到目标位置
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
}
