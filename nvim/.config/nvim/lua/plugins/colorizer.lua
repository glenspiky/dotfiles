return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = { "css", "scss", "html", "javascript" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or Red
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- CSS glossaries component
        mode = "background", -- Set the display mode ("background", "foreground", or "virtualtext")
        tailwind = true, -- Enable tailwind colors
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
      },
    }) -- <-- This is where the missing }) belonged!
  end,
}
