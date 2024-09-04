-- 提取匹配的内容到文件
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
    local file = io.open(filename, 'w')
    if not file then
        vim.api.nvim_err_writeln("无法打开文件: " .. filename)
        return
    end

    -- 匹配并提取内容
    for _, line in ipairs(lines) do
        local match = line:match(pattern)
        if match then
            file:write(match .. '\n')
        end
    end

    -- 关闭文件
    file:close()

    -- 输出提示信息
    vim.api.nvim_out_write("Matches written to " .. filename .. "\n")
end

-- 注册命令
vim.cmd([[
    command! -nargs=+ ExtractMatches lua require('base.match_out_file').extract_matches_to_file(<q-args>)
]])

