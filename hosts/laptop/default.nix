{ config, pkgs, user, ... }:

{
  imports =
    [ /etc/nixos/hardware-configuration.nix ] ++
    [ (import ../../modules/desktop/i3-plasma/default.nix) ] ++
    (import ../../modules/desktop/virtualization) ++
    (import ../../modules/hardware);

  boot = {
    kernelPackages = pkgs.linuxPackages_6_0;

    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      timeout = 15;
    };
  };

  services = {
    blueman.enable = true;
  };
}
