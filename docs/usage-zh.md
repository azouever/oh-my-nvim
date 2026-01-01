## 简介

这个配置是从 `hardhackerlabs/oh-my-nvim` fork 后做的个人定制版，整体结构沿用原项目，但做了不少“精简 + 私人喜好”的调整：

- 日常编码（LSP + Treesitter + 补全）
- Git 工作流（gitsigns / diffview / lazygit 浮动终端）
- 会话管理（auto-session）
- Markdown / Obsidian 相关工作流

默认 `leader` 键为 `;`。

---

## 安装与启动

> 假设本仓库已经放到 `~/.config/nvim` 下。

- Neovim 版本：建议 `0.8+`
- 推荐额外工具：`ripgrep`、`fd`、Nerd Font 字体

启动：

- 终端执行 `nvim` 即可
- 第一次启动会自动安装 `lazy.nvim` 和各类插件（需要网络）

---

## 目录结构（简化版）

`~/.config/nvim` 下主要目录：

- `init.lua`：入口，设置 `leader`，加载 lazy.nvim，导入各类模块
- `lua/basic.lua`：基础配置入口（UI、编辑器等）
- `lua/core.lua`：核心快捷键 + 终端、文件树、Git、会话等行为
- `lua/azou_custom_core.lua`：个人键位、行为微调（比如剪贴板、buffer 管理等）
- `lua/config/`
  - `options.lua`：常规 `vim.o` / `vim.opt` 设置
  - `autocmds.lua`：自动命令
  - `custom_cmd.lua`：自定义命令（Obsidian、保存并退出、提取匹配内容等）
- `lua/plugins/`：主插件列表（按功能拆文件：`git.lua`、`lsp.lua`、`terminal.lua` 等）
- `lua/my_plugins/`：个人插件配置（Copilot、注释、滚动条等）
- `lua/base/`：通用基础增强（UI、treesitter 等）

后续如果要自己扩展，**优先在 `lua/my_plugins` 和 `custom_*` 文件里改**，尽量少动原始插件配置文件。

---

## 核心功能与插件

- 插件管理：`lazy.nvim`
- 主题与 UI：
  - 默认主题：`github-nvim-theme`（GitHub Dark）
  - 提前预置但当前关闭的主题：`nightfox`、`catppuccin`、`rose-pine`、`kanagawa` 等（`enabled = false`）
  - `bufferline.nvim` (标签栏)
  - `lualine.nvim` (状态栏，目前配置主体注释掉，走比较简洁的状态行)
  - `nvim-web-devicons` 图标
  - `noice.nvim` 更好看的消息 / 命令行 UI
  - `zen-mode.nvim` + `twilight.nvim` 专注模式
- 文件与搜索：
  - `neo-tree.nvim` 文件树
  - `telescope.nvim` 文件 / 内容 / 缓冲区搜索
- 终端：
  - `toggleterm.nvim` 浮动终端 / 底部终端
  - 集成 `lazygit` 浮动窗口
- Git：
  - `gitsigns.nvim` 行内 Git 标记
  - `diffview.nvim` Git diff 视图
- LSP & 补全（当前默认关闭，预置配置在 `lua/plugins/lsp.lua` 和 `lua/base/treesitter.lua` 里）：
  - 预置了 `mason.nvim`、`mason-lspconfig.nvim`、`nvim-lspconfig`、`none-ls.nvim` 等，但都 `enabled = false`
  - 预置了 `nvim-cmp` 全家桶配置（`lua/base/coding.lua` 中 `hrsh7th/nvim-cmp`，同样 `enabled = false`）
  - 预置了 `nvim-treesitter` 配置（`lua/base/treesitter.lua`，`enabled = false`）
  - 实际效果：当前版本**没有自动启用 LSP / 补全 / treesitter**，更偏“轻量编辑器”；需要时可以按需开启（见下文“高级功能开关”）
- 会话管理：
  - `rmagatti/auto-session`，附带 Telescope 集成
