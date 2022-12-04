{ pkgs, ... }:

{
  imports = [ (import ../../modules/desktop/i3-plasma/home.nix) ];

  # Specific packages for laptop
  home = {
    packages = with pkgs; [ ];
    file.".config/wallpaper.jpg".source = ../../assets/themes/laptop_wallpaper.jpg;
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };
}
