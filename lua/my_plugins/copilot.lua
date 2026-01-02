-- my_plugins.copilot
-- 职责：统一管理 Copilot 系列插件（vim 版 / lua 版 / CopilotChat）的启用与基础配置
return {
  -- 官方 Copilot.vim 插件：通过云端 AI 自动补全代码（当前启用）
  {
    "github/copilot.vim",
    lazy = false,
    enabled = true,
    config = function()
      -- Mapping tab is already used by NvChad
      -- vim.g.copilot_no_tab_map = true
      -- vim.g.copilot_assume_mapped = true;
      -- vim.g.copilot_tab_fallback = "";
      vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },

  -- Lua 版 Copilot 客户端（更细粒度配置），当前未启用
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = false,
    opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-p>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = true,
        ["*"] = true,
      },
      copilot_node_command = "node", -- Node.js version must be > 18.x
      server_opts_overrides = {},
    },
  },

  -- CopilotChat：在 Neovim 内与 Copilot 进行对话/解释代码，当前未启用
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      language = "Chinese", -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.25, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = "Copilot Chat", -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      {
        "<Leader>ch",
        ":'<,'>CopilotChat<CR>",
        mode = { "v" },
        desc = "Copilot Chat Selection",
      },
      {
        "<Leader>ch",
        ":CopilotChatToggle<CR>",
        mode = { "n" },
        desc = "Toggle Copilot Chat",
      },
      { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
      {
        "<leader>cce",
        "<cmd>CopilotChatExplain<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Explain code",
      },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>ccv",
        ":CopilotChatVisual ",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    },
  },
}
