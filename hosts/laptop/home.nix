{ pkgs, ... }:

{
  imports = (import ../../modules/home-manager/i3-plasma);

  # Specific packages for laptop
  home = {
    packages = with pkgs; [
      glib.out
      zlib
    ];

    sessionVariables = {
      LD_LIBRARY_PATH =
        "\${LD_LIBRARY_PATH}:${pkgs.glib.out}/lib:${pkgs.zlib}/lib";
    };

    file.".config/wallpaper.jpg".source = ../../assets/themes/laptop_wallpaper.jpg;
    file.".screenlayout/script.sh".source = ../../assets/desktop/screen_script_laptop.sh;
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };
}
