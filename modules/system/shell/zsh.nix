{ pkgs, ... }:

{
  programs.command-not-found.enable = false;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 100000;

    zsh-autoenv.enable = true;
    interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';

    shellAliases = {
      "cd" = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "ll" = "ls -lhAa --color=auto";
      "restish" = "noglog restish";
      "cat" = "PAGER=most bat";
      "nix-shell" = "nix-shell --command 'exec zsh; return'";
      "gcans!" = "git commit -v -a -s -S --no-edit --amend";
      "gcns!" = "git commit -v -s -S --no-edit --amend";
      "vim" = "lvim";
      "vi" = "lvim";
    };

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "history"
        "sudo"
        "ssh-agent"
        "last-working-dir"
        "zoxide"
      ];
      theme = "robbyrussell";
    };
  };
}
