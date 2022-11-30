{ config, pkgs, ... }:
# Slrn configuration
{
  home.packages = [
    pkgs.slrn
  ];
  # SLRN configuration file
  home.file = {
    ".slrnrc" = {
      source = ../assets/config/slrnrc;
    };
  };
}
