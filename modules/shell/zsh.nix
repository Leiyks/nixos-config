{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 100000;

    shellAliases = {
      "cd" = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "ll" = "ls -lhAa --color=auto";
      "restish" = "noglog restish";
      "cat" = "bat";
      "nix-shell" = "nix-shell --command 'exec zsh; return'";
    };

    ohMyZsh = {
      enable = true;
      plugins = [
	"command-not-found"
        "git"
	"sudo"
	"ssh-agent"
	"zoxide"
      ];
      theme = "robbyrussell";
    };
  };
}
