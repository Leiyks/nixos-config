{
  programs.starship = {
    enable = true;

    settings = {

      shell = {
        disabled = false;
        format = "[$indicator]($style)";
        style = "cyan";
        zsh_indicator = "";
        bash_indicator = '' bash ❯ '';
        nu_indicator = '' nu ❯ '';
      };

      status = {
        disabled = false;
        symbol = ''❌$status'';
        success_symbol = ''$status(white)'';
        not_executable_symbol = ''🚫$status'';
        not_found_symbol = ''🔍$status'';
        sigint_symbol = ''🧱$status'';
        signal_symbol = ''⚡$status'';
        style = ''bold red'';
      };

      time = {
        disabled = false;
        format = "🕙[$time]($style)";
      };

      # Nerdfont
      aws.symbol = "  ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      haskell.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = " ";
      meson.symbol = "喝 ";
      nim.symbol = " ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = " ";
      python.symbol = " ";
      rlang.symbol = "ﳒ ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      spack.symbol = "🅢 ";
    };
  };
}
