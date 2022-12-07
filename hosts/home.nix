{ config, lib, pkgs, user, ... }:

{
  imports =
    (import ../modules/editors) ++
    (import ../modules/services) ++
    (import ../modules/programs);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # Terminal
      htop
      ranger
      tldr
      tree
      bat
      most
      zoxide

      # Video/Audio
      feh
      vlc

      # Apps
      brave
      firefox
      slack
      discord
      arandr

      # File Management
      unzip
      unrar

      # Languages
      poetry
      python310
      jq
      nixpkgs-fmt
      rnix-lsp
      nodejs

      # Editors
      jetbrains.idea-ultimate
      vscode
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
