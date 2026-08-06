local treesitter_filetypes = {
  "c",
  "cpp",
  "lua",
  "nix",
  "rust",
  "zig",
}

local treesitter_parsers = {
  "cpp",
  "nix",
  "rust",
  "zig",
}

if mnw == nil then
  vim.pack.add("https://github.com/nvim-treesitter/nvim-treesitter")
  require("nvim-treesitter").setup()
  require("nvim-treesitter").install(treesitter_parsers)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = treesitter_filetypes,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
