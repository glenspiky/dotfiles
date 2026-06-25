vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = "100"
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.filetype.add({
  extension = {
    ejs = "html",
  },
})
vim.opt.termguicolors = true
-- Better diagnostics
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },

  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,

  float = {
    border = "rounded",
    source = true,
    max_width = 80,
  },
})
