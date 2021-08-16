require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    -- Haskell is too slow
    ignore_installed = { "haskell" },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true },
    -- TODO seems to be broken
    autotag = { enable = true },
})
