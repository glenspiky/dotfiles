return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "c",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
        },
        highlight = {
          enable = true,
        },
      })
    end,
  }

