<p align="center">
	<img src="https://avatars.githubusercontent.com/u/153896521?v=4" height="128" />
</p>

<h2 align="center">xSKAYNE's Dotfiles</h2>

<p align="center">
	<a href="">
		<img alt="" src="https://img.shields.io/github/stars/xskayne/dotfiles?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" />
	</a>
	<a href="">
		<img alt="" src="https://img.shields.io/badge/NixOS-24.11-info?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41" />
	</a>
	<a href="">
		<img alt="" src="https://img.shields.io/badge/Nix%20Flakes-Learning-DDB6F2?style=for-the-badge&logo=nixos&logoColor=D9E0EE&labelColor=302D41" />
	</a>
</p>

This repository contains personal configuration(s) for setting up a system with NixOS using [Flakes](https://nixos.wiki/wiki/Flakes) & [Home Manager](https://nix-community.github.io/home-manager/).

## Why Nix?

Nix allows for an easy to manage, collaborative, reproducible deployment. This means that once something is setup and configured, it works forever. If someone else shares their configuration, anyone can make use of it.

## Components

|                             | **NixOS (Wayland)**                                                                        |
| --------------------------- | ------------------------------------------------------------------------------------------ |
| **Window Manager**          | [Hyprland](https://github.com/hyprwm/Hyprland)                                             |
| **Terminal Emulator**       | [Kitty](https://github.com/kovidgoyal/kitty)                                               |
| **Bar**                     | [Waybar](https://github.com/Alexays/Waybar)                                                |
| **Application Launcher**    | [Rofi](https://github.com/davatorium/rofi)                                                 |
| **Notification Daemon**     | [Dunst](https://github.com/dunst-project/dunst)                                            |
| **Wallpapers**              | [Hyprpaper](https://github.com/hyprwm/hyprpaper)                                           |
| **Display Manager**         | [GDM](https://wiki.archlinux.org/title/GDM)                                                |
| **Network Management**      | [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager)                           |
| **System Resource Monitor** | [htop](https://github.com/htop-dev/htop)                                                   |
| **File Manager**            | [Nemo](https://github.com/linuxmint/nemo)                                                  |
| **Shell**                   | [Starship](https://github.com/starship/starship)                                           |
| **Media Player**            | [Jellyfin](https://github.com/jellyfin/jellyfin), [mpv](https://github.com/mpv-player/mpv) |
| **Text Editor**             | [Visual Studio Code](https://github.com/microsoft/vscode)                                  |
| **Fonts**                   | [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)                                      |

## Wallpaper

<p align="center">
	<img src="https://i.imgur.com/rTvN4Hy.jpeg" />
    Artwork by <strong>Anastasia Ermakova</strong> | <a href="https://www.artstation.com/shinasty">ArtStation</a>
</p>

## Hosts

See [hosts](../hosts) for details.

## ISO

See [iso](../iso) for details.

## How to deploy this flake?

> 🚨 **IMPORTANT**: **You should NOT deploy this flake directly on your machine(s). It will not succeed.** This flake contains my hardware configuration _(such as [hardware-configuration.nix](../hosts/snugglehub/hardware-configuration.nix) etc.)_ which is not suitable for your hardware.

For NixOS, use the following command(s):

```bash
git clone https://github.com/xskayne/nixdots
cd nixdots
nixos-rebuild switch --flake .#<host>
```

For generating a custom image, use the following command:

```bash
cd iso
nix build .#nixosConfigurations.iso.config.system.build.isoImage -no-write-lock-file
```

## References

- [The Ultimate NixOS HomeLab Guide](https://jasperclarke.com/blog/nixos-homelab-the-install#setup-and-partitioning)
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world)
