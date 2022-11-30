# BaptNix

Nix configuration for a [Nixos](https://nixos.org/) environment with
[home-manager](https://github.com/nix-community/home-manager).

## Installation

Install `nixos` on your machine.

Update the channels to go in `unstable`.

```bash
$ sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
$ sudo nix-channel --update
```

Clone this repository at `~/.config/nixpkgs`

Change the `/etc/nixos/configuration.nix` file. Either use the generated one or
use the one in [`system/`](./system) for the `nixos-rebuild` command.

```bash
$ sudo nixos-rebuild -I <path> switch --upgrade
```

Install [home-manager](https://github.com/nix-community/home-manager).

Specify the machine to use in the [`local.nix`](./local.nix) file.

Run `home-manager`.

```bash
$ home-manager switch
```

## Structure

```bash
$ tree
.
├── assets/     # asset config or files not written in nix
├── home.nix    # main file for home-manager
├── local.nix   # local file to specify which machine to install
├── machines    # machines available to install
├── pkgs        # package configuration
├── README.md
└── system      # system configuration
```
