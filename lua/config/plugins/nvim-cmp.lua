return {
	-- The main completion engine
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Source for Neovim's built-in LSP
		"L3MON4D3/LuaSnip", -- Snippet engine (required)
		"saadparwaiz1/cmp_luasnip" -- Snippet source for nvim-cmp
	}
}
