{ inputs, location, user, ... }:

let
  system = "x86_64-linux";

  home-manager = inputs.home-manager;
  nixpkgs = inputs.nixpkgs;
  lib = nixpkgs.lib;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  laptop =
    let
      host = {
        hostName = "laptop";
        # TODO: Adapt monitor name
        mainMonitor = "Virtual1";
      };
    in
    lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit host inputs location user;
      };

      modules = [
        ./laptop
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user host; };

          home-manager.users.${user} = {
            imports = [ (import ./home.nix) (import ./laptop/home.nix) ];
          };
        }
      ];
    };
}
