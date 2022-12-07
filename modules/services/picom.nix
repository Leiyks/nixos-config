{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.xsession.enable) {

    # Only evaluate code if using X11
    services.picom = {
      enable = true;

      backend = "xrender";
      vSync = true;

      wintypes = {
        tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
        dock = { shadow = false; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 0.8; };
        dropdown_menu = { opacity = 0.8; };
      };

      ### Opacity ###

      activeOpacity = 0.9;
      inactiveOpacity = 0.75;
      opacityRules = [
        "100:class_g = 'firefox' && focused"
        "100:class_g = 'Brave-browser' && focused"
        "100:class_g = 'Code' && focused"
        "100:class_g = 'vlc' && focused"
        "100:class_g = 'discord' && focused"
        "100:class_g = 'Slack' && focused"
        "100:class_g = 'peek' && focused"
        "100:class_g = 'jetbrains-idea' && focused"
        "95:class_g = 'konsole' && focused"
        "75:class_g = 'konsole' && !focused"
      ];

      ### Fade ###

      fade = true;
      fadeDelta = 10;
      fadeSteps = [ 0.03 0.03 ];

      ### Fade ###

      shadow = true;
      shadowOffsets = [ (-2) (-2) ];
      shadowExclude = [
        "name = 'Notification'"
        "class_g *= 'conky'"
        "window_type *= 'normal' && ! name ~= ''"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      ### Extra settings ###

      settings = {
        daemon = true;
        use-damage = true;
        resize-damage = 1;
        refresh-rate = 0;
        corner-radius = 5;
        round-borders = 5;

        ### Blur ###

        # Parameters for background blurring
        blur-method = "dual_kawase";

        # xrender backend settings probably
        blur-deviation = true;

        # Blur background of semi-transparent / ARGB windows.
        # Bad in performance, with driver-dependent behavior.
        # The name of the switch may change without prior notifications.
        blur-background = true;

        # Specify the blur convolution kernel, with the following format:
        blur-kern = "5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1";


        # Exclude conditions for background blur.
        blur-background-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
          "_GTK_FRAME_EXTENTS@:c"
        ];

        detect-rounded-corners = true;
      };
    };
  };
}
