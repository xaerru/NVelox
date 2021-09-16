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

require("feline").setup(require("_nvlx.utils").merge({
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
                    provider = " ",
                    hl = { bg = "skyblue", fg = "bg" },
                },
                {
                    provider = "position",
                    hl = { bg = "skyblue", fg = "bg" },
                },
                {
                    provider = " ",
                    hl = function()
                        local vi_mode = require("feline.providers.vi_mode")
                        local t = {}
                        t.fg = "skyblue"
                        t.bg = vi_mode.get_mode_color()
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
                    provider = " ",
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
}, nvlx.config.plugins.feline, nvlx.config.plugins_override.feline))
