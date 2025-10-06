if vim.g.vscode then
  return {}
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  },
  enabled = true,
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason-lspconfig').setup({
      -- Replace the language servers listed here lsp
      -- with the ones you want to install
      ensure_installed = { 'lua_ls', 'rust_analyzer', 'ts_ls', 'eslint' },
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
    -- global state; starts enabled (change to false if you prefer off by default)
    if vim.g._diagnostics_virtual_text == nil then
      vim.g._diagnostics_virtual_text = true
    end
    -- apply current setting at startup
    vim.diagnostic.config({
      virtual_text = vim.g._diagnostics_virtual_text,
      severity_sort = true,
    })
    -- ==================================

    -- This is where you enable features that only work
    -- if there is a language server active in the file
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

        -- Toggle inline diagnostics (virtual text) on/off
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

    -- You'll find a list of language servers here:
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    -- These are example language servers.
    -- (NOTE: 'gleam' and 'ocamllsp' now setup in handlers above)

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      -- mapping = cmp.mapping.preset.insert({}),
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestion
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
    })
  end
}
