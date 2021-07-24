require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"rust",
		"python",
		"lua",
		"yaml",
		"bash",
		"fish",
		"tsx",
		"javascript",
		"json",
		"haskell",
		"typescript",
		"toml",
		"html",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = { enable = true },
	-- TODO seems to be broken
	autotag = { enable = true },
})
