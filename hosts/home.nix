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

      # File Management
      unzip
      unrar

      # Languages
      poetry
      python310
      jq
      nixpkgs-fmt
      rnix-lsp
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
