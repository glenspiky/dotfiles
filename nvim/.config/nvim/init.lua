vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "jj", [[<C-\><C-n>]])
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.keymap.set("n", "<leader>z", "za", { remap = true })
vim.keymap.set("n", "e", "0", { remap = true })
vim.keymap.set("n", ";", "$")
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Maps the bracket keys in visual mode to wrap selection natively
vim.keymap.set("v", "[", 'c[<C-r>"]]<Esc>')
vim.keymap.set("v", "{", 'c{<C-r>"}<Esc>')
vim.keymap.set("v", "(", 'c(<C-r>")<Esc>')
vim.keymap.set("v", "<", 'c<<C-r>"><Esc>')

vim.keymap.set("v", '"', 'c"<C-r>""<Esc>')
vim.keymap.set("v", "'", "c'<C-r>\"'<Esc>")
vim.keymap.set("v", "`", 'c`<C-r>"`<Esc>')
vim.keymap.set("n", "<leader>ai", "<cmd>TSToolsAddMissingImports<CR>")
vim.keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>")
vim.keymap.set("n", "<leader>r", function()
	vim.cmd("w")
	vim.cmd("!gcc % -o %< && ./%<")
end)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.keymap.set("n", "<C-/>", function()
	vim.cmd("belowright split | terminal")
	vim.cmd("startinsert")
end, { desc = "Open terminal below" })

vim.keymap.set("n", "K", function()
	local diagnostics = vim.diagnostic.get(0, {
		lnum = vim.api.nvim_win_get_cursor(0)[1] - 1,
	})

	if #diagnostics > 0 then
		vim.diagnostic.open_float()
	else
		vim.lsp.buf.hover()
	end
end, { desc = "Hover or diagnostics" })

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.tsx" },
	callback = function()
		vim.cmd("TSToolsOrganizeImports")
	end,
})
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")

vim.filetype.add({
	extension = {
		prismafile = "prisma", -- Maps .prismafile to the prisma filetype
		prisma = "prisma", -- Maps regular .prisma files as well
	},
})
