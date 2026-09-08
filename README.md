# narae

**나래** *n.* wing; wings.

Lua-first Neovim config that can run directly from `~/.config/nvim` or as a
Nix-wrapped package.

## Direct use

```sh
git clone <repo> ~/.config/nvim
nvim
```

This path uses Neovim's built-in `vim.pack` support for plugins. External
commands such as `git`, compilers, formatters, search tools, and language
servers must already be available on the device. Treesitter parser installation
also needs the `tree-sitter` command.

## Nix use

```sh
nix run .
```

The flake wraps Neovim with `mnw` and provides the configured plugins through
Nix. In this mode the config sees `mnw` and skips `vim.pack` plugin
installation.

## LSP

Languages are listed in `lua/narae/core/language.lua`, including filetypes,
Treesitter parsers, and LSP server names. LSP configs live in `lsp/*.lua` and
are enabled only when their server command exists on `PATH`. Install language
servers on the device, system profile, or project shell as needed.
