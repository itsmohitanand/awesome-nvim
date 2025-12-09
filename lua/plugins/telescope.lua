-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope.builtin')
    local map = vim.keymap.set
    map('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
    map('n', '<leader>fg', telescope.live_grep, { desc = 'Live grep' })
    map('n', '<leader>fb', telescope.buffers, { desc = 'Find buffers' })
  end,
}
