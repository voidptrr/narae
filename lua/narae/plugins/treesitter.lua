local parsers = {
  "cpp",
  "nix",
  "rust",
  "terraform",
  "zig",
}

local filetypes = {
  "c",
  "cpp",
  "lua",
  "nix",
  "rust",
  "tf",
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

    vim.treesitter.language.register("terraform", "tf")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