- Markdown / Obsidian：
  - `markdown-preview.nvim`
  - 自定义命令 `OpenInObsidian` + 快捷键

---

## 常用快捷键速查

下面尽量把当前配置里“能直接用到的东西”都列出来（只要 `enabled = true` 或代码里显式设置了键位/命令的，基本都在这）。

### 1. 窗口与 buffer

- 窗口跳转（`lua/core.lua` + `custom_keys.lua`）：
  - `<C-h/j/k/l>`：在分屏间移动
- 窗口大小调整（`smart-splits.nvim`）：
  - `<leader>h/j/k/l`：向左/下/上/右调整窗口大小
- buffer 管理（`azou_custom_core.lua`）：
  - `<leader>bd`：关闭当前 buffer
  - `<leader>bn` / `<leader>bp`：切换下一个 / 上一个 buffer
  - `<leader>bl`：列出所有 buffer
  - `<leader>w` / `<leader>W`：保存当前 / 所有 buffer
  - `<leader>ww`：保存当前 buffer（`core.lua` 中额外绑定）

其他编辑相关：

- 取消搜索高亮：
  - `<Esc>`：清除搜索高亮并清空命令行提示（`core.lua`）
- Markdown 阅读体验优化：
  - 在 `markdown` buffer 中：`j/k` 会被重映射为 `gj/gk`（在视觉行上下移动），并自动开启 `wrap`（`core.lua`）


### 2. 文件树和查找

- 文件树（`neo-tree`）：
  - `<F9>`：打开/关闭左侧文件树
  - `<F8>`：打开/关闭 Git 状态浮窗
- 全局搜索（`telescope`）：
  - `<leader>ff`：查找文件
  - `<leader>gg`：全局内容搜索（ripgrep）
  - `<leader>cc`：搜索光标下单词
  - `<leader>bb`：在已打开 buffer 中切换
  - `<leader>mm`：查看 marks
  - `<leader>jj`：查看跳转记录
  - `<leader>rr`：查看寄存器
  - `<leader>cc`：在 Telescope 中列出命令（注意：这个键位在 `core.lua` 和 `Telescope commands` 上都有用到，效果一致）

### 3. Git 相关

- diff 视图（`diffview.nvim`）：
  - `<leader>df`：打开 Git diff 窗口
  - `<leader>dc`：关闭 Git diff
- `lazygit` 浮动终端：
  - 正常模式按：`<Space> g`（注意是**空格 + g**）调用

### 4. 终端与会话

- 浮动终端（`toggleterm` + `core.lua`）：
  - `<C-t>`：打开/关闭浮动终端（普通模式和终端模式都可用）
  - 命令：`:Termfloat`，或命令行输入 `terminal` 会被自动展开为 `Termfloat`
  - 终端模式下：在浮动终端里可用 `<C-h/j/k/l>` 在窗口之间跳转（`core.lua` 中针对终端 buffer 做了 keymap）
- 会话管理（`auto-session`）：
  - `<leader>ss`：搜索已有会话
  - `<leader>wq`：保存会话并退出（调用 `SaveAndQuit`）
  - `<leader>sw`：保存当前会话
  - `<leader>sas`：切换自动保存
  - `<leader>sr`：恢复当前目录会话
  - `<leader>sd`：删除当前目录会话
  - `<leader>sdA` / `<leader>sea`：禁用 / 启用自动保存
  - `<leader>sp`：清除孤立会话
  - `<leader>sl` / `<leader>sx`：通过 picker 选择加载 / 删除会话

### 5. 剪贴板与复制

- 系统剪贴板（`azou_custom_core.lua`）：
  - `<leader>y` / `<leader>Y`：把选中内容 / 当前行复制到系统剪贴板
  - `<leader>p` / `<leader>P`：从系统剪贴板粘贴
- buffer 级操作（`core.lua`）：
  - `<leader>ca`：复制当前 buffer 全部内容（内部就是 `ggVGy`）
  - `<leader>ra`：用寄存器内容覆盖当前 buffer 全部内容（`ggVGpgg`）

