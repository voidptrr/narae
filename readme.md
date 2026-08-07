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
