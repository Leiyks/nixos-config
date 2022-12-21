{ config, pkgs, user, ... }:

{
  imports =
    [ /etc/nixos/hardware-configuration.nix ] ++
    (import ../../modules/system/virtualization) ++
    (import ../../modules/system/i3-plasma) ++
    (import ../../modules/system/hardware) ++
    (import ../../modules/system/krb5);

  boot = {
    kernelParams = [
      "acpi_rev_override"
      "mem_sleep_default=deep"
      "intel_iommu=igfx_off"
      "nvidia-drm.modeset=1"
    ];

    kernelPackages = pkgs.linuxPackages_6_0;
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 42;
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
