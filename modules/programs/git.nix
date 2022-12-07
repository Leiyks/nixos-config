{ config, pkgs, ... }:
# Git configuration
{
  programs.git = {
    enable = true;

    userName = "Alexandre Rulleau";
    userEmail = "alexandre.rulleau@epita.fr";

    difftastic = {
      enable = true;
      background = "dark";
      display = "inline";
    };

    lfs.enable = true;

    aliases = {
      st = "status";
      sw = "switch";
      sc = "switch -c";
      b = "branch";
      cb = "checkout -b";
      ch = "checkout";
      mgt = "mergetool";
      pushft = "push --follow-tags";
      pushwl = "push --force-with-lease";
      pushff = "push --force";
      alog = "log --oneline --graph --all --decorate";
      tlog = "log --oneline --graph --decorate -n 15";
      nlog = "log --oneline --graph --decorate";
    };

    extraConfig = {
      pull.ff = "only";
      push.merge = true;
      commit.verbose = true;

      rebase = {
        autoStash = true;
        autoSquash = true;
      };

      merge.tool = "fugitive";
      mergetool."fugitive" = ''vim -f -c '"set nocursorline"' -c '":set wrap"' -c "Gvdiffsplit!" "$MERGED"'';

      core = {
        editor = "vim";
        autocrlf = "input";
      };
    };
  };
}
