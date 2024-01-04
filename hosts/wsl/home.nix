{ pkgs, ... }:

{
  # Specific packages for WSL
  home = {
    packages = with pkgs; [
      glib.out
      zlib
    ];
  };

  programs.zsh.initExtra = ''
    /mnt/c/Program\ Files\ \(x86\)/GnuPG/bin/gpg-connect-agent.exe /bye &> /dev/null

    source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
      tmux attach -t default 2>/dev/null || tmux new -s default
    fi
  '';

  programs.git = {
    extraConfig.core = {
      sshcommand = "'/mnt/c/Program Files/PuTTY/plink.exe' -agent";
    };

    signing.gpgPath = "/mnt/c/Program Files (x86)/GnuPG/bin/gpg.exe";
  };
}
