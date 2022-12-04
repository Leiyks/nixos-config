{ config, pkgs, ... }:
let
  modifier = "Mod4";
in
{
  # Enable the X11 windowing system
  services.xserver = {

    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma5+i3+leiyks";
      session = [
        {
          manage = "desktop";
          name = "plasma5+i3+leiyks";
          start = ''
            env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11
          '';
        }
      ];
    };

    desktopManager.plasma5.enable = true;
  };
}
