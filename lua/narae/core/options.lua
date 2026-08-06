local opt = vim.opt

opt.number = true -- line number
opt.relativenumber = true -- relative line numbers
opt.cursorline = true -- highlight current line
opt.wrap = false -- do not wrap lines by default
opt.scrolloff = 10 -- keep 10 lines above/below cursor
opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive if uppercase in string
opt.hlsearch = true -- highlight search matches
opt.incsearch = true -- show matches as you type

opt.laststatus = 3
opt.signcolumn = "yes" -- always show a sign column
--opt.colorcolumn = "100" -- show a column at 100 position chars
opt.cmdheight = 0 -- single line command line
opt.completeopt = "menuone,noinsert,noselect" -- completion options
opt.showmode = false -- do not show the mode, instead have it in statusline
opt.pumheight = 10 -- popup menu height
opt.pumblend = 10 -- popup menu transparency
opt.winblend = 0 -- floating window transparency
--opt.conceallevel = 2 -- obsidian requirement
opt.concealcursor = "" -- do not hide cursorline in markup
opt.synmaxcol = 300 -- syntax highlighting limit
opt.fillchars = { eob = " " } -- hide "~" on empty lines
opt.splitbelow = true

opt.backup = false -- do not create a backup file
opt.writebackup = false -- do not write to a backup file
opt.swapfile = false -- do not create a swapfile
opt.undofile = true -- do create an undo file
opt.undodir = undodir -- set the undo directory
opt.updatetime = 300 -- faster completion
opt.timeoutlen = 500 -- timeout duration
opt.ttimeoutlen = 50 -- key code timeout
opt.autoread = true -- auto-reload changes if outside of neovim
opt.autowrite = false -- do not auto-save

opt.hidden = true -- allow hidden buffers
opt.errorbells = false -- no error sounds
opt.backspace = "indent,eol,start" -- better backspace behaviour
opt.autochdir = false -- do not autochange directories
opt.iskeyword:append("-") -- include - in words
opt.path:append("**") -- include subdirs in search
opt.selection = "inclusive" -- include last char in selection
opt.mouse = "a" -- enable mouse support
opt.clipboard:append("unnamedplus") -- use system clipboard
opt.modifiable = true -- allow buffer modifications

opt.foldmethod = "expr" -- use expression for folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
opt.foldlevel = 99 -- start with all folds open
