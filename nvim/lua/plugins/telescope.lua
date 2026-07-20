if vim.g.vscode then
  return {}
end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'smartpde/telescope-recent-files',
    'nvim-telescope/telescope-frecency.nvim'
  },
  enabled = true,
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>p', builtin.git_files, { desc = 'Telescope find git files' })
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = 'Telescope document symbols' })
    vim.keymap.set('n', '<leader>sS', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope workspace symbols' })
    -- vim.keymap.set('n', '<leader>ps', function()
    --   builtin.grep_string({ search = vim.fn.input("Grep > ") })
    -- end)
    -- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    local telescope = require('telescope')

    telescope.load_extension 'frecency'

    vim.api.nvim_set_keymap("n", "<Leader><Leader>", [[<cmd> Telescope frecency<CR>]], {noremap = true, silent = true})

    -- vim.api.nvim_set_keymap("n", "<Leader><Leader>",
    -- [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
    -- {noremap = true, silent = true})
  end
}
