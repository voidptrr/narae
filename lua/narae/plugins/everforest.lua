---@type NaraePlugin
return {
  repo = "https://github.com/sainnhe/everforest",
  setup = function()
    vim.opt.background = "dark"
    vim.g.everforest_enable_italic = true
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_background = "soft"

    vim.cmd.colorscheme("everforest")
  end,
}
