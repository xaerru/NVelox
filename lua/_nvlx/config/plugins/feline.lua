local function percentage_provider()
    local cursor = require("feline.providers.cursor")
    return cursor.line_percentage() .. " "
end

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
    return " " .. mode_alias[vim.fn.mode()] .. "  "
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

require("feline").setup({
    preset = "noicon",
    default_fg = "#8FBCBB",
    default_bg = "#2E3440",
    colors = {
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
        VISUAL = "skyblue",
        BLOCK = "skyblue",
        REPLACE = "yellow",
        ["V-REPLACE"] = "yellow",
        ENTER = "cyan",
        MORE = "cyan",
        SELECT = "magenta",
        COMMAND = "cyan",
        SHELL = "skyblue",
        TERM = "skyblue",
        NONE = "orange",
    },
    components = {
        left = {
            active = {
                { provider = vi_mode_provider, hl = vi_mode_hl, right_sep = " " },
                {
                    provider = "git_branch",
                    icon = " ",
                    right_sep = "  ",
                    enabled = function()
                        return vim.b.gitsigns_status_dict ~= nil
                    end,
                },
                { provider = "file_info" },
                { provider = "  ", hl = { fg = "bg" } },
            },
        },
        right = {
            active = {
                { provider = "  ", hl = { fg = "bg", bg = "bg" } },
                { provider = "file_encoding" },
                { provider = "  ", hl = { fg = "skyblue", bg = "bg" } },
                { provider = "position", hl = {bg = "skyblue", fg = "bg"} },
                { provider = "  ", hl = { fg = "fg", bg = "skyblue" } },
                {
                    provider = percentage_provider,
                    hl = vi_mode_hl,
                    style = "bold",
                },
            },
        },
    },
})
