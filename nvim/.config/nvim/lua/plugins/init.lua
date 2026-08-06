return {

  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      render = "virtual", -- Small square icon next to text
      virtual_symbol = "■", -- Icon format
      enable_tailwind = true, -- Works with text-white, fill-white, etc.

      -- FORCE OVERRIDE: Prevents background color injections
      enable_named_colors = true,
      enable_hex = true,
      custom_colors = {},
    },
    config = function(_, opts)
      require("nvim-highlight-colors").setup(opts)

      -- Blocks base46 or other themes from replacing background styles
      vim.api.nvim_set_hl(0, "HighlightColorsBg", { bg = "NONE", ctermbg = "NONE" })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  --: test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Neovim
        "vim",
        "vimdoc",
        "lua",
        "luadoc",

        -- Web
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "json5",

        -- Backend
        "go",
        "gomod",
        "gosum",
        "gowork",

        -- Python
        "python",

        -- Rust
        "rust",

        -- Config
        "yaml",
        "toml",
        "bash",
        "dockerfile",

        -- Markup
        "markdown",
        "markdown_inline",

        -- Git
        "git_config",
        "gitcommit",
        "gitignore",

        -- Database
        "sql",
        "prisma",

        -- Other
        "regex",
        "query",
      },
    },
  },
}
