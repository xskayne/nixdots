{
  pkgs,
  user,
  hostname,
  ...
}:

{
  imports = [
    ../../modules/packages/ranni.nix
    ../../modules/system.nix
  ];

  boot = {
    # Override the Linux kernel used by NixOS
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      # Whether the installation process is allowed to modify EFI boot variables
      efi.canTouchEfiVariables = true;

      # Whether to enable the systemd-boot (formerly gummiboot) EFI boot manager
      systemd-boot.enable = true;
    };
  };

  users = {
    # The contents of the user and group files will simply be replaced on system activation
    mutableUsers = false;

    users = {
      shane = {
        # Indicates whether this is an account for a “real” user
        isNormalUser = true;

        # A short description of the user account
        description = "shane";

        # The user's home directory
        home = "/home/shane";

        # The user's auxiliary groups
        extraGroups = [
          "networkmanager"
          "wheel"
        ];

        # Specifies the hashed password for the user
        hashedPassword = "$6$YcBDZH8TcBJZV3hF$R8K16FSCrRfPVB3QqolKlbRfv09ATRwfCn1GVq3YTMcEERgcA6.2bCITLoEgvIJhHY4g1/gdnCfwxj/7urKtu1";
      };
    };
  };

  networking = {
    # The name of the machine
    hostName = "ranni";

    # Whether to use NetworkManager to obtain an IP address and other
    # configuration for all network interfaces that are not configured
    networkmanager.enable = true;
  };

  services = {
    displayManager = {
      # Graphical session to pre-select in the session chooser
      # (only effective for GDM, LightDM and SDDM)
      defaultSession = "plasma";

      sddm = {
        # Whether to enable sddm as the display manager
        enable = true;

        # Whether to enable experimental Wayland support
        wayland.enable = true;
      };
    };

    desktopManager.plasma6 = {
      # Enable the Plasma 6 (KDE 6) desktop environment
      enable = true;
    };
  };

  # This option defines the first version of NixOS you have installed on this
  # particular machine, and is used to maintain compatibility with application
  # data (e.g. databases) created on older NixOS versions
  system.stateVersion = "24.11";
}
