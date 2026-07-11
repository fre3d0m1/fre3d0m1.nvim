return {
	-- Bridges Mason with the built-in LSP
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
					"eslint",
				},
			})
		end,
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {}
			},
			{

				"neovim/nvim-lspconfig",
				config = function()
					vim.lsp.config("lua_ls", {
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
					vim.lsp.enable("lua_ls")
				end

			}
		}
	},
}
