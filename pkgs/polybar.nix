{ config, pkgs, ... }:
# Polybar
let
  theme = ../assets/polybar/bapt-forest-theme;
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3GapsSupport = true;
    };
    extraConfig = builtins.replaceStrings
      [ "__HOME__" ]
      [ "${theme}" ]
      (builtins.readFile (theme + "/config.ini"));
    script = ''
      set -ex
      echo ${theme}
      export PATH="$PATH:${pkgs.xorg.xrandr}/bin:${pkgs.i3-gaps}/bin:${pkgs.coreutils}/bin:${pkgs.gnugrep}/bin"

      main=$(xrandr | grep ' connected primary ' | cut -d' ' -f1)
      side=$(xrandr | grep ' connected ' | grep -v ' connected primary ' | cut -d' ' -f1)

      for s in $side; do
        MONITOR="$s" polybar main &
      done
      MONITOR="$main" polybar main &
    '';
  };
}
