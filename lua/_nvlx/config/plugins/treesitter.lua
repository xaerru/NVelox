require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "fish",
        "haskell",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "python",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },
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
