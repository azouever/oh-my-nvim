return {
    "mfussenegger/nvim-dap",
    cond = true,
    keys = {
        { "<space>b", mode = "n" },
        { "<space>B", mode = "n" },
        { "<leader>tb", mode = "n" },
        { "<leader>sc", mode = "n" },
        { "<leader>cl", mode = "n" },
    },
    dependencies = {
        require("plugins.dap.dependencies.nvim-dap-ui"),
        require("plugins.dap.dependencies.nvim-dap-virtual-text"),
    },
    config = function()
        -- 对各个语言的配置
        require("dap-config.python")
        -- require("dap-conf.lldb-vscode")
        -- require("dap-conf.codelldb")
        -- require("dap-conf.gdb")
        -- require("dap-conf.lldb")
        -----------------------------------------------------

        vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "", linehl = "", numhl = "" }) -- 
        -- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })

        -- vim.fn.sign_define("DapBreakpointCondition", { text = "🐛", texthl = "", linehl = "", numhl = "" })
        -- vim.fn.sign_define("DapLogPoint", { text = "🇱", texthl = "", linehl = "", numhl = "" }) -- 
        vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
        -- vim.fn.sign_define("DapBreakpointRejected", { text = "⚠️", texthl = "", linehl = "", numhl = "" }) -- ✋

        local dap, widgets = require("dap"), require("dap.ui.widgets")
        local keymap, opts = vim.keymap.set, { noremap = true, silent = true }

        keymap("n", "<space>b", dap.toggle_breakpoint, opts)
        keymap("n", "<space>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, opts)
        keymap("n", "<space>lp", function()
            dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, opts)

        keymap({ "n", "i", "t" }, "<F5>", dap.continue, opts)
        keymap({ "n", "i", "t" }, "<F6>", dap.step_over, opts)
        keymap({ "n", "i", "t" }, "<F7>", dap.step_into, opts)
        keymap({ "n", "i", "t" }, "<F8>", dap.step_out, opts)
        keymap({ "n", "i", "t" }, "<F9>", dap.step_back, opts)
        keymap({ "n", "i", "t" }, "<F10>", dap.run_last, opts)
        keymap({ "n", "i", "t" }, "<F11>", dap.terminate, opts)
        keymap({ "n", "i", "t" }, "<leader>rtc", dap.run_to_cursor, opts)
        keymap("n", "<space>dr", dap.repl.open, opts)

        keymap("n", "<Leader>df", function()
            widgets.centered_float(widgets.frames)
        end)
        keymap("n", "<Leader>ds", function()
            widgets.centered_float(widgets.scopes)
        end)
        keymap("n", "<Leader>dx", function()
            widgets.centered_float(widgets.threads)
        end)
        keymap("n", "<Leader>de", function()
            widgets.centered_float(widgets.sessions)
        end)

        local dapui = require("dapui")
        -- 自动开启ui
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            vim.api.nvim_command("DapVirtualTextEnable")
            _G.dapui_for_K = true
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            vim.api.nvim_command("DapVirtualTextEnable")
            -- dapui.close()
            _G.dapui_for_K = false
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            vim.api.nvim_command("DapVirtualTextEnable")
            -- dapui.close()
            _G.dapui_for_K = false
        end
        dap.listeners.before.disconnect["dapui_config"] = function()
            vim.api.nvim_command("DapVirtualTextEnable")
            -- dapui.close()
            _G.dapui_for_K = false
        end

        -- dap.defaults.fallback.terminal_win_cmd = 'set splitright | 10vsplit new' -- this will be override by dapui
        -- dap.defaults.python.terminal_win_cmd = 'set splitright | 2vsplit new' -- 终端用dapui控制样式
        dap.defaults.fallback.focus_terminal = false
        dap.defaults.fallback.force_external_terminal = false
    end,
}
