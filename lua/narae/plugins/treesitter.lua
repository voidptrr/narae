local language = require("narae.core.language")

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
        require("nvim-treesitter").install(language.treesitter_parsers)
      end
    end

    for _, alias in ipairs(language.treesitter_aliases) do
      vim.treesitter.language.register(alias.parser, alias.filetype)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = language.filetypes,
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
