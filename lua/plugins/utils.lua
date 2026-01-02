-- plugins.utils
-- 职责：不直接归类到 UI / LSP / Coding 的通用工具类插件
return {
  -- 自动管理会话（打开 Neovim 自动恢复、退出自动保存），支持 Telescope 会话选择
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      -- 使用 Telescope（如果已安装）或 vim.ui.select 选择器进行会话搜索
      { "<leader>ss", "<cmd>SessionSearch<CR>", desc = "Session search" },

      { "<leader>wq", "<cmd>SaveAndQuit<CR>", desc = "Session Quick Quit" },

      -- 保存当前会话
      { "<leader>sw", "<cmd> silent! SessionSave<CR>", desc = "Save session" },

      -- 切换自动保存功能
      { "<leader>sas", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },

      -- 恢复当前工作目录的会话
      { "<leader>sr", "<cmd> silent! SessionRestore<CR>", desc = "Restore session" },

      -- 删除当前工作目录的会话
      { "<leader>sd", "<cmd>SessionDelete<CR>", desc = "Delete session" },

      -- 禁用自动保存功能
      { "<leader>sdA", "<cmd>SessionDisableAutoSave<CR>", desc = "Disable autosave" },

      -- 启用自动保存功能（如果之前被禁用）
      { "<leader>sea", "<cmd>SessionDisableAutoSave!<CR>", desc = "Enable autosave" },

      -- 移除所有没有工作目录的孤立会话
      { "<leader>sp", "<cmd>SessionPurgeOrphaned<CR>", desc = "Purge orphaned sessions" },

      -- 使用 vim.ui.select 选择器选择要加载的会话
      { "<leader>sl", "<cmd>Autosession search<CR>", desc = "Load session" },

      -- 使用 vim.ui.select 选择器选择要删除的会话
      { "<leader>sx", "<cmd>Autosession delete<CR>", desc = "Delete session via picker" },
    },

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      enabled = true, -- Enables/disables auto creating, saving and restoring
      root_dir = vim.fn.stdpath("data") .. "/auto_sessions/", -- Root dir where sessions will be stored
      auto_save = true, -- Enables/disables auto saving session on exit
      auto_restore = true, -- Enables/disables auto restoring session on start
      auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
      suppressed_dirs = nil, -- Suppress session restore/create in certain directories
      allowed_dirs = nil, -- Allow session restore/create in certain directories
      auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
      use_git_branch = false, -- Include git branch name in session name
      lazy_support = true, -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used. Can be disabled if a problem is suspected or for debugging
      bypass_save_filetypes = nil, -- List of file types to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
      close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
      args_allow_single_directory = true, -- Follow normal sesion save/load logic if launched with a single directory as the only argument
      args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
      continue_restore_on_error = true, -- Keep loading the session even if there's an error
      cwd_change_handling = false, -- Follow cwd changes, saving a session before change and restoring after
      log_level = "error", -- Sets the log level of the plugin (debug, info, warn, error).
      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
        load_on_setup = true,
        previewer = false,
        mappings = {
          -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
          delete_session = { "i", "<C-D>" },
          alternate_session = { "i", "<C-S>" },
        },
        -- Can also set some Telescope picker options
        theme_conf = {
          border = true,
          -- layout_config = {
          --   width = 0.8, -- Can set width and height as percent of window
          --   height = 0.5,
          -- },
        },
        session_control = {
          control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
          control_filename = "session_control.json", -- File name of the session control file
        },
      },
      -- pre_save_cmds = { "tabdo NeoTreeClose" },
      -- post_save_cmds = { "tabdo NeoTreeReveal" },
      -- post_open_cmds = { "tabdo NeoTreeShow" },
      post_restore_cmds = {
        function()
          -- 执行 SessionRestore 命令
          -- vim.cmd("SessionRestore")
          -- 刷新所有缓冲区
          -- vim.cmd("bufdo e")
        end,
        "tabdo NeoTreeShow",
      },
      cwd_change_handling = {
        restore_upcoming_session = true,
        pre_cwd_changed_hook = nil,
        post_cwd_changed_hook = nil,
      },
    },
    -- config = function()
    --   require("auto-session").setup({
    --     pre_save_cmds = { "tabdo NeoTreeClose" },
    --     -- post_save_cmds = { "tabdo NeoTreeReveal" },
    --     post_open_cmds = { "tabdo NeoTreeShow" },
    --     post_restore_cmds = { "tabdo  NeoTreeShow", vim.cmd("silent! bufdo e") },
    --     cwd_change_handling = {
    --       restore_upcoming_session = true,
    --       pre_cwd_changed_hook = nil,
    --       post_cwd_changed_hook = nil,
    --     },
    --     auto_session_create_enabled =   true,
    --     log_level = "error",
    --     -- auto_session_enable_last_session = false,
    --     auto_session_root_dir = vim.fn.stdpath("data") .. "/xkx_sessions/",
    --     auto_session_enabled = true,
    --     auto_save_enabled = true,
    --     auto_restore_enabled = true,
    --   })
    -- end,
  },

  -- { "rcarriga/nvim-notify" },

  -- resize the window
  -- 智能分屏缩放（配合快捷键快速调整窗口大小）
  {
    "mrjones2014/smart-splits.nvim",
    version = "v1.2.2",
    config = function()
      require("plugins/smart-split/config")()
    end,
  },

  -- -- buffer delete
  -- { "famiu/bufdelete.nvim" },

  -- -- session
  -- {
  -- 	"Shatur/neovim-session-manager",
  -- 	dependencies = { "nvim-lua/plenary.nvim" },
  -- 	config = function()
  -- 		local Path = require("plenary.path")
  -- 		local config = require("session_manager.config")
  -- 		require("session_manager").setup({
  -- 			sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
  -- 			session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
  -- 			dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
  -- 			autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  -- 			autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  -- 			autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  -- 			autosave_ignore_dirs = { "/", "~", "/tmp/" }, -- A list of directories where the session will not be autosaved.
  -- 			autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
  -- 				"gitcommit",
  -- 				"gitrebase",
  -- 			},
  -- 			autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
  -- 			autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  -- 			max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  -- 		})

  -- 		-- automatic open neotree sidebar when a session opened
  -- 		local hardhacker_config_group = vim.api.nvim_create_augroup("HardHackerConfigGroup", {})
  -- 		vim.api.nvim_create_autocmd({ "User" }, {
  -- 			pattern = "SessionLoadPost",
  -- 			group = hardhacker_config_group,
  -- 			callback = function()
  -- 				vim.api.nvim_command("Neotree position=left source=filesystem action=show")
  -- 			end,
  -- 		})
  -- 	end,
  -- },
  -- zen-mode
  -- 专注模式：只保留当前窗口、隐藏多余 UI 元素，适合长时间码字/阅读
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 0.9, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win) end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function() end,
    },
  },
  -- 代码“聚光灯”模式：高亮当前上下文，暗化其他区域
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        -- color = { "Normal", "#eee9fc" },
        -- term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 10, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
      -- treesitter is used to automatically expand the visible text,
      -- but you can further control the types of nodes that should always be fully expanded
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {}, -- exclude these filetypes
    },
  },
}
