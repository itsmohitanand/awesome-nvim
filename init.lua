-- ~/.config/nvim/init.lua

-- -----------------------------------------------------------------------------
-- #1: LEADER KEY AND LAZY.NVIM BOOTSTRAP
-- -----------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- -----------------------------------------------------------------------------
-- #2: LOAD CORE CONFIG
-- -----------------------------------------------------------------------------

require('core.options')
require('keymaps')

-- -----------------------------------------------------------------------------
-- #3: LAZY.NVIM PLUGIN SETUP
-- -----------------------------------------------------------------------------

require('lazy').setup({
  {
    'Everblush/nvim', 
    name = 'everblush', 
    priority = 1000,
    config = function() 
        vim.cmd.colorscheme 'everblush' 
    end 
  },
  
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end,
  },
  
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = true },
      })
    end,
  },

  { 'tpope/vim-commentary' },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'bash', 'markdown' },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Import all our plugin configs from lua/plugins
  { import = 'plugins' },
})