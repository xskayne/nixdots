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

## Hosts

See [hosts](../hosts) for details.

## ISO

See [iso](../iso) for details.

## How to deploy this flake?

> 🚨 **IMPORTANT**: **You should NOT deploy this flake directly on your machine(s). It will not succeed.** This flake contains my hardware configuration _(such as [hardware-configuration.nix](../hosts/snugglehub/hardware-configuration.nix) etc.)_ which is not suitable for your hardware.

For NixOS, use the following command(s):

```bash
sudo nixos-rebuild switch --flake .#<host>
```

For generating a custom image, use the following command(s):

```bash
cd iso && nix build .#nixosConfigurations.iso.config.system.build.isoImage -no-write-lock-file
```
