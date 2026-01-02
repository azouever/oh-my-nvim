-- smart-splits 分屏尺寸调整配置（旧版本保留在注释中，便于对比）
-- 职责：配置智能分屏调整，并绑定统一的方向键映射
-- return function()
--     require('smart-splits').setup({
--         ignored_filetypes = {
--             'nofile',
--             'quickfix',
--             'prompt',
--             -- 'neo-tree',
--         },
--         default_amount = 10,
--         ignored_buftypes = {
--           "nofile"
--           -- 'NvimTree',
--         -- 'neo-tree'
--       },
--     })
--
--     local keys = require("custom_keys")
--     local option = {noremap = true, silent = true }
--
--     vim.keymap.set({'n', 't'}, keys.resize_left, require('smart-splits').resize_left, option)
--     vim.keymap.set({'n', 't'}, keys.resize_down, require('smart-splits').resize_down, option)
--     vim.keymap.set({'n', 't'}, keys.resize_up, require('smart-splits').resize_up, option)
--     vim.keymap.set({'n', 't'}, keys.resize_right, require('smart-splits').resize_right, option)
-- end

return function()
  require("smart-splits").setup({
    ignored_filetypes = {
      "quickfix",
      "prompt",
    },
    ignored_buftypes = {
      "nofile",
    },
    default_amount = 10,
  })

  local keys = require("custom_keys")
  local option = { noremap = true, silent = true }

  vim.keymap.set({ "n", "t" }, keys.resize_left, require("smart-splits").resize_left, option)
  vim.keymap.set({ "n", "t" }, keys.resize_down, require("smart-splits").resize_down, option)
  vim.keymap.set({ "n", "t" }, keys.resize_up, require("smart-splits").resize_up, option)
  vim.keymap.set({ "n", "t" }, keys.resize_right, require("smart-splits").resize_right, option)
end
