return {
  "miikanissi/modus-themes.nvim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme modus_vivendi]])
  end
}
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine-main")
-- 	end
-- }
