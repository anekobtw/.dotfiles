require("config.large-file")
require("config.lazy")

-- BASIC
vim.g.mapleader = " "

vim.opt.guicursor = "n-v-c-i:block"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 8
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noselect"
vim.opt.undofile = true
vim.opt.timeoutlen = 300
vim.opt.showmode = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd.colorscheme("rose-pine-main")

-- KEYMAPS
vim.keymap.set({ "n", "i" }, "<C-s>", function()
	if vim.bo.modifiable then
		vim.cmd.write()
	end
end, { silent = true })

vim.keymap.set("n", "<leader>p", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- MASON, LSP, CMP
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"cssls",
		"dockerls",
		"html",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"rust_analyzer",
		"ts_ls",
		"yamlls",
		"jdtls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"black",
		"clang-format",
		"isort",
		"prettierd",
		"shfmt",
		"stylua",
		"jdtls",
		"google-java-format",
		"java-test",
	},
	auto_update = false,
	run_on_start = true,
})

local on_attach = function(client, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	map("gd", vim.lsp.buf.definition, "Go to definition")
	map("gr", vim.lsp.buf.references, "Go to references")
	map("K", vim.lsp.buf.hover, "Hover documentation")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", { capabilities = capabilities, on_attach = on_attach })

vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

