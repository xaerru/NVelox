local M = {}

M["nvim-autopairs"] = {
    check_ts = true,
    fast_wrap = {
        map = "<C-f>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        hightlight = "Search",
    },
}

M["Autosave.nvim"] = {
    execution_message = "",
}

M["bufferline.nvim"] = {
    options = {
        numbers = function(a)
            return a.raise(a.ordinal)
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count)
            return "(" .. count .. ")"
        end,
        offsets = { { filetype = "NvimTree", text_align = "left" } },
        show_buffer_close_icons = false,
        show_close_icon = false,
    },
    highlights = {
        background = { guibg = "#3B4252" },
        fill = { guibg = "#2E3440", guifg = "#D8DEE9" },
        separator = { guibg = "#3B4252", guifg = "#3B4252" },
        separator_selected = { guibg = "#2E3440", guifg = "#2E3440" },
        indicator_selected = { guibg = "#2E3440", guifg = "#2E3440" },
        modified = { guibg = "#3B4252" },
        diagnostic = { guibg = "#3B4252", guifg = "#5E687B" },
        warning = { guibg = "#3B4252" },
        warning_diagnostic = { guibg = "#3B4252", guifg = "#EBCB8B" },
        warning_diagnostic_selected = { guifg = "#EBCB8B" },
        error = { guibg = "#3B4252" },
        error_diagnostic = { guibg = "#3B4252", guifg = "#BF616A" },
        info = { guibg = "#3B4252" },
        info_diagnostic = { guibg = "#3B4252", guifg = "#5E687B" },
    },
}

M["nvim-compe"] = {
    source = {
        path = { kind = "   (Path)" },
        buffer = { kind = "   (Buffer)" },
        calc = { kind = "   (Calc)" },
        vsnip = { kind = "   (Snippet)" },
        nvim_lsp = { kind = "   (LSP)" },
        nvim_lua = { menu = "[]" },
        spell = { kind = "   (Spell)" },
        treesitter = false,
    },
}

local function vi_mode_provider()
    local mode_alias = {
        n = "NORMAL",
        no = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        c = "COMMAND",
        cv = "COMMAND",
        ce = "COMMAND",
        R = "REPLACE",
        Rv = "REPLACE",
        s = "SELECT",
        S = "SELECT",
        [""] = "SELECT",
        t = "TERMINAL",
    }
    return " " .. mode_alias[vim.fn.mode()]
end

local function vi_mode_hl()
    local vi_mode = require("feline.providers.vi_mode")
    return {
        name = vi_mode.get_mode_highlight_name(),
        fg = "bg",
        bg = vi_mode.get_mode_color(),
        style = "bold",
    }
end

M["feline.nvim"] = {
    preset = "noicon",
    colors = {
        fg = "#8FBCBB",
        bg = "#2E3440",
        black = "#434C5E",
        skyblue = "#81A1C1",
        cyan = "#88C0D0",
        green = "#A3BE8C",
        oceanblue = "#5E81AC",
        magenta = "#B48EAD",
        orange = "#D08770",
        red = "#BF616A",
        violet = "#B48EAD",
        white = "#D8DEE9",
        yellow = "#EBCB8B",
    },
    vi_mode_colors = {
        NORMAL = "cyan",
        OP = "cyan",
        INSERT = "green",
        VISUAL = "oceanblue",
        BLOCK = "oceanblue",
        REPLACE = "yellow",
        ["V-REPLACE"] = "yellow",
        ENTER = "cyan",
        MORE = "cyan",
        SELECT = "magenta",
        COMMAND = "cyan",
        SHELL = "oceanblue",
        TERM = "oceanblue",
        NONE = "orange",
    },
    components = {
        active = {
            {
                {
                    provider = vi_mode_provider,
                    hl = vi_mode_hl,
                },

                {
                    provider = "  ",
                    hl = function()
                        local vi_mode = require("feline.providers.vi_mode")
                        local t = {}
                        if vim.fn.isdirectory(".git") ~= nil then
                            t.bg = "skyblue"
                            t.fg = vi_mode.get_mode_color()
                        else
                            t.fg = vi_mode.get_mode_color()
                            t.bg = "bg"
                        end
                        return t
                    end,
                },

                {
                    provider = "git_branch",
                    icon = " ",
                    hl = { fg = "bg", bg = "skyblue" },
                },

                {
                    provider = "  ",
                    hl = { fg = "skyblue", bg = "bg" },
                    enabled = function()
                        return vim.fn.isdirectory(".git") ~= nil
                    end,
                },

                {
                    provider = "file_info",
                },

                {
                    provider = "  ",
                    hl = { fg = "bg" },
                },
            },
            {
                {
                    provider = "  ",
                    hl = { fg = "bg", bg = "bg" },
                },
                {
                    provider = "lsp_client_names",
                },
                {
                    provider = "  ",
                    hl = { fg = "skyblue", bg = "bg" },
                },
                {
                    provider = "position",
                    hl = { bg = "skyblue", fg = "bg" },
                },
                {
                    provider = "  ",
                    hl = function()
                        local vi_mode = require("feline.providers.vi_mode")
                        local t = {}
                        t.bg = "skyblue"
                        t.fg = vi_mode.get_mode_color()
                        return t
                    end,
                },
                {
                    provider = function()
                        return require("feline.providers.cursor").line_percentage() .. " "
                    end,
                    hl = vi_mode_hl,
                    style = "bold",
                },
            },
        },
        inactive = {
            {
                {
                    provider = "file_info",
                    left_sep = " ",
                },

                {
                    provider = "  ",
                    hl = { fg = "bg" },
                },
            },
            {
                {
                    provider = "  ",
                    hl = { fg = "skyblue", bg = "bg" },
                },
                {
                    provider = function()
                        return require("feline.providers.cursor").position() .. " "
                    end,
                    hl = { bg = "skyblue", fg = "bg" },
                },
            },
        },
    },
    force_inactive = {
        filetypes = {
            "NvimTree",
            "packer",
        },
        buftypes = { "terminal" },
        bufnames = {},
    },
}

M["gitsigns.nvim"] = {
    signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "契", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", linehl = "GitSignsChangeLn" },
    },
    keymaps = {
        noremap = true,
        ["n ]c"] = {
            expr = true,
            "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
        },
        ["n [c"] = {
            expr = true,
            "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
        },
        ["n <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["v <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ["n <leader>gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["v <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ["n <leader>gR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>gb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
        -- Text objects
        ["o ih"] = { silent = true, ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>' },
        ["x ih"] = { silent = true, ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>' },
    },
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
    },
}

M["indent-blankline.nvim"] = {
    filetype_exclude = { "help", "terminal", "dashboard", "packer" },
    buftype_exclude = { "terminal" },
}

M["persistence.nvim"] = { dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/") }

M["telescope.nvim"] = {
    defaults = {
        prompt_prefix = " ",
        selection_caret = "ﰲ ",
        winblend = nvlx.general.winblend,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        --mappings = {
        --n = {
        --["q"] = require("telescope.actions").close,
        --},
        --i = {
        --["<C-e>"] = require("telescope.actions").close,
        --},
        --},
    },
}

return M
