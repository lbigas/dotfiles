if vim.g.vscode then
  return {}
end

return {
  url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
  end,
}
