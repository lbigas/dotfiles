if vim.g.vscode then
  return {}
end

return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require("leap")
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
  end,
}
