require("nvchad.configs.lspconfig").defaults()

require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",
  "ts_ls",
  "html",
  "cssls",
  "tailwindcss",
  "emmet_language_server",
  "jsonls",
  "eslint",
  "prismals",
  "gopls",
  "rust_analyzer",
  "pyright",
  "bashls",
  "yamlls",
  "marksman",

  -- Formatters
    "stylua",
    "prettierd",
    "prettier",
    "gofumpt",
    "goimports",
}

vim.lsp.enable(servers)
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
