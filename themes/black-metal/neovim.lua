-- Base16 Black Metal (Gorgoroth) - Neovim Colorscheme
-- Scheme by metalelf0 (https://github.com/metalelf0)

-- Using lazy.nvim
return {
	"metalelf0/black-metal-theme-neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("black-metal").setup({
			-- optional configuration here
			theme = "gorgoroth",
		})
		require("black-metal").load()
	end,
}
