{ config, pkgs, ... }:
# Laptop configuration
{
  imports = [
    # packages
    ../pkgs/common_packages.nix

    # apps
    ../pkgs/git.nix
    (import ../pkgs/i3-plasma.nix { modifier = "Mod4"; })
    (import ../pkgs/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../pkgs/vim.nix
    ../pkgs/zsh.nix

    # services
    ../pkgs/polybar.nix
  ];
}
