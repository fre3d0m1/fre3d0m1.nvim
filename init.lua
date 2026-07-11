require("akita")
require("config.lazy")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "pyright" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_after_save = {
		async = true,
		lsp_format = "fallback",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
vim.lsp.config('gdscript', {
	capabilities = capabilities
})
vim.lsp.enable('gdscript')

local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
if gdproject then
	io.close(gdproject)
	pcall(vim.fn.serverstart, '127.0.0.1:6004')
end

vim.opt.swapfile = false
