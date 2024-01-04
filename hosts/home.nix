{ config, lib, pkgs, user, ... }:

{
  imports =
    (import ../modules/home-manager/editors) ++
    (import ../modules/home-manager/programs);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      ### Terminal ###
      htop
      ranger
      tldr
      eza
      bat
      zoxide
      neofetch
      nushell
      wget
      pre-commit

      ### File Management ###
      unzip
      unrar

      ### Languages ###
      # Python
      poetry
      (python3.withPackages (p: [
        p.pip
        p.black
        p.pytest
        p.mypy
        p.isort
      ]))
      pyright

      # Json
      jq

      # NodeJs
      nodejs
      nodePackages.pnpm

      # C/C++
      clang-tools_14
      gcc.out
      gnumake

      # Golang
      go

      # Java
      openjdk17
      maven
    ];

    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
