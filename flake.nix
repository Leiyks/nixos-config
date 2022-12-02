{
  description = "My Personal NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      user = "leiyks";
      location = "$HOME/git/nixos-config";
    in
    {
      nixosConfigurations = (
        import ./hosts { inherit inputs location user; }
      );
    };
}
