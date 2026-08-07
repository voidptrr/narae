local map = vim.keymap.set

map("n", "-", "<cmd>Explore<cr>") -- open the file explorer
map("n", "<leader>f", ":find ") -- find a file in path
map("n", "<leader>v", "<cmd>vsplit<cr>") -- open a vertical split
map("n", "<leader>s", "<cmd>split<cr>") -- open a horizontal split
map("n", "<C-h>", "<C-w>h") -- move to the split on the left
map("n", "<C-j>", "<C-w>j") -- move to the split below
map("n", "<C-k>", "<C-w>k") -- move to the split above
map("n", "<C-l>", "<C-w>l") -- move to the split on the right
map("n", "<M-j>", "<cmd>move .+1<cr>==") -- move the current line down
map("n", "<M-k>", "<cmd>move .-2<cr>==") -- move the current line up
map("v", "<M-j>", ":move '>+1<cr>gv=gv") -- move the selection down
map("v", "<M-k>", ":move '<-2<cr>gv=gv") -- move the selection up
