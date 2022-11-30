{ config, pkgs, ... }:
# ZSH configuration
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    history = {
      ignoreSpace = true;
      extended = true;
    };

    initExtra = ''
      export LESS=-iXFR
    '';

    oh-my-zsh = {
      enable = true;
      theme = "bapt";
      custom = "${../assets/zsh-custom}";
      plugins = [ "ssh-agent" "fzf" ];
    };
  };
}
