local M = {}

require("toggleterm").setup(require("_nvlx.utils").merge({
    size = 5,
    open_mapping = [[<F1>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1",
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "single",
        width = 150,
        height = 35,
        winblend = 25,
        highlights = {
            border = "FloatBorder",
            background = "Normal",
        },
    },
}, nvlx.config.plugins.toggleterm))

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
            winblend = 25,
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
            winblend = 25,
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
            winblend = 25,
        },
        close_on_exit = true,
    })
    run:toggle()
end

return M
