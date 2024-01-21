local M = {}

M.setup = function()
  require("snippets.c")
  require("snippets.java")
  require("luasnip.loaders.from_vscode").lazy_load({
    include = { "go", "c", "python", "sh", "json", "lua", "gitcommit", "sql", "html" },
  })
end

return M
