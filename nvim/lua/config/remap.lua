vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<esc>", ":noh <CR>") -- clear last search highlight

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "Go to Left Window", remap = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "Go to Lower Window", remap = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "Go to Upper Window", remap = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "Go to Right Window", remap = true})

-- terminal
vim.keymap.set('n', '<leader>t', ':terminal<CR>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
