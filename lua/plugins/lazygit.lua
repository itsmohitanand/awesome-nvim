return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- Optional: dependency for telescope integration (if you use telescope)
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- Setting the keymap here makes it load only when needed
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
