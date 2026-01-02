-- plugins.lsp
-- 职责：LSP / DAP 相关插件声明（mason / mason-lspconfig / mason-nvim-dap 等）
return {
  -- LSP/DAP 依赖安装管理器（Mason），当前整体未启用
  {
    "williamboman/mason.nvim",
    enabled = false,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
          border = "rounded",
        },
      })
    end,
  },
  -- 通过 Mason 安装并配置 DAP 适配器（调试用），当前未启用
  {
    "williamboman/mason-nvim-dap.nvim",
    enabled = false,
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "codelldb",
          "javatest",
          "javadbg",
        },
      })
    end,
  },

  -- 使用 Mason 自动为 LSP 安装对应 server，并调用 lspconfig 进行默认配置，当前未启用
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        -- ["rust_analyzer"] = function ()
        --     require("rust-tools").setup {}
        -- end
      })
    end,
  },

  -- 原生 LSP 配置入口（不通过 mason-zero 等封装），当前未启用
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    config = function()
      require("plugins/lspconfig/config")()
    end,
  },

  -- none-ls/null-ls：将外部工具（格式化、诊断）包装成 LSP 源，当前未启用
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        border = "rounded",
        cmd = { "nvim" },
        debounce = 250,
        debug = false,
        default_timeout = 5000,
        diagnostic_config = {},
        diagnostics_format = "#{m}",
        fallback_severity = vim.diagnostic.severity.ERROR,
        log_level = "warn",
        notify_format = "[null-ls] %s",
        on_init = nil,
        on_exit = nil,
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
        should_attach = nil,
        sources = nil,
        temp_dir = nil,
        update_in_insert = false,
        -- formatting on save
        --on_attach = function(client, bufnr)
        --	if client.supports_method("textDocument/formatting") then
        --		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --		vim.api.nvim_create_autocmd("BufWritePre", {
        --			group = augroup,
        --			buffer = bufnr,
        --			callback = function()
        --				vim.lsp.buf.format({ bufnr = bufnr })
        --			end,
        --		})
        --	end
        --end,
      }) -- end of setup
    end,
  },

  -- mason-null-ls：自动安装/绑定 null-ls 所需的外部工具（shfmt/prettier/stylua 等），当前未启用
  {
    "jay-babu/mason-null-ls.nvim",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        automatic_setup = true,
        ensure_installed = { "shfmt", "prettier", "stylua" },
        handlers = {},
      })
    end,
  },
}
-- plugins.lsp
-- 职责：LSP 框架与相关增强插件（lspconfig / mason / null-ls 等）的统一声明
