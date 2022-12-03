{ pkgs, ... }:

{
  imports = (../../modules/desktop);

  # Specific packages for laptop
  home = {
    packages = with pkgs; [ ];
  };

  file.".config/wallpaper.jpg".source = ../modules/themes/laptop_wallpaper.jpg;

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };
}
