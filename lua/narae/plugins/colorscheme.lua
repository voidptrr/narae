---@type NaraePlugin
return {
  repo = "sainnhe/gruvbox-material",
  setup = function()
    vim.g.gruvbox_material_background = "dark"
    vim.g.gruvbox_material_disable_italic_comment = 0
    vim.g.gruvbox_material_enable_bold = 0
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_ui_contrast = "low"
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
