{
  description = "voidptr Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree = {
      type = "github";
      owner = "vic";
      repo = "import-tree";
    };
    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} (
      inputs.import-tree ./nix
      // {
        systems = import inputs.systems;
      }
    );
}
