{ inputs, location, user, systemConfiguration, ... }:

let
  system = "x86_64-linux";

  home-manager = inputs.home-manager;

  nixpkgs = inputs.nixpkgs;

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
        mainMonitor = "eDP-1";
      };
    in
    (if systemConfiguration == true then
      nixpkgs.lib.nixosSystem
        {
          inherit system;

          specialArgs = { inherit host inputs location user; };

          modules = [ ./laptop ./configuration.nix ];
        }
    else
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit user host; };

        modules = [ ./home.nix ./laptop/home.nix ];
      });
}
