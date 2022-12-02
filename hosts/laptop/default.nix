{ config, pkgs, user, ... }:

{
  imports = [ (import ./hardware-configuration.nix) ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      # TODO: Modify when setting laptop
      # efi = {
      #   canTouchEfiVariables = true;
      #   efiSysMountPoint = "/boot";
      # };

      grub = {
        enable = true;
        version = 2;
        theme = pkgs.nixos-grub2-theme;
        devices = [ "/dev/sda" ];
	# TODO: Modify when setting laptop
        # efiSupport = true;
        useOSProber = true;
        enableCryptodisk = true;
        configurationLimit = 2;
      };

      timeout = 1;
    };
  };

  services = {
    # TODO: Modify when setting laptop
    # tlp.enable = true;
    blueman.enable = true;
  };
}
