require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Live grep
map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Explorer" }) -- Space Space -> Find files

vim.keymap.set("n", "fl", vim.diagnostic.open_float, { desc = "Line diagnostics" })

map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("i", "jf", "<Esc>", { desc = "Exit insert mode" })

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

local function jump_pair()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col "."
  local char = line:sub(col, col)

  -- Quotes
  if char == '"' or char == "'" or char == "`" then
    local start_col = col

    -- Search forward for the next matching quote
    local next_col = line:find(char, col + 1, true)

    if next_col then
      -- If there is a quote after us, jump to it
      vim.api.nvim_win_set_cursor(0, { vim.fn.line ".", next_col - 1 })
      return
    end

    -- Otherwise search backward
    local before = line:sub(1, col - 1)
    local prev_col = before:match(".*()" .. vim.pesc(char))

    if prev_col then
      vim.api.nvim_win_set_cursor(0, { vim.fn.line ".", prev_col - 1 })
    end
  else
    -- Brackets: (), [], {}
    vim.cmd "normal! %"
  end
end

map({ "n", "v" }, "'", jump_pair, {
  desc = "Jump between brackets and quotes",
  silent = true,
})

map("n", "<leader>ft", "<cmd>TailwindFoldToggle<CR>", {
  desc = "Toggle Tailwind Fold",
  silent = true,
})
