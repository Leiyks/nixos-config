{ config, pkgs, ... }:
# Setting the configuration to load
{
  imports = [
    ./machines/baptcomp.nix
  ];
}
