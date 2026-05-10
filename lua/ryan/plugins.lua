local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        lazyrepo, lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                             "WarningMsg" },
            { "\nPress any key to exit...",    "ErrorMsg" },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files() end },
            { "<leader>fg", function() require("telescope.builtin").live_grep() end },
            { "<leader>ft", function() require("telescope.builtin").git_files() end },
            { "<leader>fb", function() require("telescope.builtin").buffers() end },
            { "<leader>fh", function() require("telescope.builtin").help_tags() end },
        },
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh", "NvimTreeFindFile" },
        opts = {},
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "c", "lua", "vim", "vimdoc", "query",
                "python", "javascript", "typescript",
            })
        end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- Copilot (native Lua, integrates with nvim-cmp)
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },

    -- Zen mode
    { "folke/zen-mode.nvim", cmd = "ZenMode" },

    -- Color schemes
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    -- Harpoon (file marks) — harpoon2 branch
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>",     function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        end,
    },

    -- Undo tree
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle },
        },
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },

    -- Lazygit integration
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "LazyGit",
        keys = {
            { "<leader>gg", ":LazyGit<CR>" },
        },
    },

    -- LSP
    { "williamboman/mason.nvim" },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
    },
    { "neovim/nvim-lspconfig" },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "zbirenbaum/copilot-cmp",
        },
        config = function()
            require("ryan.lsp")
        end,
    },

    -- Trouble (LSP diagnostics)
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            { "<leader>xx", function() require("trouble").toggle("diagnostics") end },
            { "<leader>xw", function() require("trouble").toggle("diagnostics") end },
            { "<leader>xd", function() require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } }) end },
            { "<leader>xq", function() require("trouble").toggle("qflist") end },
            { "<leader>xl", function() require("trouble").toggle("loclist") end },
            { "gR",         function() require("trouble").toggle("lsp_references") end },
        },
        config = function()
            require("trouble").setup({
                keys = { q = "close" },
            })
        end,
    },

    -- Code folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldcolumn    = "1"
            vim.o.foldlevel     = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable    = true
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            require("ufo").setup()
        end,
    },

    -- Navigation (repo moved to Codeberg)
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    },

    -- Git signs
    { "lewis6991/gitsigns.nvim", opts = {} },

    -- Highlight trailing whitespace
    { "ntpeters/vim-better-whitespace" },

    -- Comment (treesitter-aware, replaces vim-commentary)
    { "numToStr/Comment.nvim", opts = {} },

    -- Auto-close brackets and quotes
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require("nvim-autopairs").setup()
            require("cmp").event:on(
                "confirm_done",
                require("nvim-autopairs.completion.cmp").on_confirm_done()
            )
        end,
    },

    -- Surround motions (ys, cs, ds)
    { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

    -- Keymap popup
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.add({
                { "<leader>f", group = "find" },
                { "<leader>g", group = "git" },
                { "<leader>s", group = "split" },
                { "<leader>v", group = "lsp" },
                { "<leader>x", group = "trouble" },
            })
        end,
    },

}, {
    checker = { enabled = true },
})
