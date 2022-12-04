{ config, pkgs, ... }:
let
  modifier = "Mod4";
in
# I3 configuration to use with KDE
{
  # We add this file to disable the systemBoot option to replace KNWM with i3
  home.file.".config/startkderc" = {
    source = ../../../assets/desktop/startkderc;
  };

  home.packages = with pkgs; [ i3lock-fancy ];

  xsession.enable = true;

  # Disable the command set by the i3 service of home manager
  xsession.windowManager.command = pkgs.lib.mkForce ''test -n "$1" && eval "$@"'';

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {

      defaultWorkspace = "workspace 1";

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/.config/wallpaper.jpg";
          always = true;
          notification = false;
        }
        {
          command = ''pkill "ksplashqml"'';
          always = true;
          notification = false;
        }
        #{
        ## TODO: reactivate when config is finished
        #command = "brave"; #& slack & discord";
        #always = true;
        #notification = false;
        #}
      ];

      terminal = "konsole ";
      bars = [ ];
    };

    extraConfig = builtins.readFile ../../../assets/desktop/config;
  };
}

