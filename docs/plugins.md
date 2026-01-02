# All Plugins integrated

- [lazy.nvim](https://github.com/folke/lazy.nvim) (Plugin manager)
- [hardhacker-theme](https://github.com/hardhackerlabs/theme-vim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [neo-tree.lua](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)
- [bufdelete](https://github.com/famiu/bufdelete.nvim)
- [aerial](https://github.com/stevearc/aerial.nvim)
- [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [noice](https://github.com/folke/noice.nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [twilight.nvim](https://github.com/folke/twilight.nvim)
- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
- [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

## 插件总览（中文说明 + 启用状态）

> 说明：  
> - “启用” 指当前 lazy 配置中 `enabled ~= false` 且未整体注释的插件  
> - “未启用” 指 `enabled = false` 或整块被注释，仅作为备用方案存在

### 界面 / UI

- `utilyre/barbecue.nvim`（启用）  
  顶部 winbar 面包屑导航，显示当前文件和 LSP 符号路径。
- `nvim-lualine/lualine.nvim`（启用）  
  状态栏插件，展示模式、文件信息、LSP/Git 状态等。
- `nvim-neo-tree/neo-tree.nvim`（启用）  
  左侧文件树浏览器，集成 Git 状态和多种视图。
- `akinsho/bufferline.nvim`（启用）  
  顶部多 Buffer 标签栏，方便在多个文件间切换。
- `stevearc/dressing.nvim`（启用）  
  美化 Neovim 内置 `vim.ui.select` / `vim.ui.input` 等弹窗。
- 主题插件（当前默认启用 `projekt0n/github-nvim-theme`，其他未启用）：  
  - `projekt0n/github-nvim-theme`（启用）  
    GitHub 风格配色方案，当前主用主题。  
  - `hardhackerlabs/theme-vim` / `EdenEast/nightfox.nvim` / `catppuccin/nvim` / `folke/tokyonight.nvim` / `rose-pine/neovim` / `rebelot/kanagawa.nvim`（均未启用）  
    多套备用主题，随时可切换测试。

### 命令行 / 消息 UI

- `folke/noice.nvim`（启用）  
  接管 Neovim 消息和命令行 UI，支持历史查看、LSP 消息等；cmdline 展示方式由 `custom_opts.cmdline_view` 控制。
- `gelguy/wilder.nvim`（视你当前配置而定，一般与 noice 只能选一个）  
  增强命令行和搜索提示，提供历史记录与 popupmenu 风格选择器。
- `rcarriga/nvim-notify`（依赖，启用）  
  通知弹窗插件，被 noice 等用于展示通知。

### 查找 / 导航

- `nvim-telescope/telescope.nvim`（启用）  
  模糊查找中心：文件、内容、缓冲区、Git 等全局搜索。
- `MagicDuck/grug-far.nvim`（启用）  
  工程级查找与替换工具，支持多文件批量替换。
- `phaazon/hop.nvim`（启用）  
  快速跳转插件，通过输入少量字符跳转到目标位置。

### 终端 / 会话

- `akinsho/toggleterm.nvim`（启用）  
  提供浮动/水平/垂直终端窗口，与 `core.lua` 中快捷键配合使用。
- `rmagatti/auto-session`（启用）  
  自动保存和恢复会话（工程级的「打开文件集」），支持 Telescope 选择、自动保存。
- `Shatur/neovim-session-manager`（推荐，未启用）  
  另一套会话管理插件，目前仅保留配置示例。

### Git 相关

- `lewis6991/gitsigns.nvim`（启用）  
  在行号栏展示 Git 变更标记（新增/修改/删除），支持 inline blame。
- `sindrets/diffview.nvim`（启用）  
  使用侧边窗格浏览 Git diff、历史变更和提交内容。

### 注释 / 代码结构

- `numToStr/Comment.nvim`（启用）  
  统一管理注释操作，提供 `gcc`、`gc` 等快捷键。
- `hardhackerlabs/theme-vim` 相关基础配置（启用与否取决于主题选择）  
  部分 UI 配置源自 hardhacker 主题结构。

### LSP / 补全 / 诊断

- `neovim/nvim-lspconfig`（在 `plugins/lsp.lua` 中声明，但当前未启用）  
  原生 LSP 客户端配置入口。  
- `williamboman/mason.nvim` / `mason-lspconfig.nvim` / `mason-nvim-dap.nvim` / `jay-babu/mason-null-ls.nvim`（未启用）  
  LSP/DAP/外部工具安装与绑定管理器，目前配置存在但默认关闭。  
- `nvimtools/none-ls.nvim`（未启用）  
  `null-ls` 的新仓库名，用于把外部格式化/诊断工具包装成 LSP 源。  
- `VonHeikemen/lsp-zero.nvim`（未启用，`lua/code/zero_lsp.lua`）  
  一键式 LSP + 补全套件，包含 mason、lspconfig、nvim-cmp、LuaSnip 等整合。  
- `hrsh7th/nvim-cmp` 以及 `cmp-nvim-lsp`/`cmp-buffer`/`cmp-path`/`cmp-cmdline`/`saadparwaiz1/cmp_luasnip`（多处声明，整体当前默认未启用）  
  通用补全框架及其补全源。  
- `L3MON4D3/LuaSnip` + `rafamadriz/friendly-snippets`（启用）  
  片段引擎与通用 snippet 集合，供补全和手动调用使用。  
- `ray-x/lsp_signature.nvim`（未启用）  
  在输入参数时显示函数签名的插件。  

### 调试 / DAP

- `mfussenegger/nvim-dap` + `rcarriga/nvim-dap-ui` + `nvim-neotest/nvim-nio`（未启用）  
  调试框架与 UI 面板，用于设置断点、查看堆栈、变量等。  

### 文本/视觉增强

- `folke/zen-mode.nvim`（启用）  
  专注模式，隐藏多余 UI 元素，便于集中编辑。  
- `folke/twilight.nvim`（启用）  
  聚光灯模式，高亮当前上下文行，暗化其他区域。  
- `lukas-reineke/indent-blankline.nvim`（推荐，未启用）  
  为缩进层级绘制虚线辅助线。  
- `NvChad/nvim-colorizer.lua`（推荐，未启用）  
  根据颜色值（如 `#RRGGBB`）在代码中直接显示对应颜色。  
- 滚动条相关推荐：  
  - `petertriho/nvim-scrollbar` / `lewis6991/satellite.nvim`（`my_plugins/scrollbar.lua` 中示例，未启用）  
    在右侧显示迷你滚动条和诊断/Git 标记。

### 启动画面 / Markdown / 语言特定

- `goolord/alpha-nvim`（启用）  
  启动画面/仪表盘，展示欢迎页和常用入口。  
- `iamcco/markdown-preview.nvim`（推荐，未启用）  
  在浏览器中实时预览 Markdown。  
- Go 语言相关：  
  - `ray-x/go.nvim` / `fatih/vim-go`（`misc/recommended/go.lua` 和 `my_plugins/vimgo.lua` 中示例，未启用）  
    Go 生态的工具集与集成，推荐未来如有需要再接入。  

### Copilot / AI

- `github/copilot.vim`（启用）  
  GitHub Copilot 官方 Vim 插件，提供 AI 补全。  
- `zbirenbaum/copilot.lua`（未启用）  
  Lua 版 Copilot 客户端，配置更灵活。  
- `CopilotC-Nvim/CopilotChat.nvim`（未启用）  
  在 Neovim 内与 Copilot 对话、解释代码/生成修改建议。  

### 其它推荐/实验性插件

- `kevinhwang91/nvim-ufo`（折叠增强，未启用，仅保留配置模板）  
- `stevearc/aerial.nvim`（大纲视图，未启用，仅注释示例）  
- `mrjones2014/smart-splits.nvim`（启用）  
  智能分屏缩放与光标移动，配合快捷键快速调整窗口布局。  
- 旧会话/缓冲区插件：`famiu/bufdelete.nvim`、`Shatur/neovim-session-manager`（均未启用，仅保留历史配置）。
