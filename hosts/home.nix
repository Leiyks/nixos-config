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
      ### Terminal ###
      htop
      ranger
      tldr
      tree
      bat
      zoxide
      neofetch
      nushell

      ### Video/Audio ###
      feh
      vlc

      ### Apps ###
      brave
      firefox
      slack
      discord
      arandr

      ### File Management ###
      unzip
      unrar

      ### Languages ###
      # Python
      poetry
      (python3.withPackages (p: [ p.pip p.black p.pytest ]))

      # Json
      jq

      # Nix
      nixpkgs-fmt
      rnix-lsp

      # NodeJs
      nodejs
      nodePackages.pnpm

      # C/C++
      clang-tools_14
      gcc.out
      gnumake

      # Golang
      go

      # Rust
      cargo

      ### Editors ###
      jetbrains.idea-ultimate
      vscode

      # Lunar vim dependencies
      ripgrep
      fd
      xsel

      ### System ###
      refind
      efibootmgr
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
