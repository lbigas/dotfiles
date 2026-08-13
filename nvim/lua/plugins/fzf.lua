if vim.g.vscode then
  return {}
end

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({})

    vim.keymap.set('n', '<leader>p', fzf.git_files, { desc = 'fzf find git files' })
    vim.keymap.set('n', '<leader>f', fzf.files, { desc = 'fzf find files' })
    vim.keymap.set('n', '<leader>g', fzf.live_grep, { desc = 'fzf live grep' })
    vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = 'fzf buffers' })
    vim.keymap.set('n', '<leader>h', fzf.helptags, { desc = 'fzf help tags' })
    vim.keymap.set('n', '<leader>ss', fzf.lsp_document_symbols, { desc = 'fzf document symbols' })
    vim.keymap.set('n', '<leader>sS', fzf.lsp_workspace_symbols, { desc = 'fzf workspace symbols' })
    vim.keymap.set('n', '<leader><leader>', fzf.oldfiles, { desc = 'fzf recent files' })
  end
}