### 6. LSP 与代码导航（当前默认关闭）

- 当前配置里，LSP 相关插件都是 `enabled = false`，不会自动加载。
- `lua/custom_keys.lua` 中预留了常见 LSP 键位，**启用 LSP 后**可用：
  - `gd`：跳转定义
  - `gr`：查看引用
  - `gD`：跳转声明
  - `gi`：跳转实现
  - `<leader>re`：重命名符号
  - `==`：格式化当前行/选区
- 启用 `lua/plugins/lspconfig/config.lua` 后，还会增加一些通用快捷键：
  - `<space>e`：弹出当前诊断信息浮窗
  - `[d` / `]d`：上一条 / 下一条诊断
  - `<space>q`：把诊断写入 loclist
  - `K`：悬停文档
  - `<C-m>`：在普通模式下触发 signature help
  - `<space>wa/wr/wl`：管理 workspace folders
  - `<space>D`：类型定义
  - `<space>ca`：代码动作（普通/可视模式）

### 6. Markdown 与 Obsidian

- Markdown 预览：
  - `<leader>mt`：切换 Markdown 渲染（`RenderMarkdown toggle`）
- Obsidian 打开当前文件：
  - 命令：`:OpenInObsidian`
  - 快捷键：`<leader>pio`
  - 逻辑：根据当前文件路径拼出 `obsidian://open?vault=...&file=...` 并通过系统 `open` 打开

### 7. Markdown 与 Obsidian

- Markdown 预览：
  - `<leader>mt`：切换 Markdown 渲染（`RenderMarkdown toggle`）
- Obsidian 打开当前文件：
  - 命令：`:OpenInObsidian`
  - 快捷键：`<leader>pio`
  - 逻辑：根据当前文件路径拼出 `obsidian://open?vault=...&file=...` 并通过系统 `open` 打开

### 8. 其他实用小功能

- 复制当前文件完整路径：
  - 命令：`:CopyBufferFullPath`
  - 快捷键：`<leader>cfp`
- 提取匹配内容到文件（`ExtractMatches`，自定义命令）：
  - 用法：`:ExtractMatches {lua模式} {输出文件路径}`
  - 示例：`:ExtractMatches '\\d+' /tmp/numbers.txt`
  - 行为：对当前 buffer 每行用 Lua `string.match` 匹配，将匹配结果逐行写入目标文件
- 清空空行 / 插入空行（`azou_custom_core.lua`）：
  - `;j`：删除当前光标下方所有空行
  - `;k`：删除当前光标上方所有空行
  - `" j"`：在当前行下方插入空行
  - `" k"`：在当前行上方插入空行
- 专注模式：
  - `<leader>z`：开启/关闭 Zen Mode（内部会使用 `zen-mode.nvim` + `twilight.nvim`）

### 9. 命令行增强（Wilder）

- 作用范围：命令行/搜索（`:`、`/`、`?`）
- 功能：提供带图标和滚动条的模糊匹配菜单。
- 常用键：
  - 在命令行模式（`c`）下：
    - `<Tab>` / `<Down>`：在 Wilder popup 中选择下一项
    - `<Up>`：选择上一项
  - 菜单样式和行为在 `lua/plugins/view.lua` 中配置（不需要手动记命令）。

---

## 自定义配置建议

### 自定义按键

- 编辑 `lua/custom_keys.lua`：
  - 修改 `leader`：`leader = ";"` 改成你习惯的键
  - 调整各类功能键位（窗口跳转、查找、diff、终端等）
- 复杂场景可以在 `lua/azou_custom_core.lua` 中继续加映射（这里已经有大量示例）。

### 添加自己的插件

- 推荐做法：在 `lua/my_plugins/` 下新增一个 `xxx.lua`，返回 lazy.nvim 的插件表，例如：

```lua
return {
  {
    "author/plugin",
    config = function()
      -- 在这里写你的配置
    end,
  },
}
```

