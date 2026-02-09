-- ~/.config/nvim/lua/plugins/telekasten.lua

return {
  'renerocksai/telekasten.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local home = vim.fn.expand('~/zettelkasten')
    require('telekasten').setup({
      home = home,

      -- Dailies configuration
      dailies = home .. '/' .. 'daily',
      weeklies = home .. '/' .. 'weekly',
      templates = home .. '/' .. 'templates',

      -- Image handling
      image_subdir = 'img',

      -- File extension
      extension = '.md',

      -- New note filename format
      new_note_filename = 'title',
      uuid_type = '%Y%m%d%H%M',

      -- Template for new notes
      template_new_note = home .. '/' .. 'templates/new_note.md',
      template_new_daily = home .. '/' .. 'templates/daily.md',
      template_new_weekly = home .. '/' .. 'templates/weekly.md',

      -- Follow URL behavior
      follow_creates_nonexisting = true,
      dailies_create_nonexisting = true,
      weeklies_create_nonexisting = true,

      -- Journal auto run
      journal_auto_open = false,
    })

    -- Keybindings
    local map = vim.keymap.set

    -- Panel and search
    map('n', '<leader>tkp', '<cmd>Telekasten panel<CR>', { desc = '[T]ele[k]asten [P]anel' })
    map('n', '<leader>tkf', '<cmd>Telekasten find_notes<CR>', { desc = '[T]ele[k]asten [F]ind notes' })
    map('n', '<leader>tkg', '<cmd>Telekasten search_notes<CR>', { desc = '[T]ele[k]asten [G]rep notes' })

    -- Daily and weekly notes
    map('n', '<leader>tkd', '<cmd>Telekasten goto_today<CR>', { desc = '[T]ele[k]asten [D]aily note' })
    map('n', '<leader>tkw', '<cmd>Telekasten goto_thisweek<CR>', { desc = '[T]ele[k]asten [W]eekly note' })

    -- New notes
    map('n', '<leader>tkn', '<cmd>Telekasten new_note<CR>', { desc = '[T]ele[k]asten [N]ew note' })
    map('n', '<leader>tkt', '<cmd>Telekasten new_templated_note<CR>', { desc = '[T]ele[k]asten [T]emplated note' })

    -- Links and tags
    map('n', '<leader>tkl', '<cmd>Telekasten follow_link<CR>', { desc = '[T]ele[k]asten follow [L]ink' })
    map('n', '<leader>tkb', '<cmd>Telekasten show_backlinks<CR>', { desc = '[T]ele[k]asten [B]acklinks' })
    map('n', '<leader>tki', '<cmd>Telekasten insert_link<CR>', { desc = '[T]ele[k]asten [I]nsert link' })
    map('n', '<leader>tk#', '<cmd>Telekasten show_tags<CR>', { desc = '[T]ele[k]asten show tags' })

    -- Utilities
    map('n', '<leader>tkr', '<cmd>Telekasten rename_note<CR>', { desc = '[T]ele[k]asten [R]ename note' })
    map('n', '<leader>tky', '<cmd>Telekasten yank_notelink<CR>', { desc = '[T]ele[k]asten [Y]ank link' })

    -- Insert mode keybindings
    map('i', '[[', '<cmd>Telekasten insert_link<CR>', { desc = 'Insert link' })
  end,
}
