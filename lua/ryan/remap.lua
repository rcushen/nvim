vim.g.mapleader = " "

-- Remap the navigation keys to my preference
vim.keymap.set({ 'n', 'v', 'x' }, 'j', 'h')
vim.keymap.set({ 'n', 'v', 'x' }, 'k', 'j')
vim.keymap.set({ 'n', 'v', 'x' }, 'l', 'k')
vim.keymap.set({ 'n', 'v', 'x' }, ';', 'l')

-- Double space clears highlights
vim.keymap.set("n", "<leader> ", vim.cmd.noh)

-- NvimTree commands
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>r", vim.cmd.NvimTreeRefresh)
vim.keymap.set("n", "<leader>fe", vim.cmd.NvimTreeFindFile)

-- Set numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- Set tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Set some buffer commands
vim.keymap.set('n', '<Tab>', vim.cmd.bn)
vim.keymap.set('n', '<S-Tab>', vim.cmd.bp)
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)
vim.keymap.set('n', '<leader>Q', function() vim.cmd('qa!') end)
vim.keymap.set('n', '<leader>w', function() vim.cmd('w') end)

-- Remap the window change commands to mine
vim.keymap.set('n', '<C-w>j', '<C-w>h')
vim.keymap.set('n', '<C-w>k', '<C-w>j')
vim.keymap.set('n', '<C-w>l', '<C-w>k')
vim.keymap.set('n', '<C-w>;', '<C-w>l')

-- Allow moving selected lines
vim.keymap.set('v', 'K', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'L', ":m '<-2<CR>gv=gv")

-- Keep the cursor centered when moving up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Shortcuts for yanking to the system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', "\"+y")
vim.keymap.set({ 'n', 'v' }, '<leader>Y', "\"+Y")

-- Format the buffer
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)

-- Create quick commands for splits
vim.keymap.set('n', '<leader>sh', ':split<CR>')
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>')

-- Set vertical column
-- vim.opt.colorcolumn = "80,120"
