local M = {}

function M.load(configurations, disabled)
    local fn = vim.fn

    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        vim.cmd("packadd packer.nvim")
    end

    local packer = require("packer")
    local util = require("packer.util")

    packer.init({
        package_root = util.join_paths(fn.stdpath("data") .. "/site/pack/"),
        compile_path = util.join_paths("~/.config/nvim", "plugin", "packer_compiled.lua"),
        git = {
            clone_timeout = 300,
        },
        display = {
            open_fn = function()
                return util.float({ border = "single" })
            end,
        },
        luarocks = {
            python_cmd = "python3",
        },
    })

    packer.startup(function(use)
        for _, plugins in ipairs(configurations) do
            for _, plugin in ipairs(plugins) do
                if vim.tbl_contains(disabled, plugin[1]) == false then
                    use(plugin)
                end
            end
        end
    end)
end

return M
