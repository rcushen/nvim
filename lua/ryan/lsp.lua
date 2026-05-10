local capabilities = vim.tbl_deep_extend("force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities(),
    {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            },
        },
    }
)

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("ryan_lsp_keymaps", { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }
        vim.keymap.set("n", "gd",           vim.lsp.buf.definition,       opts)
        vim.keymap.set("n", "K",            vim.lsp.buf.hover,            opts)
        vim.keymap.set("n", "<leader>vws",  vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd",   vim.diagnostic.open_float,    opts)
        vim.keymap.set("n", "[d",           vim.diagnostic.goto_next,     opts)
        vim.keymap.set("n", "]d",           vim.diagnostic.goto_prev,     opts)
        vim.keymap.set("n", "<leader>vca",  vim.lsp.buf.code_action,      opts)
        vim.keymap.set("n", "<leader>vrr",  vim.lsp.buf.references,       opts)
        vim.keymap.set("n", "<leader>vrn",  vim.lsp.buf.rename,           opts)
        vim.keymap.set("i", "<C-h>",        vim.lsp.buf.signature_help,   opts)
    end,
})

require("mason").setup()
require("mason-lspconfig").setup({ automatic_enable = true })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"]     = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"]     = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"]     = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})
