{ config, pkgs, user, ... }:

{
  imports =
    [ /etc/nixos/hardware-configuration.nix ] ++
    (import ../../modules/system/virtualization) ++
    (import ../../modules/system/i3-plasma) ++
    (import ../../modules/system/hardware) ++
    (import ../../modules/system/krb5);

  boot = {
    kernelPackages = pkgs.linuxPackages_6_1;

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      timeout = 15;
    };

    extraModprobeConfig = ''
      options snd-hda-intel patch=hda-jack-retask.fw
    '';

  };

  services = {
    blueman.enable = true;
    asusd.enable = true;
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };

  # Needed for specific projects
  programs.fuse.userAllowOther = true;
  networking.extraHosts = ''
    127.0.0.1 minio
  '';

  hardware = {
    nvidia = {
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
      modesetting.enable = true;
    };

    # Fix of the bad sound quality.
    # WARNING: The '/lib/firmware' folder must be created.
    firmware = [
      (pkgs.runCommand "jack-retask" { } ''
        install -D ${../../assets/misc/hda-jack-retask.fw} $out/lib/firmware/hda-jack-retask.fw
      '')
    ];
  };
}
