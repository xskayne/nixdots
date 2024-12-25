{ pkgs, ... }:

{
  # The set of packages that appear in /run/current-system/sw. These
  # packages are automatically available to all users, and are
  # automatically updated every time you rebuild the system configuration
  environment.systemPackages = with pkgs; [
    protonvpn-cli_2
    qbittorrent-nox
  ];
}
