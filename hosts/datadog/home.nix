{ pkgs, ... }:

{
  # Specific packages for WSL
  home = {
    packages = with pkgs; [
      rustup
    ];

    sessionPath = [

    ];
  };

  programs.zsh.initExtra = ''
      # printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c' && clear
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      umask u=rwx,g=rwx,o=rwx
    '';
}

