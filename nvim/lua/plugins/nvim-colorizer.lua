if vim.g.vscode then
  return {}
end

return {
  "catgoose/nvim-colorizer.lua",
  enabled = false,
  event = "BufReadPre",
  opts = { -- set to setup table
  },
  config = function ()
    require("colorizer").setup()
  end
}
