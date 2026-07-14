if vim.g.vscode then
  return {}
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- blink.cmp replaces hrsh7th/nvim-cmp and cmp-nvim-lsp
    -- build step is recommended (blink ships a Rust binary)
    -- { 'saghen/blink.cmp', build = 'cargo build --release' },
    { 'saghen/blink.cmp', version = '1.*' },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  enabled = true,
  config = function()
    require('blink.cmp').setup({
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      keymap = {
        ['<C-k>'] = { 'show', 'select_prev', 'fallback' },
        ['<C-j>'] = { 'show', 'select_next', 'fallback' },
        ['<C-n>'] = { 'show' },
        ['<C-e>'] = { 'cancel' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
      },

      snippets = {
        preset = 'default',
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = { enabled = true },
      },
    })

    -- Apply Blink's completion capabilities to every LSP config before Mason enables servers.
    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
    })

    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'rust_analyzer', 'tsgo', 'eslint' },
      automatic_enable = { 'lua_ls', 'rust_analyzer', 'tsgo', 'eslint' },
    })

    -- === Inline diagnostics toggle (unchanged) ===
    if vim.g._diagnostics_virtual_text == nil then
      vim.g._diagnostics_virtual_text = false
    end

    vim.diagnostic.config({
      virtual_text = vim.g._diagnostics_virtual_text,
      severity_sort = true,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', '<leader>td', function()
          vim.g._diagnostics_virtual_text = not vim.g._diagnostics_virtual_text
          vim.diagnostic.config({
            virtual_text = vim.g._diagnostics_virtual_text,
          })
          if vim.g._diagnostics_virtual_text then
            vim.notify('Diagnostics inline: ON', vim.log.levels.INFO, { title = 'LSP' })
          else
            vim.notify('Diagnostics inline: OFF', vim.log.levels.INFO, { title = 'LSP' })
          end
        end, vim.tbl_extend('force', opts, { desc = 'Toggle inline diagnostics' }))
      end,
    })

  end
}
