if vim.g.vscode then
  return {}
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp', -- 👈 replaces cmp + cmp-nvim-lsp
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  },
  enabled = false,
  config = function()
    -- Setup blink
    require('blink.cmp').setup({
      keymap = {
        preset = 'default', -- you can also try 'super-tab'
        ['<C-k>'] = require('blink.keymaps').select_prev_item(),
        ['<C-j>'] = require('blink.keymaps').select_next_item(),
        ['<CR>'] = require('blink.keymaps').confirm_selection(),
        ['<C-Space>'] = require('blink.keymaps').complete(),
      },
      appearance = {
        use_nvim_cmp_as_default = true, -- makes UI similar to nvim-cmp
      },
    })

    -- Use blink’s provided capabilities instead of cmp-nvim-lsp
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'rust_analyzer', 'vtsls', 'eslint' },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities
          })
        end,
      },
    })

    -- Diagnostics toggle (same as before)
    if vim.g._diagnostics_virtual_text == nil then
      vim.g._diagnostics_virtual_text = true
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

        -- Toggle inline diagnostics
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
