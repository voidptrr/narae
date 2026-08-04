# nvim-config

Lua-first Neovim config that can run directly from `~/.config/nvim` or as a Nix-wrapped package.

## Direct use

```sh
git clone <repo> ~/.config/nvim
nvim
```

This path bootstraps `lazy.nvim` and lets Lazy install plugins. External commands such as `git`, compilers, formatters, search tools, and language servers must already be available on the device.

## Nix use

```sh
nix run .
```

The flake wraps Neovim with `mnw` and provides Lazy plus plugins through Nix. In this mode the config still calls Lazy, but Lazy resolves plugins from `mnw.configDir`.

External executables are intentionally not bundled by this flake. If a device or project needs `git`, `fd`, `ripgrep`, `stylua`, language servers, or compiler toolchains, provide them in that system profile, Home Manager config, or project shell.
