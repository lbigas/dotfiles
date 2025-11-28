if vim.g.vscode then
  return {}
end

return {
  "nvzone/typr",
  dependencies = "nvzone/volt",
  opts = {},
  cmd = { "Typr", "TyprStats" },
}
