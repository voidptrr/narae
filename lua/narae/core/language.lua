local languages = {
  {
    name = "c",
    filetypes = { "c" },
    lsp = "clangd",
  },
  {
    name = "cpp",
    filetypes = { "cpp" },
    parser = "cpp",
    lsp = "clangd",
  },
  {
    name = "lua",
    filetypes = { "lua" },
    lsp = "lua_ls",
  },
  {
    name = "nix",
    filetypes = { "nix" },
    parser = "nix",
  },
  {
    name = "python",
    filetypes = { "python" },
    parser = "python",
    lsp = "pyright",
  },
  {
    name = "rust",
    filetypes = { "rust" },
    parser = "rust",
    lsp = "rust_analyzer",
  },
  {
    name = "terraform",
    filetypes = { "terraform", "terraform-vars", "tf" },
    parser = "terraform",
    parser_aliases = { "tf" },
  },
  {
    name = "typescript",
    filetypes = { "typescript" },
    parser = "typescript",
    lsp = "tsgo",
  },
  {
    name = "typescriptreact",
    filetypes = { "typescriptreact" },
    parser = "tsx",
    lsp = "tsgo",
  },
  {
    name = "zig",
    filetypes = { "zig" },
    parser = "zig",
    lsp = "zls",
  },
}

local filetypes = {}
local lsp_servers = {}
local treesitter_aliases = {}
local treesitter_parsers = {}
local seen = {
  filetypes = {},
  lsp_servers = {},
  treesitter_parsers = {},
}

local function add_unique(list, seen_list, value)
  if value ~= nil and not seen_list[value] then
    seen_list[value] = true
    table.insert(list, value)
  end
end

for _, language in ipairs(languages) do
  add_unique(lsp_servers, seen.lsp_servers, language.lsp)
  add_unique(treesitter_parsers, seen.treesitter_parsers, language.parser)

  for _, filetype in ipairs(language.filetypes) do
    add_unique(filetypes, seen.filetypes, filetype)
  end

  for _, filetype in ipairs(language.parser_aliases or {}) do
    table.insert(treesitter_aliases, { parser = language.parser, filetype = filetype })
  end
end

return {
  languages = languages,
  filetypes = filetypes,
  lsp_servers = lsp_servers,
  treesitter_aliases = treesitter_aliases,
  treesitter_parsers = treesitter_parsers,
}
