{ pkgs, ... }:
let
  extraPackages = with pkgs; [
    # General dependencies
    git
    gcc
    tree-sitter

    luarocks
    cargo
    ripgrep
    fd

    php
    php.packages.composer
    powershell

    xsel
    lazygit
  ];
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    plugins = with pkgs; [
      vimPlugins.nvim-treesitter.withAllGrammars
    ];
    inherit extraPackages;
  };

  home.file.".config/nvim/lua" = {
    source = ../../../assets/lazyvim/lua;
  };

  home.file.".config/nvim/init.lua" = {
    source = ../../../assets/lazyvim/init.lua;
  };
}
