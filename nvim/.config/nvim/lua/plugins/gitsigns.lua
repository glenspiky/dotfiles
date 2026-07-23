return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Previous Hunk")

        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>hb", gs.blame_line, "Blame Line")
        map("n", "<leader>hd", gs.diffthis, "Diff")
      end

      return opts
    end,
  },
}
