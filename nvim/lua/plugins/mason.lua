if vim.g.vscode then
  return {}
end

return {
  "williamboman/mason.nvim",
  config = function()
    require('mason').setup()
  end
}
