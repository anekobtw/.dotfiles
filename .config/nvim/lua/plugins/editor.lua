return {
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin-macchiato",
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
	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
	{
		"sethen/line-number-change-mode.nvim",
		dependencies = {
			"catppuccin/nvim",
		},
		config = function()
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
	},
}
