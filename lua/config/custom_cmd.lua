-- 自定义命令配置
-- 职责：集中管理少量常用命令（内容提取 / 保存退出 / 打开 Obsidian 等）

-- ExtractMatches: 从当前 buffer 中按给定模式提取内容到目标文件
local function extract_matches_to_file(args)
  -- 将传入的参数字符串拆分成模式和文件名
  local pattern, filename = args:match("(%S+)%s+(%S+)")
  if not pattern or not filename then
    vim.api.nvim_err_writeln("参数错误：需要提供模式和文件名")
    return
  end

  -- 获取当前缓冲区的内容
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- 打开文件进行写入
  local file = io.open(filename, "w")
  if not file then
    vim.api.nvim_err_writeln("无法打开文件: " .. filename)
    return
  end

  -- 匹配并提取内容
  for _, line in ipairs(lines) do
    local match = line:match(pattern)
    if match then
      file:write(match .. "\n")
    end
  end

  -- 关闭文件
  file:close()

  -- 输出提示信息
  vim.api.nvim_out_write("Matches written to " .. filename .. "\n")
end

-- 注册命令：提取匹配内容
vim.cmd([[
    command! -nargs=+ ExtractMatches lua require('config.custom_cmd').extract_matches_to_file(<q-args>)
]])

vim.cmd([[
  command! SaveAndQuit execute 'SessionSave' | wqall
]])

--command! CopyBuffer let @+ = expand('%:p') <Leader>cfp

vim.cmd([[
  command! CopyBufferFullPath
    \ let full_path = expand('%:p') |
    \ let @+ = full_path |
    \ echo 'Copied ' . full_path
]])

vim.cmd([[
  command! OpenInObsidian
    \ let full_path = expand('%:p') |
    \ let parts = split(full_path, '/') |
    \ let vault_name = parts[3] |
    \ let file_path = join(parts[4:], '/') |
    \ let obsidian_path = 'obsidian://open?vault=' . vault_name . '&file=' . file_path |
    \ let command = 'open ' . shellescape(obsidian_path) |
    \ call system(command) |
    \ echo 'Opened ' . obsidian_path
]])

return {
  extract_matches_to_file = extract_matches_to_file,
}
