return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ok, configs = pcall(require, "nvim-treesitter.configs")
			if ok then
				configs.setup({
					highlight = { enable = true },
					indent = { enable = true },
					auto_install = true,
				})
			end
		end,
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
}
