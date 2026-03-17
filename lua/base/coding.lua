-- base.coding
-- 职责：代码片段引擎（当前禁用补全，如需可启用）
return {
  -- 代码片段（Snippet）
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("plugins.luasnip.config")
    end,
  },
}
