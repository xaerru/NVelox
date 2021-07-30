local M = {}

local P = require("persistence")

function M.sload()
    require("telescope.builtin").find_files({
        prompt_title = "Sessions",
        cwd = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
        attach_mappings = function(prompt_bufnr, map)
            function load(close)
                local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
                if close then
                    require("telescope.actions").close(prompt_bufnr)
                end
                P.load({ last = content.value })
            end

            map("i", "<CR>", function()
                load(true)
            end)

            return true
        end,
    })
end

return M
