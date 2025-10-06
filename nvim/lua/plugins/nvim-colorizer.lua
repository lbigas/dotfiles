return {
  "catgoose/nvim-colorizer.lua",
  enabled = true,
  event = "BufReadPre",
  opts = { -- set to setup table
  },
  config = function ()
    require("colorizer").setup()
  end
}
