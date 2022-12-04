{ config, inputs, lib, location, pkgs, user, ... }:

{
  imports = (import ../modules/shell);

  # User definition
  users = {
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "lp" "kvm" "libvirtd" "plex" ];
      initialPassword = "password";
    };

    defaultUserShell = pkgs.zsh;
  };

  # User does not need to give password when using sudo.
  security.sudo.wheelNeedsPassword = false;

  # Time zone and internationalisation
  time.timeZone = "Europe/Paris";

  # Locales settings
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.utf8";
      LC_IDENTIFICATION = "fr_FR.utf8";
      LC_MEASUREMENT = "fr_FR.utf8";
      LC_MONETARY = "fr_FR.utf8";
      LC_NAME = "fr_FR.utf8";
      LC_NUMERIC = "fr_FR.utf8";
      LC_PAPER = "fr_FR.utf8";
      LC_TELEPHONE = "fr_FR.utf8";
      LC_TIME = "fr_FR.utf8";
    };
  };

  security.rtkit.enable = true;

  # Fonts Definition
  fonts.fonts = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  console = {
    keyMap = "fr";
  };

  environment = {
    # Environment variables
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "most";
    };
  };

  # Services definition
  services = {
    # Sound settings
    pipewire = {
      enable = true;
      alsa = { enable = true; support32Bit = true; };
      pulse.enable = true;
      jack.enable = true;
    };

    xserver = {
      enable = true;
      # TODO: Enable when the config is finished
      # videoDrivers = [ "nvidia" ];
      # Keyboard layout
      layout = "fr,us";
      # Enable touchpad support
      libinput.enable = true;
    };
  };

  nix = {
    # Nix Package Manager settings
    settings = {
      auto-optimise-store = true;
    };

    # Garbage collector settings
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };

    # Enable nixFlakes on system
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # Allow proprietary software.
  nixpkgs.config.allowUnfree = true;

  system = {
    # NixOS settings
    autoUpgrade = {
      # Allow auto update (not useful in flakes)
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    # You should not modify this by hand !
    stateVersion = "22.05";
  };
}