lazy.nvim 会自动加载 `my_plugins` 目录下的所有 Lua 文件。

---

## 高级功能开关（LSP / treesitter / DAP 等）

这一部分是为了让你知道：**很多“重型功能”其实已经预设好，只是默认关掉了**，需要的时候可以自己打开。

### 1. 启用 LSP 相关

- 文件位置：`lua/plugins/lsp.lua`
- 里面的几个插件项（`mason.nvim` / `mason-lspconfig.nvim` / `nvim-lspconfig` / `none-ls.nvim` / `mason-null-ls.nvim`）都设置了 `enabled = false`。
- 做法：把你需要的那几个改成 `enabled = true`，例如：

```lua
{
  "neovim/nvim-lspconfig",
  enabled = true,
  config = function()
    require("plugins/lspconfig/config")()
  end,
},
```

改完重新打开 Neovim，LSP 部分就会开始生效（具体 server 安装依然走 mason 等流程）。

### 2. 启用补全（nvim-cmp）

- 文件位置：`lua/base/coding.lua`
- `hrsh7th/nvim-cmp` 插件块同样标记了 `enabled = false`。
- 可将其改成 `enabled = true`，并根据需要一起启用 `LuaSnip` 和 snippet 相关依赖。

### 3. 启用 treesitter

- 文件位置：`lua/base/treesitter.lua`
- 顶层插件 `nvim-treesitter/nvim-treesitter` 设置了 `enabled = false`。
- 将其改为 `enabled = true` 后，会按照 `ensure_installed` 列表安装高亮解析器，并启用文本对象/增量选择等功能。

### 4. 启用 DAP / LSP Signature / lsp-zero 方案

- DAP：`lua/code/dap.lua`（`mfussenegger/nvim-dap`，`enabled = false`）
- LSP signature：`lua/code/lspsignature.lua`（`ray-x/lsp_signature.nvim`，`enabled = false`）
- lsp-zero 方案：`lua/code/zero_lsp.lua`（`VonHeikemen/lsp-zero.nvim`，`enabled = false`）

你可以根据自己的偏好选择“官方 lspconfig + mason”方案或者“一站式 lsp-zero”方案，**不建议两套同时开**，否则易混乱。

---

## 使用小建议

- 第一次打开某项目目录时：
  - 用 `<F9>` 打开文件树
  - 用 `<leader>ff` 快速定位文件
  - 结束工作时用 `<leader>wq` 保存会话并退出
- Git 场景：
  - 日常看 diff：`<leader>df` 打开 diffview
  - 复杂操作：用 `<Space> g` 打开 lazygit 浮动终端
- Markdown / Obsidian：
  - 写作时可以配合 `zen-mode` 打开专注模式，然后用 `:OpenInObsidian` 在 Obsidian 中浏览

如果你后面想针对某一块（比如 LSP、Git 或 Obsidian 工作流）做更深的定制，我们可以在现有结构上再拆出更清晰的模块。哥你只管说“想干啥”，我来帮你把配置整理到“人类可读”的程度。  
- 代码编辑增强（已启用）：
  - `numToStr/Comment.nvim`：`gcc`、`gc` 一类注释快捷键（`lua/my_plugins/comment.lua`）
  - `phaazon/hop.nvim`：`<leader>f` 快速跳转（`lua/my_plugins/hop.lua`）
  - `mg979/vim-visual-multi`：多光标编辑（`lua/my_plugins/multiope.lua`）
  - `MagicDuck/grug-far.nvim`：跨文件查找替换（`lua/my_plugins/find_and_replace.lua`）
- AI 辅助（Copilot 系列）：
  - `github/copilot.vim`：已启用，默认在插入模式下用 `<C-L>` 接受建议（`lua/my_plugins/copilot.lua`）
  - `CopilotC-Nvim/CopilotChat.nvim`：已配置，默认懒加载，提供一套 `<leader>cc*` 的交互命令
