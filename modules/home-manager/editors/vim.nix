{ pkgs, globalPkgDir, ... }:
let
  lvim-init = pkgs.writeShellScriptBin "lvim-init" ''
    curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | LV_BRANCH='release-1.2/neovim-0.8' bash /dev/stdin --yes --no-install-dependencies && cp ${../../../assets/vim/config.lua} ~/.config/lvim/config.lua
  '';
in
{
  home.packages = [ lvim-init ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [ gcc rnix-lsp tree-sitter ];
  };

  home.file.config = {
    text = builtins.readFile ../../../assets/vim/config.lua;
    target = ".config/lvim/config.lua";
  };
}
