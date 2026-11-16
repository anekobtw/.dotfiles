return {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_lua").lazy_load({
						paths = vim.fn.stdpath("config") .. "/lua/snippets",
					})
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Esc>"] = cmp.mapping.abort(),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{
						name = "buffer",
						keyword_length = 3,
						option = {
							get_bufnrs = function()
								local buf = vim.api.nvim_get_current_buf()
								return vim.b[buf].large_file and {} or { buf }
							end,
						},
					},
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
		end,
	},
	-- Capabilities must be advertised before an LSP client initializes.
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format file",
			},
		},
		opts = {
			formatters_by_ft = {
				bash = { "shfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
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
				java = { "google-java-format" },
			},
			default_format_opts = { lsp_format = "fallback", timeout_ms = 2000 },
			format_on_save = { lsp_format = "fallback", timeout_ms = 2000 },
		},
	},
}
