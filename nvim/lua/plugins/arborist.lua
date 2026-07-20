if vim.g.vscode then
  return {}
end

return {
  "arborist-ts/arborist.nvim",
  config = function()
    require("arborist").setup({
      ensure_installed = {
        "c",
        "html",
        "css",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
      },
    })
  end,
}
