-- lspconfig 通用配置
-- 职责：设置 LSP 诊断全局按键、以及在 LspAttach 后为每个 Buffer 绑定本地按键
return function()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  -- 全局诊断相关映射，任何 LSP 启动后都可用
  -- 详见 `:help vim.diagnostic.*`
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

  -- 使用 LspAttach 事件，只在当前 buffer 真的附加 LSP 后才设置下列按键
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", require("custom_keys").goto_declaration, vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", require("custom_keys").goto_definition, vim.lsp.buf.definition, opts)
      vim.keymap.set("n", require("custom_keys").goto_references, vim.lsp.buf.references, opts)
      vim.keymap.set("n", require("custom_keys").goto_impl, vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", require("custom_keys").lsp_rename, vim.lsp.buf.rename, opts)
      vim.keymap.set("n", require("custom_keys").format, function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<C-m>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    end,
  })
end
