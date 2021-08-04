local M = {}

require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = 5,
    open_mapping = [[<F1>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "single",
        width = 150,
        height = 35,
        --row = 0,
        --col = 0,
        winblend = 25,
        highlights = {
            border = "FloatBorder",
            background = "Normal",
        },
    },
})

local Terminal = require("toggleterm.terminal").Terminal

function M.lazygit()
    local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
    })
    lazygit:toggle()
end

function M.run_file()
    local run = Terminal:new({
        cmd = require("cmd").run_file_cmd(),
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
        cmd = require("cmd").run_project_cmd(),
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
        cmd = require("cmd").repl_cmd(),
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
