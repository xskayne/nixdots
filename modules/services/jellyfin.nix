{
  services.jellyfin = {
    # Enable jellyfin
    enable = true;

    # Group under which jellyfin runs
    group = "media";

    # Open ports in the firewall for the jellyfin server
    openFirewall = true;
  };
}
