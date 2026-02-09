-- ~/.config/nvim/lua/plugins/neorg.lua

return {
  'nvim-neorg/neorg',
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup({
      load = {
        -- Core modules
        ['core.defaults'] = {},
        ['core.concealer'] = {
          config = {
            icon_preset = 'varied',
          },
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/neorg',
              work = '~/neorg/work',
              personal = '~/neorg/personal',
            },
            default_workspace = 'notes',
          },
        },
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
        ['core.integrations.nvim-cmp'] = {},
        ['core.journal'] = {
          config = {
            workspace = 'notes',
          },
        },
        ['core.keybinds'] = {
          config = {
            default_keybinds = true,
            neorg_leader = '<Leader>o',
          },
        },
        ['core.summary'] = {},
        ['core.export'] = {},
        ['core.export.markdown'] = {},
      },
    })

    -- Additional keybindings
    local map = vim.keymap.set

    -- Workspace navigation
    map('n', '<leader>nrw', '<cmd>Neorg workspace<CR>', { desc = '[N]eo[r]g [W]orkspace' })
    map('n', '<leader>nrn', '<cmd>Neorg workspace notes<CR>', { desc = '[N]eo[r]g workspace [N]otes' })
    map('n', '<leader>nrp', '<cmd>Neorg workspace personal<CR>', { desc = '[N]eo[r]g workspace [P]ersonal' })

    -- Journal
    map('n', '<leader>nrj', '<cmd>Neorg journal today<CR>', { desc = '[N]eo[r]g [J]ournal today' })
    map('n', '<leader>nry', '<cmd>Neorg journal yesterday<CR>', { desc = '[N]eo[r]g journal [Y]esterday' })
    map('n', '<leader>nrt', '<cmd>Neorg journal tomorrow<CR>', { desc = '[N]eo[r]g journal [T]omorrow' })

    -- Index and TOC
    map('n', '<leader>nri', '<cmd>Neorg index<CR>', { desc = '[N]eo[r]g [I]ndex' })
    map('n', '<leader>nrc', '<cmd>Neorg toc<CR>', { desc = '[N]eo[r]g table of [C]ontents' })

    -- Return to previous location
    map('n', '<leader>nrr', '<cmd>Neorg return<CR>', { desc = '[N]eo[r]g [R]eturn' })
  end,
}
