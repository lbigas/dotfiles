if vim.g.vscode then
  return {}
end

return {
  "folke/snacks.nvim",
  -- optional for icon support (like your old config)
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  config = function()
    -- basic setup (picker is enabled by default, but explicit is fine)
    require("snacks").setup({
      picker = { enabled = true },
    })

    local Snacks = require("snacks")

    -- keep the same mappings you had for fzf-lua
    vim.keymap.set("n", "<leader>p", function() Snacks.picker.git_files() end, { desc = "snacks: git files" })
    vim.keymap.set("n", "<leader>f", function() Snacks.picker.files() end, { desc = "snacks: find files" })
    -- grep = live grep; snacks' grep supports a `live = true` option (live sends queries to rg).
    -- If you prefer non-live fuzzy behaviour, remove the `{ live = true }` table.
    vim.keymap.set("n", "<leader>g", function() Snacks.picker.grep({ live = true }) end, { desc = "snacks: live grep" })
    vim.keymap.set("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "snacks: buffers" })
    vim.keymap.set("n", "<leader>h", function() Snacks.picker.help() end, { desc = "snacks: help tags" })
  end,
}
