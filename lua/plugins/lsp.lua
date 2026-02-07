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
    dependencies = { 'neovim/nvim-lspconfig' }, -- Ensure lspconfig is loaded
    config = function()
      local on_attach = function(client, bufnr)
        local bufmap = function(mode, lhs, rhs, opts)
          local options = { noremap = true, silent = true, buffer = bufnr }
          if opts then
            options = vim.tbl_extend('force', options, opts)
          end
          vim.keymap.set(mode, lhs, rhs, options)
        end

        -- Keymaps (only active when LSP is attached)
        bufmap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
        bufmap('n', 'K', vim.lsp.buf.hover, { desc = 'Show Hover Docs' })
        bufmap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
        bufmap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
        bufmap('n', 'gr', vim.lsp.buf.references, { desc = 'Show References' })
        bufmap('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show Signature Help' })
      end

      -- If you aren't using nvim-cmp yet, this line might error. 
      -- If it does, replace it with: local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = {}
      local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if status then
        capabilities = cmp_nvim_lsp.default_capabilities()
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end

      local lspconfig = require('lspconfig')

      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'lua_ls' },
        handlers = {
          -- Default handler for all servers
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
          -- Specific override for Lua
          ['lua_ls'] = function()
            lspconfig.lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { 'vim' } },
                },
              },
            })
          end,
        },
      })

      -- ty (Python type checker from Astral) — installed via pip/uv, not mason
      lspconfig.ty.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end
  },
}
