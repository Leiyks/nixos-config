{ config, pkgs, ... }:
# Git configuration
{
  programs.git = {
    enable = true;

    userName = "Alexandre Rulleau";
    userEmail = "alexandre.rulleau@epita.fr";

    extraConfig = {
      pull.ff = "only";

      push = {
        default = "simple";
        merge = true;
      };

      commit.verbose = true;

      rebase = {
        autoStash = true;
        autoSquash = true;
      };

      merge.tool = "fugitive";
      mergetool."fugitive" = ''vim -f -c '"set nocursorline"' -c '":set wrap"' -c "Gvdiffsplit!" "$MERGED"'';

      core = {
        # Default editor
        editor = "vim";
        # Handle the CRLF convertion on commit
        autocrlf = "input";
        # Make git warn you about whitespace issues
        whitespace = "warn,trailing-space,tab-in-indent";
      };

      log.abbrevCommit = true;
    };
  };
}
