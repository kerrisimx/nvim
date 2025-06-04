return {
	{
		-- "Shatur/neovim-ayu",
		-- "rose-pine/neovim",
		"rebelot/kanagawa.nvim",
		-- "adisen99/apprentice.nvim",
		-- lush is required by apprentice
		-- "rktjmp/lush.nvim",
		-- "Biscuit-Theme/nvim",
		-- as = "biscuit",
		-- "bettervim/yugen.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		-- load the colorscheme here
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
