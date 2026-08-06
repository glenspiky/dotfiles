require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      semanticTokens = true,
    },
  },
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
      },
    },
  },
})

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
  "basedpyright",
  "bashls",
  "yamlls",
  "marksman",
  "clangd",

  -- Formatters
  "stylua",
  "prettierd",
  "prettier",
  "gofumpt",
  "goimports",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
--
