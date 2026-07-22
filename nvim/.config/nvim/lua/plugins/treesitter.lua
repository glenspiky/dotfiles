return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
			ensure_installed = {
				"go",
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"c",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
			},

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},
		})
	end,
}
