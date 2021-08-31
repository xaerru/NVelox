require("nvim-treesitter.configs").setup(require("_nvlx.utils").merge({
    ensure_installed = "maintained",
    -- Haskell is too slow
    ignore_installed = { "haskell" },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    autopairs = {
        enable = true,
    },
}, nvlx.config.plugins.treesitter, nvlx.config.plugins_override.treesitter))
