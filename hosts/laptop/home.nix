{ pkgs, ... }:

{
  imports = [ ]; # (../../modules/desktop);

  # Specific packages for laptop
  home = {
    packages = with pkgs; [ ];
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };
}
