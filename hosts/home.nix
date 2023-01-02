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
      neofetch

      # Video/Audio
      feh
      vlc

      # Apps
      brave
      firefox
      slack
      discord
      arandr
      xsel # Usefull and needed for neovim clipboard
      ripgrep

      # File Management
      unzip
      unrar

      # Languages
      poetry
      (python3.withPackages (p: [ p.pip p.black p.pytest ]))
      jq
      nixpkgs-fmt
      rnix-lsp
      nodejs
      clang-tools_14
      gcc.out
      go
      gnumake
      cargo

      # Editors
      jetbrains.idea-ultimate
      vscode

      # System
      refind
      efibootmgr
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
