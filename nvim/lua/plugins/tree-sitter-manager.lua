if vim.g.vscode then
  return {}
end

return {
  "romus204/tree-sitter-manager.nvim",
  enabled = false,
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = {
        "c",
        "html",
        "css",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = true,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescriptreact", "javascriptreact" },
      callback = function(args)
        pcall(vim.treesitter.start, args.buf, "tsx")
      end,
      desc = "Use tsx parser for React filetypes",
    })
  end,
}
