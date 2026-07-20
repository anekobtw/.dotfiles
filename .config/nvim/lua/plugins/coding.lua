return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"markdown",
					"python",
					"c",
					"cpp",
					"java",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			-- downloads a prebuilt binary or falls back to cargo build
			require("fff.download").download_or_build_binary()
		end,
		keys = {
			{
				"ff",
				function()
					require("fff").find_files()
				end,
				desc = "FFFind files",
			},
			{
				"fg",
				function()
					require("fff").live_grep()
				end,
				desc = "LiFFFe grep",
			},
			{
				"fw",
				function()
					require("fff").live_grep_under_cursor()
				end,
				mode = { "n", "x" },
				desc = "Search current word / selection",
			},
		},
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
}
