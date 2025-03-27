return {
  enabled = false,
  'maan2003/lsp_lines.nvim',
  config = function ()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_lines = true })
    vim.diagnostic.config({
      virtual_text = false,
    })
    vim.keymap.set(
    "",
    "<Leader>l",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
    )
  end
}
