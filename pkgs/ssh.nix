{ sshDir }:
# SSH config
#
# Args:
# - sshDir: path to the .ssh dir
#
{ config, pkgs, ... }:
let
  cri_key = sshDir + "/cri_key";
in
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      SendEnv EDITOR
    '';
    matchBlocks = {
      "git.assistants.epita.fr" = {
        identityFile = cri_key;
      };

      "git.forge.epita.fr" = {
        identityFile = cri_key;
      };

      "gitlab.cri.epita.fr" = {
        identityFile = sshDir + "/gitlab_cri_key";
      };

      "github.com" = {
        identityFile = sshDir + "/github_key";
      };

      "ssh.cri.epita.fr" = {
        extraOptions = {
          GSSAPIAuthentication = "yes";
          GSSAPIDelegateCredentials = "yes";
        };
      };
    };
  };
}
