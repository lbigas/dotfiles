if vim.g.vscode then
  return {}
end

return {}

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    -- Replace 'hrsh7th/nvim-cmp' with 'blink-dot-nvim/blink.nvim'
    'blink-dot-nvim/blink.nvim', -- The new completion plugin
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  },
  enabled = false,
  config = function()
    -- Capabilities are still needed for LSP
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'rust_analyzer', 'tsgo', 'eslint' },
      handlers = {

        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities
          })
        end,

        -- Custom setup for Gleam
        ['gleam'] = function()
          require('lspconfig').gleam.setup({
            capabilities = capabilities
          })
        end,

        -- Custom setup for OCaml
        ['ocamllsp'] = function()
          require('lspconfig').ocamllsp.setup({
            capabilities = capabilities
          })
        end,

      },
    })

    -- === Inline diagnostics toggle ===
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

    --- Blink configuration to replace nvim-cmp setup ---
    local blink = require('blink')

    blink.setup({
      -- Sources configuration. nvim-lsp is the LSP source.
      sources = {
        'nvim_lsp',
      },
      -- Keybindings. Blink uses different mappings for selection/confirm by default.
      -- Re-mapping to match your previous nvim-cmp configuration:
      mapping = {
        ['<C-k>'] = blink.select_prev_item, -- Select previous item
        ['<C-j>'] = blink.select_next_item, -- Select next item
        ['<C-b>'] = blink.scroll_docs(-4), -- Scroll docs up
        ['<C-f>'] = blink.scroll_docs(4),  -- Scroll docs down
        ['<C-Space>'] = blink.complete,    -- Start completion
        ['<C-e>'] = blink.abort,           -- Abort completion
        ['<CR>'] = blink.confirm({ select = true }), -- Confirm selection
      },
      -- Blink uses vim.snippet by default, so no custom expand function is necessary.
      snippet = {
        enabled = true,
      }
    })
    -------------------------------------------------------

  end
}
