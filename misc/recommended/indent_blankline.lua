-- 推荐插件：indent-blankline.nvim
-- 职责：在缩进位置画出虚线缩进线，突出当前缩进上下文（当前未默认启用）
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },
}
