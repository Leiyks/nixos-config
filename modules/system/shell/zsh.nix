{ pkgs, ... }:

{
  programs.command-not-found.enable = false;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
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
      "restish" = "noglog restish";
      "cat" = "bat";
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
        "last-working-dir"
        "zoxide"
        "colored-man-pages"
      ];
      theme = "robbyrussell";
    };
  };
}
