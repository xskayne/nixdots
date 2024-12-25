{
  services.radarr = {
    # Enable radarr
    enable = true;

    # Group under which radarr runs
    group = "media";

    # Open ports in the firewall for the radarr web interface
    openFirewall = true;
  };
}
