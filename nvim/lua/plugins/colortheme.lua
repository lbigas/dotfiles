if vim.g.vscode then
  return {}
end

return ({
{
  "miikanissi/modus-themes.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme modus_vivendi]])
  end
},
{
	"rose-pine/neovim",
  enabled = false,
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
},
{
  "tpope/vim-vividchalk",
  enabled = false,
  config = function()
    vim.cmd("colorscheme vividchalk")
  end
},
{
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    vim.cmd[[colorscheme tokyonight]]
  end
},
{
  "catppuccin/nvim",
  enabled = true,
  name = "catppuccin",
  priority = 1000,
  config = function ()
    vim.cmd[[colorscheme catppuccin-mocha]]
  end
},
{
  "EdenEast/nightfox.nvim",
  enabled = false,
  priority = 1000,
  config = function ()
    vim.cmd[[colorscheme nightfox]]
  end
},
{
  "ellisonleao/gruvbox.nvim",
  enabled = false,
  priority = 1000 ,
  opts = {},
  config = function ()
    vim.cmd[[colorscheme gruvbox]]
  end
},
{
  "loctvl842/monokai-pro.nvim",
  enabled = false,
  priority = 1000 ,
  opts = {},
  config = function ()
    vim.cmd[[colorscheme monokai-pro]]
  end
},
{
  "shaunsingh/nord.nvim",
  enabled = false,
  priority = 1000,
  opts = {},
  config = function ()
    vim.cmd[[colorscheme nord]]
  end
},
{
  "navarasu/onedark.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme onedark]]
    -- require('onedark').setup({})
  end,
},
{
  "Mofiqul/dracula.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme dracula]]
  end
},
{
  "yorik1984/newpaper.nvim",
  enabled = false,
  priority = 1000,
  config = true,
},
{
  "rebelot/kanagawa.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme kanagawa-wave]]
  end,
},
{
  "bluz71/vim-moonfly-colors",
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme moonfly]]
  end,
},
  "neanias/everforest-nvim",
  enabled = false,
  priority = 1000,
  config = function()
    require("everforest").setup({
      -- Your config here
    })
  end,
})
