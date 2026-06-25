return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "lua",
        "json",
        "python",
        "c",
        "ejs",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },
  },
}
