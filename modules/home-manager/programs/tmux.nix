{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "xterm-256color";
    escapeTime = 0;
    keyMode = "vi";

    extraConfig = builtins.readFile ../../../assets/tmux/tmux.conf;

    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "
            set -g @catppuccin_window_status_enable 'yes'
            set -g @catppuccin_window_left_separator ''
            set -g @catppuccin_window_right_separator ' '
            set -g @catppuccin_window_middle_separator ' █'
            set -g @catppuccin_window_number_position 'right'

            set -g @catppuccin_window_default_fill 'number'
            set -g @catppuccin_window_default_text '#W'

            set -g @catppuccin_window_current_fill 'number'
            set -g @catppuccin_window_current_text '#W'

            set -g @catppuccin_status_modules 'directory session user host'
            set -g @catppuccin_status_left_separator  ' '
            set -g @catppuccin_status_right_separator ''
            set -g @catppuccin_status_connect_separator 'no'
            set -g @catppuccin_directory_text '#{pane_current_path}'
        ";
      }
    ];
  };
}
