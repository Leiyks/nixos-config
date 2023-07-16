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
      if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        tmux attach -t default 2>/dev/null || tmux new -s default
      fi
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
      "vim" = "lvim";
      "vi" = "lvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "history"
        "sudo"
        "last-working-dir"
        "zoxide"
        "colored-man-pages"
      ];
      theme = "robbyrussell";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "joshskidmore/zsh-fzf-history-search"; }
        { name = "djui/alias-tips"; }
        { name = "hlissner/zsh-autopair"; }
        { name = "birdhackor/zsh-exa-ls-plugin"; }
        { name = "chisui/zsh-nix-shell"; }
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
  };
}
