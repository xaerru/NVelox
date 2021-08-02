local M = {}

function M.run_cmd()
    local expand = vim.fn.expand
    local file = expand("%:p") -- Absolute path to the file
    local noext = expand("%:p:r") -- File path without extension
    local path = expand("%:p:h") -- File path without the name
    local name = expand("%:t:r") -- File name without the extension
    local cmd_table = {
        python = "python3 " .. file,
        c = "gcc " .. file .. ' && ' .. './a.out' .. ' && /bin/rm ./a.out',
        cpp = "g++ -std=c++17  " .. file .. ' && ' .. './a.out' .. ' && /bin/rm ./a.out',
    }
    return cmd_table[vim.fn.eval("&filetype")]
end

function M.repl_cmd()
    local expand = vim.fn.expand
    local file = expand("%:p") -- Absolute path to the file
    local noext = expand("%:p:r") -- File path without extension
    local path = expand("%:p:h") -- File path without the name
    local name = expand("%:t:r") -- File name without the extension
    local cmd_table = {
        python = "python3",
    }
    return cmd_table[vim.fn.eval("&filetype")]
end

return M
