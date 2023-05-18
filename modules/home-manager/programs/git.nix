{ config, pkgs, ... }:
# Git configuration
{
  programs.git = {
    enable = true;

    userName = "Alexandre Rulleau";
    userEmail = "rulleaualexandre@gmail.com";

    signing = {
      key = "7FDEC26163735BB1";
      signByDefault = true;
    };

    difftastic = {
      enable = true;
      background = "dark";
      display = "side-by-side-show-both";
      color = "always";
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
      init.defaultBranch = "main";

      push = {
        merge = true;
        autoSetupRemote = true;
      };
      commit.verbose = true;

      rebase = {
        autoStash = true;
        autoSquash = true;
      };

      core = {
        editor = "lvim";
        autocrlf = "input";
        pager = "LESS=FRX less";
      };
    };
  };
}
