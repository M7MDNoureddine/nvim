return {
	-- Tree-sitter for better syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { "lua", "python","c_sharp", "c", "cpp", "javascript" },  -- list of languages you want to install
				highlight = {
					enable = true,              -- false will disable the whole extension
					additional_vim_regex_highlighting = false,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25,
					persist_queries = false,
				},
			})
		end
	},
	{
		'nvim-treesitter/playground',
		cmd = 'TSPlaygroundToggle', -- Load only when this command is called
	},



}

