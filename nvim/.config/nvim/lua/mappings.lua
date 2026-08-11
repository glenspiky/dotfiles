require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Live grep
map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

vim.keymap.set("n", "'", "%", { desc = "Jump to matching bracket" })

map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Explorer" }) -- Space Space -> Find files

vim.keymap.set("n", "fl", vim.diagnostic.open_float, { desc = "Line diagnostics" })

map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

map("n", ";", "$", { desc = "Move to end of line" })
map("v", ";", "$", { desc = "Move to end of line" })

-- Move by visual lines (screen lines) instead of logical lines
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Dynamic toggle for quote navigation
local last_direction = "forward"

local function jump_quotes()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col "."
  local char = line:sub(col, col)

  -- If cursor is on a quote, handle quote bouncing
  if char:match "['\"`]" then
    if last_direction == "forward" then
      local found = vim.fn.search(char, "W", vim.fn.line ".")
      if found == 0 then
        vim.fn.search(char, "bW", vim.fn.line ".")
        last_direction = "backward"
      end
    else
      local found = vim.fn.search(char, "bW", vim.fn.line ".")
      if found == 0 then
        vim.fn.search(char, "W", vim.fn.line ".")
        last_direction = "forward"
      end
    end
  else
    -- Standard native Neovim bracket jumping (works perfectly in Normal & Visual)
    vim.cmd "normal! %"
  end
end

-- Use ' to run the quote function in Normal and Visual modes
map({ "n", "v" }, "'", jump_quotes, { desc = "Jump between brackets and quotes", silent = true })

map("n", "<leader>ft", "<cmd>TailwindFoldToggle<CR>", {
  desc = "Toggle Tailwind Fold",
  silent = true,
})
