-- 工具函数集合
-- 职责：提供跨模块复用的小工具函数，目前仅用于检测插件是否已通过 lazy.nvim 注册
local M = {}

function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

return M
