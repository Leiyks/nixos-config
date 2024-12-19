{ pkgs, ... }:

{
  programs.command-not-found.enable = false;
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history.size = 100000;

    initExtra = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
      # if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$NOTMUX" ]; then
      #   tmux attach -t default 2>/dev/null || tmux new -s default
      # fi
    '';

    shellAliases = {
      "cd" = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "restish" = "noglog restish";
      "cat" = "bat";
      "gcans!" = "git commit -v -a -s -S --no-edit --amend";
      "gcns!" = "git commit -v -s -S --no-edit --amend";
      "ls"="eza --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale all";
      "l" = "eza --git-ignore --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale all";
      "ll" = "eza --all --header --long --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale all";
      "llm" = "eza --all --header --long --sort=modified --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale all";
      "la" = "eza -lbhHigUmuSa";
      "lx" = "eza -lbhHigUmuSa@";
      "lt" = "eza --tree --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale all";
      "tree" = "eza --tree --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale all";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "last-working-dir"
        "zoxide"
        "colored-man-pages"
        "kubectl"
      ];
      theme = "robbyrussell";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "djui/alias-tips"; }
        { name = "hlissner/zsh-autopair"; }
        { name = "chisui/zsh-nix-shell"; }
        { name = "unixorn/docker-helpers.zshplugin"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "se-jaeger/zsh-activate-py-environment"; }
      ];
    };
  };
}
