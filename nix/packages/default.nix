{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.default = inputs.mnw.lib.wrap {inherit pkgs;} {
      appName = "narae";

      initLua = builtins.readFile ../../init.lua;

      plugins.dev.config = {
        pure = pkgs.lib.fileset.toSource {
          root = ../../.;
          fileset = pkgs.lib.fileset.unions [
            ../../ftplugin
            ../../init.lua
            ../../lsp
            ../../lua
          ];
        };
        impure = "/home/voidptr/git/narae";
      };

      plugins.start = with pkgs.vimPlugins; [
        vim-fugitive
        (nvim-treesitter.withPlugins (p:
          with p; [
            cpp
            nix
            rust
            terraform
            zig
          ]))
      ];
      plugins.opt = [];
    };
  };
}
