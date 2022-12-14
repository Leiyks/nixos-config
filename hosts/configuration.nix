{ config, inputs, lib, location, pkgs, user, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
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
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  console.keyMap = "fr";

  environment = {
    systemPackages = [ nvidia-offload ];
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "most";
    };
  };

  hardware = {
    enableAllFirmware = true;
    opengl = { enable = true; driSupport32Bit = true; };
    nvidia = {
      prime = {
        offload.enable = true;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };

      modesetting.enable = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
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

      videoDrivers = [ "nvidia" ];
      config = ''
        Section "Device"
            Identifier  "Intel Graphics"
            Driver      "intel"
            Option      "TearFree"        "true"
            Option      "SwapbuffersWait" "true"
            BusID       "PCI:0:2:0"
        EndSection

        Section "Device"
            Identifier "nvidia"
            Driver "nvidia"
            BusID "PCI:1:0:0"
            Option "AllowEmptyInitialConfiguration"
        EndSection
      '';
      screenSection = ''
        Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
        Option         "AllowIndirectGLXProtocol" "off"
        Option         "TripleBuffer" "on"
      '';
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

