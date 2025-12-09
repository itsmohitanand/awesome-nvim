-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local on_attach = function(client, bufnr)
        local bufmap = function(mode, lhs, rhs, opts)
          local options = { noremap = true, silent = true, buffer = bufnr }
          if opts then
            options = vim.tbl_extend('force', options, opts)
          end
          vim.keymap.set(mode, lhs, rhs, options)
        end

        bufmap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
        bufmap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
        bufmap('n', 'K', vim.lsp.buf.hover, { desc = 'Show Hover Docs' })
        bufmap('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
        bufmap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
        bufmap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
        bufmap('n', 'gr', vim.lsp.buf.references, { desc = 'Show References' })
        bufmap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show Signature Help' })
        bufmap('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show Signature Help' })
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'lua_ls' },
        handlers = {
          function(server_name)
            vim.lsp.config[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
          ['lua_ls'] = function()
            vim.lsp.config.lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                },
              },
            })
          end,
        },
      })
    end
  },
}