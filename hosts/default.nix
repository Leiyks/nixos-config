{ inputs, location, user, systemConfiguration, ... }:

let
  system = "x86_64-linux";

  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  pkgs-stable = import inputs.nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  laptop =
    let
      host = {
        hostName = "leiyks-laptop";
        mainMonitor = "eDP-1-1";
        secondMonitor = "HDMI-0";
      };
    in
    (if systemConfiguration == true then
      inputs.nixpkgs-stable.lib.nixosSystem
        {
          inherit system;

          specialArgs = { inherit host inputs location user; };

          modules = [ ./laptop ./configuration.nix ];
        }
    else
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit user host pkgs-stable; };

        modules = [ ./home.nix ./laptop/home.nix ];
      });

  wsl =
    let
      host.hostName = "leiyks-wsl";
    in
    (if systemConfiguration == false then
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit user host pkgs; };

        modules = [ ./home.nix ./wsl/home.nix ];
      }
    else { });

  datadog =
    let
      host.hostName = "leiyks-dd";
    in
    (if systemConfiguration == false then
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { user = "alexandre"; inherit host pkgs; };

        modules = [ ./home.nix ./datadog/home.nix ];
      }
    else { });
}
