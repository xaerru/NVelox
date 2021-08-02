local M = {}

function M.run_cmd()
    local expand = vim.fn.expand
    local file = expand("%:p") -- Absolute path to the file
    local noext = expand("%:p:r") -- File path without extension
    local path = expand("%:p:h") -- File path without the name
    local name = expand("%:t:r") -- File name without the extension
    local cmd_table = {
        python = "python3 " .. file,
        c = "gcc " .. file .. " && " .. "./a.out" .. " && /bin/rm ./a.out",
        cpp = "g++ -std=c++17  " .. file .. " && " .. "./a.out" .. " && /bin/rm ./a.out",
        rust = "rustc " .. file .. " && ./" .. name .. "&& /bin/rm " .. name,
        haskell = "ghc -dynamic "
            .. file
            .. " && ./"
            .. name
            .. "&& /bin/rm "
            .. name
            .. " "
            .. name
            .. ".hi "
            .. name
            .. ".o",
        lua = "lua " .. file,
        sh = "bash " .. file,
        perl = "perl " .. file,
        ruby = "ruby " .. file,
        javascript = "node " .. file,
        typescript = "tsc "
            .. file
            .. "&& node "
            .. noext
            .. ".js"
            .. "&& /bin/rm "
            .. noext
            .. ".js",
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
