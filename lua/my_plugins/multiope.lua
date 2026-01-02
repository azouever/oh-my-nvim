-- my_plugins.multiope
-- 职责：启用多光标编辑插件 vim-visual-multi，可在此处自定义按键行为
return {
  -- 多光标编辑（类似 VSCode 的多处同时编辑），默认使用插件自带快捷键
  "mg979/vim-visual-multi",
  init = function()
    -- 如需自定义多光标快捷键，可在此处设置 VM_maps
    -- 示例：
    -- local t = {}
    -- t["Find Under"] = "<C-n>"
    -- t["Find Subword Under"] = "<C-n>"
    -- vim.g.VM_maps = t
  end,
}
