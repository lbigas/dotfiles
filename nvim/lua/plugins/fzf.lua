return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  config = function()
    -- calling `setup` is optional for customization
    local builtin = require("fzf-lua")
    builtin.setup({})
    vim.keymap.set('n', '<leader>p', builtin.git_files, { desc = 'fzf find git files' })
    vim.keymap.set('n', '<leader>f', builtin.files, { desc = 'fzf find files' })
    vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'fzf live grep' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'fzf buffers' })
    vim.keymap.set('n', '<leader>h', builtin.helptags, { desc = 'fzf help tags' })
  end
}
