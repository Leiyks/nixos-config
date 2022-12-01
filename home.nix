{ config, pkgs, ... }:

{
  imports = [
    ./computers/laptop.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "leiyks";
  home.homeDirectory = "/home/leiyks";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  nixpkgs.config.allowUnfree = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    zsh.enable = true;
  };
}
