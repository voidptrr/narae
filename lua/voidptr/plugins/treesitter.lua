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
    }

    local treesitter = require("nvim-treesitter")
    treesitter.setup()

    if mnw == nil then
      treesitter.install(languages)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
