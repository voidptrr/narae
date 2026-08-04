return {
  "nvim-treesitter/nvim-treesitter",
  build = mnw == nil and ":TSUpdate" or nil,
  lazy = false,
  config = function()
    local languages = {
      "lua",
      "nix",
      "rust",
      "zig",
      "c",
      "terraform"
    }

    local treesitter = require("nvim-treesitter")
    treesitter.setup()

    if mnw == nil then
      local to_install = {
        "nix",
        "rust",
        "zig",
        "terraform",
      }
      treesitter.install(to_install)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        pcall(vim.treesitter.start)
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end,
    })
  end,
}
