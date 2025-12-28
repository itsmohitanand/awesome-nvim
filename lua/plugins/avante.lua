-- ~/.config/nvim/lua/plugins/avante.lua

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Use the latest features
  build = "make",  -- Mandatory build step
  
  config = function()
    local current_dir = vim.fn.getcwd()
    -- CHANGE THIS to your actual sandbox folder path
    local sandbox_path = vim.fn.expand("~/ai_sandbox")

    -- SAFETY CHECK: Only load Avante if we are inside the sandbox directory
    if current_dir:find(sandbox_path, 1, true) then
      require("avante").setup({
        provider = "openai", -- You mentioned Codex, which typically uses the OpenAI provider
        auto_suggestions_provider = "openai",
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o", -- or your specific codex/o1 model
          timeout = 30000,
          temperature = 0,
          max_tokens = 4096,
        },
        -- Behavioral settings for agentic work
        behaviour = {
          auto_suggestions = false, -- Recommended to keep off in proprietary contexts
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
          support_paste_from_clipboard = true,
        },
      })
    else
      -- Silent ignore or a small notification
      -- print("AI Agent restricted: Outside of Sandbox")
    end
  end,

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
