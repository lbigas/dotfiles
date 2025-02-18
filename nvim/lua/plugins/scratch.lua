return {
  "LintaoAmons/scratch.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
    vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")
  end
}
