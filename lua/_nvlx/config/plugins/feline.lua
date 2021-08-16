local function percentage_provider()
    local cursor = require("feline.providers.cursor")
    return " " .. cursor.line_percentage() .. " "
end

local  function vi_mode_provider()
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

require("feline").setup({
    preset = "noicon",
    default_fg = "#8FBCBB",
    default_bg = "#2E3440",
    colors = {
        black = "#434C5E",
        skyblue = "#81A1C1",
        cyan = "#88C0D0",
        green = "#8FBCBB",
        oceanblue = "#5E81AC",
        magenta = "#B48EAD",
        orange = "#D08770",
        red = "#EC5F67",
        violet = "#B48EAD",
        white = "#ECEFF4",
        yellow = "#EBCB8B",
    },
    vi_mode_colors = {
        NORMAL = "cyan",
        OP = "cyan",
        INSERT = "green",
        VISUAL = "blue",
        BLOCK = "green",
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
                { provider = vi_mode_provider, hl = { fg = "bg", bg = "cyan" }, right_sep = " " },
                {
                    provider = "git_branch",
                    icon = "  ",
                    right_sep = "  ",
                    enabled = function()
                        return vim.b.gitsigns_status_dict ~= nil
                    end,
                },
                { provider = "file_info" },
                { provider = "", hl = { fg = "bg", bg = "black" } },
            },
        },
        right = {
            active = {
                { provider = "  " , hl = { fg = "bg", bg = "black" } },
                { provider = "file_encoding" },
                { provider = "position", left_sep = " ", right_sep = " " },
                {
                    provider = percentage_provider,
                    hl = { fg = "bg", bg = "cyan" },
                    style = "bold",
                },
            },
        },
    },
})
