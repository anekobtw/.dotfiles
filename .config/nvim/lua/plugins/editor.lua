return {
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "rose-pine",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = {},
					lualine_y = {
						function()
							return os.date("%I:%M %p")
						end,
					},
					lualine_z = { "location" },
				},
			})
		end,
	},
	{
		"sethen/line-number-change-mode.nvim",
		dependencies = {
			"rose-pine",
		},
		config = function()
			local palette = require("rose-pine.palette")

			require("line-number-change-mode").setup({
				mode = {
					n = { fg = palette.foam },
					i = { fg = palette.pine },
					v = { fg = palette.iris },
					V = { fg = palette.iris },
					R = { fg = palette.love },
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		opts = {
			indent = { char = "|" },
			scope = { enabled = false },
		},
		config = function(_, opts)
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.ACTIVE, function(buf)
				return not vim.b[buf].large_file
			end)
			require("ibl").setup(opts)
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		opts = {},
	},
}
