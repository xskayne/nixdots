{
  services.sonarr = {
    # Enable sonarr
    enable = true;

    # Group under which sonarr runs
    group = "media";

    # Open ports in the firewall for the sonarr web interface
    openFirewall = true;
  };

  # Fixes a build error in 'sonarr' when using NixOS 24.11
  # See: https://github.com/NixOS/nixpkgs/issues/360592
  nixpkgs.config.permittedInsecurePackages = [
    "aspnetcore-runtime-6.0.36"
    "aspnetcore-runtime-wrapped-6.0.36"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
  ];
}
