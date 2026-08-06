require "nvchad.autocmds"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.document_color.enable(false, {
      bufnr = args.buf,
    })
  end,
})
