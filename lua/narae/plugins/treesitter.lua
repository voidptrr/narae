local parsers = {
  "cpp",
  "nix",
  "rust",
  "zig",
}

local filetypes = {
  "c",
  "cpp",
  "lua",
  "nix",
  "rust",
  "zig",
}

---@type NaraePlugin
return {
  repo = "https://github.com/nvim-treesitter/nvim-treesitter",
  setup = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldlevel = 99

    if mnw == nil then
      require("nvim-treesitter").setup()

      if vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install(parsers)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
