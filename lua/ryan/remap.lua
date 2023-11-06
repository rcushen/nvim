vim.keymap.set({'n', 'v', 'x'}, 'j', 'h')
vim.keymap.set({'n', 'v', 'x'}, 'k', 'j')
vim.keymap.set({'n', 'v', 'x'}, 'l', 'k')
vim.keymap.set({'n', 'v', 'x'}, ';', 'l')

vim.g.mapleader = " "

vim.keymap.set("n", "<leader> ", vim.cmd.noh)

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff = 8

vim.keymap.set('n', '<Tab>', vim.cmd.bn)
vim.keymap.set('n', '<S-Tab>', vim.cmd.bp)
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)

vim.keymap.set('n', '<C-w>j', '<C-w>h')
vim.keymap.set('n', '<C-w>k', '<C-w>j')
vim.keymap.set('n', '<C-w>l', '<C-w>k')
vim.keymap.set('n', '<C-w>;', '<C-w>l')

vim.keymap.set('v', 'K', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'L', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set({'n', 'v'}, '<leader>y', "\"+y")
vim.keymap.set({'n', 'v'}, '<leader>Y', "\"+Y")

vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)
