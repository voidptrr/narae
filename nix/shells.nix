{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShellNoCC {
      packages = with pkgs; [
        alejandra
        lua-language-server
        stylua
      ];
    };
  };
}
