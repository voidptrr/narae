{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShellNoCC {
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs; [
        alejandra
        lua-language-server
        stylua
      ];
    };
  };
}
