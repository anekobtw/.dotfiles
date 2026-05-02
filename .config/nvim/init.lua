require("config.lazy")

-- ========= BASIC OPTIONS =========
vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noselect"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd.colorscheme("catppuccin")

-- ========= KEYMAPS =========
vim.keymap.set({ "n", "i" }, "<C-s>", function()
	if vim.bo.modifiable then
		vim.cmd.write()
	end
end, { silent = true })

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- ========= STATUSLINE =========
require("lualine").setup({
	options = { theme = "catppuccin-macchiato" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {
			function()
				return " " .. os.date("%I:%M %p")
			end,
		},
		lualine_z = { "location" },
	},
})

-- ========= FILE TREE =========
require("nvim-tree").setup({
	view = { width = 15 },
})

-- ========= MASON =========
require("mason").setup()
local servers = {
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
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local tools = {
	"black",
	"clang-format",
	"isort",
	"prettierd",
	"shfmt",
	"stylua",
}

require("mason-tool-installer").setup({
	ensure_installed = tools,
	auto_update = false,
	run_on_start = true,
})

-- ========= LSP + CMP =========
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
	vim.lsp.enable(server)
end

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

-- ========= AUTOCOMPLETE =========
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})

-- ========= FORMATTER =========
local formatters_by_ft = {
	bash = { "shfmt" },
	c = { "clang-format" },
	cpp = { "clang-format" },
	lua = { "stylua" },
	markdown = { "prettierd", "prettier" },
	python = { "black", "isort" },
	rust = { "rustfmt" },
	javascript = { "prettier" },
	typescript = { "prettier" },
  typescriptreact = { "prettier" },
  javascriptreact = { "prettier" },
	html = { "prettier" },
	css = { "prettier" },
	json = { "prettier" },
	yaml = { "prettier" },
}

require("conform").setup({
	formatters_by_ft = formatters_by_ft,
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format file" })

-- ========= LINE NUMBER COLORS =========
local palette = require("catppuccin.palettes").get_palette()

require("line-number-change-mode").setup({
	mode = {
		n = { fg = palette.blue },
		i = { fg = palette.green },
		v = { fg = palette.mauve },
		V = { fg = palette.mauve },
		R = { fg = palette.maroon },
	},
})

-- ========= SNIPPETS =========
require("luasnip.loaders.from_lua").load({
  paths = "~/.config/nvim/lua/snippets"
})
