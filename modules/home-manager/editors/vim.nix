{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile ../../../assets/vim/vimrc;
    viAlias = true;
    vimAlias = true;
  };

  # Vim files in home
  # Settings for CocNvim plugin
  home.file.coc-settings = {
    text = builtins.readFile ../../../assets/vim/coc-settings.json;
    target = ".config/nvim/coc-settings.json";
  };

  # Vim plug to install other plugins, I currently prefer to rely on vim-plug
  # rather than pkgs.vimPlugins, it is easier for me.
  home.file.vim_plug = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
      sha256 = "sha256-4tvXyNcyrnl+UFnA3B6WS5RSmjLQfQUdXQWHJ0YqQ/0=";
    };
    target = ".local/share/nvim/site/autoload/plug.vim";
  };
}
