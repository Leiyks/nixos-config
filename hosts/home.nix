{ config, lib, pkgs, user, ... }:

{
  imports = [ ];
  # TODO: uncomment when modules are done
  # imports = (../modules/services) ++ (../modules/programs) ++ (../modules/editors);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # Terminal
      htop # Resource Manager
      ranger # File Manager
      tldr # Helper

      # Video/Audio
      feh # Image Viewer
      vlc # Media Player

      # Apps
      appimage-run # Runs AppImages on NixOS
      brave # Browser
      firefox # Browser
      slack # Communication

      # File Management
      unzip # Zip Files
      unrar # Rar Files
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
