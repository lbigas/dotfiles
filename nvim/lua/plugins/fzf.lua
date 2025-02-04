return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  config = function()
    -- calling `setup` is optional for customization
    local builtin = require("fzf-lua")
    builtin.setup({})
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'fzf find git files' })
    vim.keymap.set('n', '<leader>pf', builtin.files, { desc = 'fzf find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'fzf live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'fzf buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.helptags, { desc = 'fzf help tags' })
  end
}
