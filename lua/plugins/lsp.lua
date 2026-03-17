-- plugins.lsp
-- 职责：LSP 配置（代码跳转、引用、hover 文档）
return {
  -- Mason: 自动安装 LSP 服务器
  {
    "williamboman/mason.nvim",
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

  -- mason-lspconfig: 自动配置已安装的 LSP 服务器
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",      -- Lua
          "ts_ls",       -- TypeScript/JavaScript
          "html",        -- HTML
          "cssls",       -- CSS
          "jsonls",      -- JSON
          "yamlls",      -- YAML
          "bashls",      -- Bash
          "gopls",       -- Go
          "rust_analyzer", -- Rust
          "pylsp",       -- Python
          "vimls",       -- Vim
          "marksman",    -- Markdown
        },
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        end,
      })
    end,
  },

  -- LSP 核心配置
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins/lspconfig/config")()
    end,
  },
}
