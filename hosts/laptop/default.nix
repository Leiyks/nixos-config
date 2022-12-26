{ config, pkgs, user, ... }:

{
  imports =
    [ /etc/nixos/hardware-configuration.nix ] ++
    (import ../../modules/system/virtualization) ++
    (import ../../modules/system/i3-plasma) ++
    (import ../../modules/system/hardware) ++
    (import ../../modules/system/krb5);

  boot = {
    kernelPackages = pkgs.linuxPackages_6_0;

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      timeout = 15;
    };
  };

  services = {
    blueman.enable = true;
    asusd.enable = true;
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware.nvidia = {
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
    modesetting.enable = true;
  };
}
