return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = {
          ".git",
          "package.json",
          "tsconfig.json",
        },
      })

      require("telescope").load_extension("projects")
    end,
  },
}
