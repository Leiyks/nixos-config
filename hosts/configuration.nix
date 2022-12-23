{ config, inputs, lib, location, pkgs, user, ... }:

{
  imports = (import ../modules/system/shell);

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

  networking.networkmanager = { enable = true; wifi.backend = "iwd"; };

  # Time zone and internationalisation
  time.timeZone = "Europe/Paris";

  # Locales settings
  i18n = {
    defaultLocale = "en_GB.UTF-8";
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
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
  ];

  console.keyMap = "fr";

  environment = {
    systemPackages = [ ];
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "most";
    };
  };

  sound.mediaKeys.enable = true;

  # Services definition
  services = {
    # Sound settings
    pipewire = {
      enable = true;
      alsa = { enable = true; support32Bit = true; };
      pulse.enable = true;
      jack.enable = true;
    };

    # Needed for VScode
    gnome.gnome-keyring.enable = true;

    getty.autologinUser = user;

    xserver = {
      enable = true;

      layout = "fr,us";

      libinput.enable = true;
    };
  };

  nix = {
    # Nix Package Manager settings
    settings.auto-optimise-store = true;

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

  system.stateVersion = "22.05";
}

