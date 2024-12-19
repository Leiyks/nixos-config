{ pkgs, ... }:

{
  # Specific packages for WSL
  home = {
    packages = with pkgs; [
      glib.out
      zlib
    ];

    sessionPath = [
    ];
  };
}
