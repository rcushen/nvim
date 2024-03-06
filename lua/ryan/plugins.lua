return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons', },
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Copilot
    use { 'github/copilot.vim' }

    -- Color schemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'Mofiqul/dracula.nvim', as = 'dracula' }
    use { 'rose-pine/neovim' }
    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        as = "tokyonight"
    }

    -- Harpoon (file marks)
    use { "theprimeagen/harpoon" }

    -- Undo tree
    use { "mbbill/undotree" }

    -- Vim fugitive (git plugin)
    use { "tpope/vim-fugitive" }

    -- Lazygit integration
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
    },
})

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- Trouble (LSP diagnostics)
    use {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }

    -- Code folding
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async'
    }

    -- Indent lines
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Navigation
    use { 'ggandor/leap.nvim' }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Highlight trailing whitespace
    use { 'ntpeters/vim-better-whitespace' }

    -- Comment
    use { 'tpope/vim-commentary' }

    -- Maybes...
    -- vim-illuminate
    -- twilight
    -- noice
    -- zen-mode
    -- which-key

end)
