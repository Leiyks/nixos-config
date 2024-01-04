{ pkgs, ... }:

{

  programs.tmux = {
    enable = true;

    terminal = "xterm-256color";
    escapeTime = 0;

    extraConfig = builtins.readFile ../../../assets/tmux/tmux.conf;

    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.power-theme;
        extraConfig = "set -g @tmux_power_theme 'moon'";
      }
    ];
  };
}
