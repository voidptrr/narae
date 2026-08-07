vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("narae.core.options")
require("narae.core.keymaps")
require("narae.core.colorscheme")
require("narae.core.statusline").setup()

require("narae.core.loader").load()
