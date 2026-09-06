---@type NaraePlugin
return {
  repo = "https://github.com/nvim-lualine/lualine.nvim",
  setup = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "everforest",
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
    })
  end,
}
