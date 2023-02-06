{ config, lib, pkgs, host, ... }:

let
  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    mpdSupport = true;
    pulseSupport = true;
    i3Support = true;
  };
in
with host; {
  config = lib.mkIf (config.xsession.enable) {
    services = {
      polybar = {
        enable = true;
        package = mypolybar;

        script = ''
          export PATH="$PATH:${pkgs.gnugrep}/bin:${pkgs.gawk}/bin:${pkgs.coreutils}/bin:${pkgs.gnused}/bin"
          polybar main &
          polybar sec &
        '';

        config = {
          "bar/main" = {
            monitor = "${mainMonitor}";

            width = "100%";
            height = 35;

            background = "#00000000";
            foreground = "#fff";

            fixed-center = true;

            font-0 = "HackNerdFont:size=14;4";

            modules-left = "logo sep i3 sep title";
            modules-center = "date";
            modules-right = "backlight sep storage pad memory pad cpu sep mic pad volume sep battery";

            wm-restack = "i3";
          };

          "bar/sec" = {
            monitor = "${secondMonitor}";
            monitor-strict = true;

            width = "100%";
            height = 35;

            background = "#00000000";
            foreground = "#fff";

            fixed-center = true;

            font-0 = "HackNerdFont:size=14;4";

            modules-left = "logo sep i3";
            modules-center = "date";
            modules-right = "backlight sep storage pad memory pad cpu sep mic pad volume sep battery";

            wm-restack = "i3";
          };

          "module/storage" = {
            # Display storage percentage
            type = "internal/fs";
            mount-0 = "/";
            interval = 10;
            fixed-values = true;

            format-mounted = "<label-mounted>";
            format-mounted-prefix = "  ";

            format-unmounted = "<label-unmounted>";
            format-unmounted-prefix = "  ";
            format-unmounted-prefix-foreground = "#f53c3c";

            label-mounted = "%free%";
            label_warn = "%{F#ffa900}%free%";
            label-unmounted = "%mountpoint%: NA";
          };

          "module/memory" = {
            # Display RAM level
            type = "internal/memory";
            format = "<label>";
            format-foreground = "#fff";
            label = "  %percentage_used%%";
          };

          "module/cpu" = {
            # Display CPU level
            type = "internal/cpu";
            interval = 1;
            format = "<label>";
            format-foreground = "#fff";
            label = "  %percentage%%";
          };

          "module/volume" = {
            # Display volume bar
            type = "internal/pulseaudio";
            interval = 2;
            use-ui-max = "false";
            format-volume = "<ramp-volume>  <label-volume>";
            label-muted = "  muted";
            label-muted-foreground = "#999";

            ramp-volume-0 = "";
            ramp-volume-1 = "";
            ramp-volume-2 = "";

            # Right click opens pavucontrol, left click mutes, scroll changes levels
            click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
          };

          "module/backlight" = {
            # Show screen brightnesss
            type = "internal/backlight";
            card = "intel_backlight";
            format = "<ramp> <bar>";

            ramp-0 = "";
            ramp-1 = "";
            ramp-2 = "";

            bar-width = 7;
            bar-indicator = "";
            bar-indicator-font = 3;
            bar-indicator-foreground = "#ff";

            bar-fill = "─";
            bar-fill-font = 3;
            bar-fill-foreground = "ff";

            bar-empty = "─";
            bar-empty-font = 3;
            bar-empty-foreground = "#44";
          };

          "module/battery" = {
            # Show battery (only when exist), uncomment to show battery and animations
            type = "internal/battery";
            full-at = 98;

            label-full = " %percentage%% ";
            label-charging = " %percentage%% ";
            label-discharging = " %percentage%% ";

            format-charging = "<animation-charging> <label-charging> ";
            format-discharging = "<ramp-capacity> <label-discharging> ";
            format-full = "<ramp-capacity> <label-full> ";

            ramp-capacity-0 = "";
            ramp-capacity-0-foreground = "#f53c3c";
            ramp-capacity-1 = "";
            ramp-capacity-1-foreground = "#ffa900";
            ramp-capacity-2 = "";
            ramp-capacity-3 = "";
            ramp-capacity-4 = "";

            bar-capacity-width = 10;
            bar-capacity-format = "%{+u}%{+o}%fill%%empty%%{-u}%{-o}";
            bar-capacity-fill = "█";
            bar-capacity-fill-foreground = "#ddffffff";
            bar-capacity-fill-font = 3;
            bar-capacity-empty = "█";
            bar-capacity-empty-font = 3;
            bar-capacity-empty-foreground = "#44ffffff";

            animation-charging-0 = ""; # Animation when charging
            animation-charging-1 = "";
            animation-charging-2 = "";
            animation-charging-3 = "";
            animation-charging-4 = "";
            animation-charging-framerate = 750;
          };

          "module/date" = {
            # Time/Date  Day-Month-Year Hour:Minute
            type = "internal/date";
            date = "  %%{F#999}%d-%m-%Y%%{F-} %%{F#fff}%H:%M%%{F-}";
          };

          "module/i3" = {
            # i3 Workspaces
            type = "internal/i3";
            pin-workspace = true;

            ws-icon-0 = "1;";
            ws-icon-1 = "2;";
            ws-icon-2 = "3;";
            ws-icon-3 = "4;";
            ws-icon-4 = "5;";
            ws-icon-5 = "6;";
            ws-icon-6 = "7;";
            ws-icon-7 = "8;";
            ws-icon-default = "";

            format = "<label-state> <label-mode>";

            label-dimmed-underline = "#ccffffff";

            label-separator = " ";

            label-unfocused-foreground = "#999";
            label-visible-foreground = "#999";

            label-focused-foreground = "#fff";
            label-focused-background = "#773f3f3f";
            label-focused-underline = "#c9665e";
            label-focused-font = 4;
            label-focused-padding = 1;

            label-occupied-foreground = "#ddd";
            label-occupied-underline = "#666";
            label-occupied-font = 4;
            label-occupied-padding = 1;

            label-urgent-foreground = "#000000";
            label-urgent-background = "#bd2c40";
            label-urgent-underline = "#9b0a20";
            label-urgent-font = 4;
            label-urgent-padding = 1;

            label-empty-foreground = "#55";
            label-empty-font = 4;
            label-empty-padding = 1;

            label-monocle = "M";
            label-monocle-underline = "#c9665e";
            label-monocle-background = "#33ffffff";
            label-monocle-padding = 1;

            label-locked = "L";
            label-locked-foreground = "#bd2c40";
            label-locked-underline = "#c9665e";
            label-locked-padding = 1;

            label-sticky = "S";
            label-sticky-foreground = "#fba922";
            label-sticky-underline = "#c9665e";
            label-sticky-padding = 1;

            label-private = "P";
            label-private-foreground = "#bd2c40";
            label-private-underline = "#c9665e";
            label-private-padding = 1;
          };

          "module/title" = {
            # Show title of active screen
            type = "internal/xwindow";
            format = "<label>";
            format-background = "#00000000";
            format-foreground = "#fff";
            label = "%title%";
            label-maxlen = 75;
            label-empty = "";
            label-empty-foreground = "#fff";
          };

          "module/mic" = {
            # Mute / unmute mic
            type = "custom/script";
            interval = 1;
            tail = "true";
            exec = "~/.config/polybar/script/mic.sh status";
            click-left = "~/.config/polybar/script/mic.sh toggle";
          };

          "module/logo" = {
            # Display the NixOs logo
            type = "custom/text";
            content = " %{F#a7c7e7}";
          };

          "module/sep" = {
            type = "custom/text";
            content = "  %{F#666}|  ";
          };

          "module/pad" = {
            type = "custom/text";
            content = "  ";
          };
        };
      };
    };

    home.file.".config/polybar/script/mic.sh" = {
      # Custom script: Mic mute
      text = ''
        #!/bin/sh

        case $1 in
            "status")

            MUTED=$(${pkgs.alsa-utils}/bin/amixer sget Capture | grep '\[on\]')

            if [[ -z "$MUTED" ]]; then
                echo ''
            else
                echo ''
            fi
            ;;
            "toggle")
            ${pkgs.alsa-utils}/bin/amixer set Capture toggle
            ;;
        esac
      '';
      executable = true;
    };
  };
}
