{ config, pkgs, ... }:
# BaptComp Laptop configuration
{
  imports = [
    # packages
    ../pkgs/common_packages.nix
    # apps
    ../pkgs/fzf.nix
    ../pkgs/git.nix
    (import ../pkgs/i3-plasma.nix { modifier = "Mod4"; })
    ../pkgs/slrn.nix
    (import ../pkgs/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../pkgs/vim.nix
    ../pkgs/zsh.nix
    # services
    ../pkgs/picom.nix
    ../pkgs/polybar.nix
  ];
}
