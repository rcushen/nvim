# Neovim Config Reference

> **Leader key:** `<Space>`

---

## Motion

Keys are remapped from the standard hjkl layout.

| Key | Action |
|-----|--------|
| `j` | Left |
| `k` | Down |
| `l` | Up |
| `;` | Right |
| `<C-d>` | Scroll down half-page (cursor stays centred) |
| `<C-u>` | Scroll up half-page (cursor stays centred) |

### Window focus

| Key | Action |
|-----|--------|
| `<C-w>j` | Focus window left |
| `<C-w>k` | Focus window down |
| `<C-w>l` | Focus window up |
| `<C-w>;` | Focus window right |

---

## Leap

| Key | Action |
|-----|--------|
| `s` | Leap forward |
| `S` | Leap backward / from other windows |

---

## Files & Buffers

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (respects .gitignore) |
| `<leader>fg` | Live grep across project |
| `<leader>ft` | Git files |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to harpoon list |
| `<C-e>` | Toggle harpoon menu |
| `<leader>1–4` | Jump to mark 1–4 |

### Buffers

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>w` | Write buffer |
| `<leader>q` | Close buffer |
| `<leader>Q` | Quit all |

---

## File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `<C-n>` | Toggle tree |
| `<leader>e` | Focus tree |
| `<leader>fe` | Reveal current file in tree |
| `<leader>r` | Refresh tree |

---

## Editing

### General

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer (LSP) |
| `<leader>y` | Yank selection to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader><Space>` | Clear search highlights |

### Visual mode

| Key | Action |
|-----|--------|
| `K` | Move selected lines down |
| `L` | Move selected lines up |

### Splits

| Key | Action |
|-----|--------|
| `<leader>sh` | Horizontal split |
| `<leader>sv` | Vertical split |

### Comment.nvim

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc` | Visual | Toggle line comment on selection |
| `gb` | Visual | Toggle block comment on selection |

### nvim-surround

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround — e.g. `ysiw"` wraps word in `"` |
| `yss{char}` | Surround entire line |
| `cs{old}{new}` | Change surround — e.g. `cs"'` changes `"` to `'` |
| `ds{char}` | Delete surround — e.g. `ds(` removes `()` |
| `S{char}` | (Visual) Surround selection |

---

## LSP

Keymaps activate when a language server attaches to a buffer.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<C-h>` (insert) | Signature help |
| `<leader>vd` | Open diagnostics float |
| `[d` | Next diagnostic |
| `]d` | Previous diagnostic |
| `<leader>vca` | Code actions |
| `<leader>vrn` | Rename symbol |
| `<leader>vrr` | References |
| `<leader>vws` | Workspace symbols |

---

## Diagnostics — Trouble

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle workspace diagnostics |
| `<leader>xw` | Toggle workspace diagnostics |
| `<leader>xd` | Toggle document diagnostics |
| `<leader>xq` | Toggle quickfix list |
| `<leader>xl` | Toggle location list |
| `gR` | LSP references |

---

## Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open lazygit |

Gitsigns runs automatically and shows add/change/delete indicators in the gutter. No keymaps configured — use lazygit for all git operations.

---

## Folds (nvim-ufo)

| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zo` | Open fold under cursor |
| `zc` | Close fold under cursor |

---

## Utilities

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undotree |
| `<leader>z` | Toggle zen mode |

---

## Commands

| Command | Action |
|---------|--------|
| `:StripWhitespace` | Remove trailing whitespace from buffer |
| `:Mason` | Open Mason to install/manage LSP servers and linters |
| `:Lazy` | Open lazy.nvim plugin manager |
| `:Copilot auth` | Authenticate GitHub Copilot |
| `:TSUpdate` | Update treesitter parsers |
| `:checkhealth` | Diagnose config and plugin issues |
