if vim.g.vscode then
  return {}
end

return {
  'echasnovski/mini.bufremove',
  version = '*',
  keys = {
    {
      '<leader>bd',
      function()
        require('mini.bufremove').delete(0, false)
      end,
      desc = 'Delete buffer',
    },
  },
  opts = {},
}
