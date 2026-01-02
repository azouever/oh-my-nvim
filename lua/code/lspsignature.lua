-- code.lspsignature
-- 职责：配置 ray-x/lsp_signature.nvim，用于输入时显示函数签名（当前默认关闭）
return {
  -- 在输入函数参数时自动弹出签名提示（参数列表/类型），当前未启用
  "ray-x/lsp_signature.nvim",
  enabled = false,
  config = function()
    require("lsp_signature").setup()
  end,
}
