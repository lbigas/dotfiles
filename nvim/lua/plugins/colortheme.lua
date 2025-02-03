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
  "shaunsingh/nord.nvim",
  enabled = false,
  config = function ()
    vim.cmd[[colorscheme nord]]
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
  enabled = false,
  name = "catppuccin",
  priority = 1000,
  config = function ()
    vim.cmd[[colorscheme catppuccin]]
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
  enabled = true,
  priority = 1000,
  opts = {},
  config = function ()
    vim.cmd[[colorscheme nord]]
  end
}
})
