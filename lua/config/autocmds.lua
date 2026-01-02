-- 通用自动命令配置
-- 职责：集中管理高频通用自动命令（yank 高亮、恢复光标位置、q 关闭等）
local function augroup(name)
  return vim.api.nvim_create_augroup("nde_" .. name, { clear = true })
end

-- 拷贝后短暂高亮，便于确认 yank 范围
-- 详见 `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup("highlight_yank"),
  pattern = "*",
})

-- 打开缓冲区时自动跳转到上次关闭时的光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 某些“只读窗口”统一用 q 关闭，并从 buffer 列表中隐藏
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "OverseerForm",
    "OverseerList",
    "checkhealth",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
    "neoai-input",
    "neoai-output",
    "notify",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = augroup("auto_format_options"),
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})
