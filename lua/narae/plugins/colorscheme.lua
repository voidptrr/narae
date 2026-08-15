---@type NaraePlugin
return {
  repo = "https://github.com/rebelot/kanagawa.nvim",
  setup = function()
    require("kanagawa").setup({
      transparent = true,
      terminalColors = true,
      keywordStyle = { italic = false },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          FloatBorder = { fg = "#ffffff", bg = "NONE" },
          LspReferenceTarget = { bg = "NONE", underline = false },
          Pmenu = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
          PmenuBorder = { fg = "#ffffff", bg = "NONE" },
          PmenuExtra = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
          PmenuExtraSel = { fg = theme.ui.float.fg, bg = theme.ui.bg_p2 },
          PmenuKind = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
          PmenuKindSel = { fg = theme.ui.float.fg, bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
      theme = "dragon",
    })

    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
