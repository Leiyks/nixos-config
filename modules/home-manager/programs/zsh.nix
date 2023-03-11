{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    zplug = {
      enable = true;
      plugins = [
        { name = "joshskidmore/zsh-fzf-history-search"; }
        { name = "djui/alias-tips"; }
        { name = "hlissner/zsh-autopair"; }
        { name = "birdhackor/zsh-exa-ls-plugin"; }
        { name = "Aloxaf/fzf-tab"; }
        { name = "chisui/zsh-nix-shell"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        # { name = "MenkeTechnologies/zsh-expand"; }
      ];
    };
  };
}
