vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

vim.opt.updatetime = 50

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes' -- leave space for the gutter
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono NL:h12"

  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_theme = "auto"
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_confirm_quit = true
end
