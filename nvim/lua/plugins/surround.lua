return {
	"kylechui/nvim-surround",
	version = "^3.1.1", -- Use for stability; omit to use `main` branch for the latest features
	-- event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end
}
