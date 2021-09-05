local M = {}

local expand = vim.fn.expand
local file = expand("%:p") -- Absolute path to the file
local noext = expand("%:p:r") -- File path without extension
local path = expand("%:p:h") -- File path without the name
local name = expand("%:t:r") -- File name without the extension

function M.run_project_cmd()
    local cmd_table = {
        c = "make",
        rust = "cargo run",
    }
    return cmd_table[vim.fn.eval("&filetype")]
end

function M.run_file_cmd()
    local cmd_table = {
        c = "gcc " .. file .. " && " .. "./a.out" .. " && /bin/rm ./a.out",
        cpp = "g++ -std=c++17  " .. file .. " && " .. "./a.out" .. " && /bin/rm ./a.out",
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
        java = "java " .. file,
        javascript = "node " .. file,
        lua = "lua " .. file,
        perl = "perl " .. file,
        python = "python3 " .. file,
        ruby = "ruby " .. file,
        rust = "rustc " .. file .. " && ./" .. name .. "&& /bin/rm " .. name,
        sh = "bash " .. file,
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
    local cmd_table = {
        haskell = "ghci " .. file,
        java = "jshell",
        javascript = "node",
        lua = "lua",
        python = "python3",
        ruby = "irb",
    }
    return cmd_table[vim.fn.eval("&filetype")]
end

return M
