{ config, pkgs, ... }:
# Packages to install
{
  home.packages = with pkgs; [
    # Shell utilities
    tree
    bat

    # Node
    nodejs

    # Nix formatter
    nixpkgs-fmt
    rnix-lsp

    # yaml formatter
    nodePackages.markdownlint-cli

    # Json
    jq

    # Python
    poetry
    python310

    brave
    discord
    slack
  ];
}
