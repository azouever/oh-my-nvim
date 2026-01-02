-- plugins.git
-- 职责：Git 相关 UI 与工具（gitsigns / diffview 等）
return {
  -- 在行号栏展示 Git 变更标记（新增/修改/删除），支持 blame 等
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        preview_config = {
          border = "rounded",
        },
      })
    end,
  },

  -- 使用独立侧边窗口查看 Git diff 和历史变更
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
