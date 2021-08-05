-- TODO refactor all of this

local M = {}

local P = require("persistence")

local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function M.sload()
    local files = require("plenary.scandir").scan_dir(vim.fn.stdpath("data") .. "/sessions/")
    local sessions = {}
    local paths = {}
    for _, file in ipairs(files) do
        local f = vim.fn.fnamemodify(file, ":t")
        local q = f
        f = split(f, "%%")
        f = split(f[#f], ".")
        local t = {}
        for x = 1, #f - 1 do
            table.insert(t, f[x])
        end
        f = table.concat(t, ".")
        table.insert(paths, file)
        q = q:gsub("%%", "/")
        q = split(q, ".")
        table.remove(q, #q)
        q = table.concat(q, ".")
        local filetype = vim.fn.system("~/.config/nvim/lua/utils/mostUsed.sh " .. q)
        local icon = require("nvim-web-devicons").get_icon("a", filetype)
        table.insert(sessions, icon .. " " .. f)
    end
    local picker = pickers.new({
        prompt_title = "Sessions",
        finder = finders.new_table({
            results = sessions,
        }),
        sorter = conf.generic_sorter(),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local content = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd(":bufdo w | bd")
                print(vim.inspect(paths[content.index]))
                P.load(paths[content.index])
            end)

            return true
        end,
    })
    picker:find()
end

return M
