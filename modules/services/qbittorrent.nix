{
  imports = [
    ./custom/qbittorrent.nix
  ];

  services.qbittorrent = {
    # Enable qBittorrent
    enable = true;

    # Group under which qBittorrent runs
    group = "media";

    # Open ports in the firewall for the qBittorrent web interface
    openFirewall = true;
  };
}
