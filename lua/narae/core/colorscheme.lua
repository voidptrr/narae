vim.cmd.colorscheme("habamax")

local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
local comment = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
local identifier = vim.api.nvim_get_hl(0, { name = "Identifier", link = false })
local bg = normal.bg
local sel_bg = comment.fg

vim.api.nvim_set_hl(0, "Normal", { fg = normal.fg, bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = normal.fg, bg = bg })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = normal.fg, bg = sel_bg, bold = true })
vim.api.nvim_set_hl(0, "PmenuKind", { fg = identifier.fg, bg = bg })
vim.api.nvim_set_hl(0, "PmenuExtra", { fg = comment.fg, bg = bg })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = bg })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = sel_bg })
