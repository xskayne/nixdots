{ pkgs, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix"
  ];

  # Override the Linux kernel used by NixOS
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # The name of the machine
  networking.hostName = "iso";

  nixpkgs = {
    # Specifies the platform where the NixOS configuration will run
    hostPlatform = "x86_64-linux";

    # Allows the use of closed source packages
    config.allowUnfree = true;
  };

  # The set of packages that appear in /run/current-system/sw. These
  # packages are automatically available to all users, and are
  # automatically updated every time you rebuild the system configuration
  environment.systemPackages = with pkgs; [
    git
  ];

  nix = {
    settings = {
      # Enable flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
