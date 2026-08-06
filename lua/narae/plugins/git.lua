if mnw == nil then
  vim.pack.add("https://github.com/tpope/vim-fugitive")
end

local map = vim.keymap.set

map("n", "<leader>gs", "<cmd>Git<cr>")
map("n", "<leader>gm", "<cmd>Git commit<cr>")
map("n", "<leader>gp", "<cmd>Git push<cr>")
map("n", "<leader>gP", "<cmd>Git pull<cr>")
