return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
          'nvim-tree/nvim-tree.lua',
          requires = {
        	  'nvim-tree/nvim-web-devicons',
          },
  }

  use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {'github/copilot.vim', branch = 'release' }

  use { "catppuccin/nvim", as = "catppuccin" }
  use {
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
  }
  
  use { "theprimeagen/harpoon" }

  use { "mbbill/undotree" }

  use { "tpope/vim-fugitive" }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use {
	  "folke/trouble.nvim",
	  dependencies = { "nvim-tree/nvim-web-devicons" },
  }

end)

