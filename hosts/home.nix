{ config, lib, pkgs, user, ... }:

{
  imports =
    (import ../modules/home-manager/editors) ++
    (import ../modules/home-manager/services) ++
    (import ../modules/home-manager/programs);

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
      (python3.withPackages (p: [ p.pip ]))
      jq
      nixpkgs-fmt
      rnix-lsp
      nodejs

      # Editors
      jetbrains.idea-ultimate
      vscode

      # System
      nix-index
      refind
      efibootmgr
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
