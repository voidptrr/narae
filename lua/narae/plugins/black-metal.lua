---@type NaraePlugin
return {
  repo = "https://github.com/metalelf0/black-metal-theme-neovim",
  setup = function()
    require("black-metal").setup({
      theme = "gorgoroth",
      variant = "dark",
      dark_gutter = false,
      plain_float = true,
      term_colors = true,
      highlights = {
        CursorLine = { bg = "#181818" },
      },
    })
    require("black-metal").load()
  end,
}
