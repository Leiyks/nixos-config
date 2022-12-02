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
      # TODO: Adapt monitor name
      hosts = {
        mainMonitor = "eDP-1";
      };
    in
    lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit hosts inputs location user;
      };

      modules = [
        hyprland.nixosModules.default
        # ./laptop
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit user;
            hosts = hosts // { hostName = "laptop"; };
          };

          home-manager.users.${user} = {
            imports = [ (import ./home.nix) ]; # (import ./laptop/home.nix) ];
          };
        }
      ];
    };
}
