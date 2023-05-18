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
      OPENAI_API_KEY = "${builtins.readFile ~/.chatgpt_token}";
    };

    file.".config/wallpaper.jpg".source = ../../assets/themes/laptop_wallpaper.jpg;
    file.".screenlayout/script.sh".source = ../../assets/desktop/screen_script_laptop.sh;
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };
}
