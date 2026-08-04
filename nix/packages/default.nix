{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.default = inputs.mnw.lib.wrap {inherit pkgs;} {
      appName = "nvim";

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
        impure = "/home/voidptr/git/nvim-config";
      };

      plugins.start = with pkgs.vimPlugins; [
        lazy-nvim
      ];

      plugins.opt =
        (with pkgs.vimPlugins; [
          blink-cmp
          lualine-nvim
          nightfox-nvim
        ])
        ++ [
          (pkgs.vimPlugins.nvim-treesitter.withPlugins (
            parsers:
              with parsers; [
                lua
                nix
                rust
                zig
              ]
          ))
        ];
    };
  };
}
