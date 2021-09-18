local M = {}

local Terminal = require("toggleterm.terminal").Terminal

function M.lazygit()
    local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
    })
    vim.cmd("silent! wa!")
    lazygit:toggle()
end

function M.run_file()
    local run = Terminal:new({
        cmd = require("_nvlx.cmd").run_file_cmd(),
        hidden = true,
        float_opts = {
            width = 80,
            height = 35,
            row = (vim.fn.eval("&lines") - 35) / 2,
            col = vim.fn.eval("&columns"),
            winblend = nvlx.general.winblend,
        },
        close_on_exit = false,
    })
    run:toggle()
end

function M.run_project()
    local run = Terminal:new({
        cmd = require("_nvlx.cmd").run_project_cmd(),
        hidden = true,
        float_opts = {
            width = 80,
            height = 35,
            row = (vim.fn.eval("&lines") - 35) / 2,
            col = vim.fn.eval("&columns"),
            winblend = nvlx.general.winblend,
        },
        close_on_exit = false,
    })
    run:toggle()
end

function M.run_repl()
    local run = Terminal:new({
        cmd = require("_nvlx.cmd").repl_cmd(),
        hidden = true,
        float_opts = {
            width = 80,
            height = 35,
            row = (vim.fn.eval("&lines") - 35) / 2,
            col = vim.fn.eval("&columns"),
            winblend = nvlx.general.winblend,
        },
        close_on_exit = true,
    })
    run:toggle()
end

return M
