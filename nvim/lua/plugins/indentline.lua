if vim.g.vscode then
  return {}
end

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  enabled = false,
  opts = {},
  config = function ()
    require('ibl').setup()
  end
}
