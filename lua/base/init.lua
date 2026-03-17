-- base.init
-- 职责：基础插件入口（Treesitter, UI, Editor 等）
return {
  -- Treesitter: 语法高亮、textobjects、增量选择
  { import = "base.treesitter" },

  -- UI: 状态栏、文件树、标签栏等
  { import = "base.ui" },

  -- Editor: 编辑增强
  { import = "base.editor" },

  -- Coding: 代码片段
  { import = "base.coding" },
}
