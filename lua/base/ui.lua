-- base.ui
-- 职责：主题 / 状态栏 / Tabline 等 UI 相关插件配置
return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    enabled = false,
    opts = {
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        colorblind = {
          enable = false, -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0, -- Severity [0,1] for protan (red)
            deutan = 0, -- Severity [0,1] for deutan (green)
            tritan = 0, -- Severity [0,1] for tritan (blue)
          },
        },
        styles = { -- Style to be applied to different syntax groups
          comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = { -- List of various plugins and additional options
          -- ...
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    },
    config = function()
      -- vim.cmd("colorscheme nightfox")
      vim.cmd("colorscheme dayfox")
      -- vim.cmd("colorscheme dawnfox")
      -- vim.cmd("colorscheme duskfox")
      -- vim.cmd("colorscheme nordfox")
      -- vim.cmd("colorscheme terafox")
      -- vim.cmd("colorscheme carbonfox")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccino",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },

    config = function()
      vim.cmd("colorscheme catppuccin")
      -- vim.cmd("colorscheme catppuccin-latte")
      -- vim.cmd("colorscheme catppuccin-frappe")
      -- vim.cmd("colorscheme catppuccin-macchiato")
      -- vim.cmd("colorscheme catppuccin-mocha")
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    enabled = false,
    opts = {
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      palette = {
        -- Override the builtin palette per variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
      },

      highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    },
    config = function()
      vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    enabled = true, -- disable this colorscheme for now
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      vim.cmd("colorscheme github_dark")
      -- vim.cmd("colorscheme github_light")
      -- vim.cmd("colorscheme github_dark_dimmed")
      -- vim.cmd("colorscheme github_dark_default")
      -- vim.cmd("colorscheme github_light_default")
      -- vim.cmd("colorscheme github_dark_high_contrast")
      -- vim.cmd("colorscheme github_light_high_contrast")
      -- vim.cmd("colorscheme github_dark_colorblind")
      -- vim.cmd("colorscheme github_light_colorblind")
      -- vim.cmd("colorscheme github_dark_tritanopia")
      -- vim.cmd("colorscheme github_light_tritanopia")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    enabled = false,
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    },
    config = function()
      vim.cmd("colorscheme kanagawa-wave")
      -- vim.cmd("colorscheme kanagawa-lotus")
      -- vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "hardhackerlabs/theme-vim",
    name = "hardhacker",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.g.hardhacker_darker = 0
      vim.g.hardhacker_hide_tilde = 1
      vim.g.hardhacker_keyword_italic = 1
      vim.cmd("colorscheme hardhacker")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {
      style = "moon",
      -- style = "storm",
      -- style = "day",
      -- style = "night",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  -- { "catppuccin/nvim", lazy = false, name = "catppuccin" },
  -- {
  -- 	"stevearc/dressing.nvim",
  -- 	event = "VeryLazy",
  -- 	opts = {},
  -- },
  -- {
  -- 	"folke/noice.nvim",
  -- 	dependencies = {
  -- 		"MunifTanjim/nui.nvim",
  -- 		"rcarriga/nvim-notify",
  -- 	},
  -- 	event = "VeryLazy",
  -- 	enabled = true,
  -- 	opts = {
  -- 		lsp = {
  -- 			override = {
  -- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  -- 				["vim.lsp.util.stylize_markdown"] = true,
  -- 				["cmp.entry.get_documentation"] = true,
  -- 			},
  -- 		},
  -- 		routes = {
  -- 			{
  -- 				filter = {
  -- 					event = "msg_show",
  -- 					find = "%d+L, %d+B",
  -- 				},
  -- 				view = "mini",
  -- 			},
  -- 		},
  -- 		presets = {
  -- 			bottom_search = true, -- use a classic bottom cmdline for search
  -- 			command_palette = true, -- position the cmdline and popupmenu together
  -- 			long_message_to_split = true, -- long messages will be sent to a split
  -- 			inc_rename = true, -- enables an input dialog for inc-rename.nvim
  -- 			lsp_doc_border = true, -- add a border to hover docs and signature help
  -- 		},
  -- 	},
  --    --stylua: ignore
  --    keys = {
  --      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",    desc = "Redirect Cmdline" },
  --      { "<c-f>",     function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true, expr = true,              desc = "Scroll forward" },
  --      { "<c-b>",     function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true,              desc = "Scroll backward" },
  --    },
  -- },
}
