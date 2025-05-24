if vim.g.vscode then
	return {}
end

return {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
