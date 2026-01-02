-- 推荐插件：markdown-preview.nvim
-- 职责：在浏览器中预览 Markdown 文件（当前未默认启用，如需可手动接入 lazy 规范）
return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
