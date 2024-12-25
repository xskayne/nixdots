{
  services.radarr = {
    # Enable bazarr
    enable = true;

    # Group under which bazarr runs
    group = "media";

    # Open ports in the firewall for the bazarr web interface
    openFirewall = true;
  };
}
