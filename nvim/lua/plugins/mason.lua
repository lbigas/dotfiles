if vim.g.vscode then
  return {}
end

return {
  "williamboman/mason.nvim",
  version = "1.11.0",
  config = function()
    require('mason').setup()
  end
}
