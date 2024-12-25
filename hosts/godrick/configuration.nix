{
  pkgs,
  user,
  hostname,
  ...
}:

{
  imports = [
    ../../modules/system.nix
  ];

  boot = {
    loader = {
      efi = {
        # Whether the installation process is allowed to modify EFI boot variables
        canTouchEfiVariables = true;

        grub = {
          # Whether to enable the GNU GRUB boot loader
          enable = true;

          # Whether GRUB should be built with EFI support
          efiSupport = true;

          # The device on which the GRUB boot loader will be installed
          device = "nodev";
        };
      };
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
        hashedPassword = "$6$9Ja/4rMnMflc1pLf$s0tKLfYDkNEmDRQLYAuqgQTann3xCdCdfzxsGIIthREaCpCx41.Tahf0ADGt21XTcGTAzorLA8tMJ41Qepl.w.";
      };
    };
  };

  networking = {
    # The name of the machine
    hostname = "godrick";

    # Whether to use NetworkManager to obtain an IP address and other
    # configuration for all network interfaces that are not configured
    networkmanager.enable = true;
  };

  # This option defines the first version of NixOS you have installed on this
  # particular machine, and is used to maintain compatibility with application
  # data (e.g. databases) created on older NixOS versions
  system.stateVersion = "24.11";
}
