{ config, pkgs, user, ... }:

{
  # Enable the X11 windowing system
  services.xserver = {

    displayManager = {
      autoLogin = { enable = true; inherit user; };

      sddm = { enable = true; autoNumlock = true; enableHidpi = true; };

      defaultSession = "plasma5+i3+${user}";

      session = [
        {
          manage = "desktop";
          name = "plasma5+i3+${user}";
          start = ''
            env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11
          '';
        }
      ];
    };

    desktopManager.plasma5 = {
      enable = true;
      excludePackages = with pkgs.libsForQt5; [
        kwallet
      ];
    };
  };
}

