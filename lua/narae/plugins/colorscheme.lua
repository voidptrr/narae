---@type NaraePlugin
return {
  repo = "https://github.com/rebelot/kanagawa.nvim",
  setup = function()
    require("kanagawa").setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      theme = "dragon",
    })

    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
