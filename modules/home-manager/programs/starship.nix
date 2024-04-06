{
  programs.starship = {
    enable = true;

    settings = {
      format =
        "$username$hostname$localip$shlvl$singularity$kubernetes$directory$vcsh$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$swift$terraform$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$fill$battery$cmd_duration$time$memory_usage$line_break$jobs$status$os$container$shell$character";

      cmd_duration = {
        format = "took [$duration 󱦟]($style) ";
      };
      fill = {
        symbol = " ";
        style = "";
      };

      shell = {
        disabled = false;
        format = "[$indicator]($style)";
        style = "cyan";
        zsh_indicator = "";
        bash_indicator = "bash ";
        nu_indicator = "nu ";
      };

      status = {
        disabled = false;
        format = "[$symbol ($maybe_int )]($style)";
        symbol = "";
        not_executable_symbol = "󰂭";
        not_found_symbol = "󰍉";
        sigint_symbol = "󰟾";
        signal_symbol = "";
        style = "bold red";
        map_symbol = true;
      };

      time = {
        disabled = false;
        format = "at [$time 🕙]($style)";
      };

      # Nerdfont
      aws.symbol = " ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
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
      meson.symbol = "喝 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      spack.symbol = "🅢 ";
    };
  };
}
