{
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../../modules/packages/snugglehub.nix
    ../../modules/system.nix
    ../../modules/services/_default.nix
    ../../modules/docker/_default.nix
  ];

  boot = {
    loader = {
      # Whether to enable the systemd-boot (formerly gummiboot) EFI boot manager
      systemd-boot.enable = true;

      # Whether the installation process is allowed to modify EFI boot variables
      efi.canTouchEfiVariables = true;
    };
  };

  # Rules for creation, deletion and cleaning of volatile and temporary
  # files automatically
  systemd.tmpfiles.rules = [
    "d /mnt/media/movies 0770 - media - -"
    "d /mnt/media/shows 0770 - media - -"
    "d /mnt/media/downloads 0770 - media - -"
    "d /mnt/media/downloads/temp 0770 - media - -"
    "d /mnt/docker 0770 - docker - -"
  ];

  users = {
    # The contents of the user and group files will simply be replaced on
    # system activation
    mutableUsers = false;

    # Additional groups to be created automatically by the system
    groups = {
      media = { };
      docker = { };
    };

    # Additional user accounts to be created automatically by the system
    users = {
      lab = {
        # Indicates whether this is an account for a “real” user
        isNormalUser = true;

        # A short description of the user account
        description = "lab";

        # Whether to create the home directory and ensure ownership as well as
        # permissions to match the user
        createHome = true;

        # The user's home directory
        home = "/home/lab";

        # The user's auxiliary groups
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
        ];

        # Specifies the hashed password for the user
        hashedPassword = "$6$EPEf45Mo35eriJGn$ZvKKuePtfhsiI0zcLeWXrXMVUSlnhHW/RHiYhZGJREPUgvAB8FOD0qVQvVUwGIb0AqIiCESSKlZfoakeiP8Xu0";

        # A list of verbatim OpenSSH public keys that should be added to the
        # user's authorized keys
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEpIZr3Ja63dJyt8UXx5Z3cWZJfCGgmlVsRO1DYtACZ2 shane.wilson@myyahoo.com"
        ];
      };
    };
  };

  networking = {
    # The name of the machine
    hostName = "snugglehub";

    # Whether to use NetworkManager to obtain an IP address and other
    # configuration for all network interfaces that are not configured
    networkmanager.enable = true;

    firewall = {
      #List of TCP ports on which incoming connections are accepted
      allowedTCPPorts = [
        8080
        81
      ];
    };
  };

  services = {
    # Username of the account that will be automatically logged in at the
    # console
    getty.autologinUser = "lab";

    openssh = {
      # Whether to enable the OpenSSH secure shell daemon, which allows
      # secure remote logins
      enable = true;

      # Whether to automatically open the specified ports in the firewall
      openFirewall = true;

      settings = {
        # Specifies whether password authentication is allowed
        PasswordAuthentication = false;

        # Specifies whether keyboard-interactive authentication is allowed
        KbdInteractiveAuthentication = false;
      };
    };
  };

  # This option defines the first version of NixOS you have installed on this
  # particular machine, and is used to maintain compatibility with application
  # data (e.g. databases) created on older NixOS versions
  system.stateVersion = "24.11";
}
