{ config, lib, pkgs, user, ... }:

{
  imports = [ ];

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

    # TODO: Put this in the laptop home.nix file.
    file.".config/wallpaper.jpg".source = ../modules/themes/laptop_wallpaper.jpg;

    pointerCursor = {
      # This will set cursor system-wide so applications can not choose their own
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 16;
    };

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
