{
  lib,
  pkgs,
  ...
}:

{
  nix = {
    settings = {
      # Enable flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Automatically detect files in the store that have identical
      # contents, and replaces them with hard links to a single copy
      auto-optimise-store = true;
    };

    gc = {
      # Automatically run the garbage collector at a specific time
      automatic = lib.mkDefault true;

      # How often or when garbage collection is performed
      dates = lib.mkDefault "weekly";

      # Options given to 'nix-collect-garbage' when the garbage collector is
      # run automatically
      options = lib.mkDefault "--delete-older-then 7d";
    };
  };

  nixpkgs.config = {
    # Allows the use of closed source packages
    allowUnfree = true;
  };

  # The time zone used when displaying times and dates
  time.timeZone = "Europe/London";

  i18n = {
    # The default locale
    defaultLocale = "en_GB.UTF-8";

    # A set of additional system-wide locale settings other than LANG
    # which can be configured with i18n.defaultLocale
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  console = {
    # Enable setting virtual console options as early as possible (in initrd)
    earlySetup = true;

    # The font used for the virtual consoles
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";

    # List of additional packages that provide console fonts, keymaps and other
    # resources for virtual consoles use
    packages = with pkgs; [
      terminus_font
    ];

    # The keyboard mapping table for the virtual consoles
    keyMap = "uk";
  };

  fonts = {
    # List of primary font packages
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      (nerdfonts.override {
        fonts = [
          "Iosevka"
          "JetBrainsMono"
        ];
      })
    ];

    # Enable a basic set of fonts providing several styles and families
    # and reasonable coverage of Unicode
    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      # System-wide default serif font(s)
      serif = [
        "Noto Serif"
        "Noto Color Emoji"
      ];

      # System-wide default sans serif font(s)
      sansSerif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];

      # System-wide default monospace font(s)
      monospace = [
        "GeistMono Nerd Font"
        "Noto Color Emoji"
      ];

      # System-wide default emoji font(s)
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };

  # The set of packages that appear in /run/current-system/sw. These
  # packages are automatically available to all users, and are
  # automatically updated every time you rebuild the system configuration
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    nixfmt-rfc-style
    pciutils
    usbutils
    tree
  ];

  hardware = {
    # Whether to enable the PulseAudio sound server
    pulseaudio.enable = false;

    graphics = {
      # Whether to enable hardware accelerated graphics drivers
      enable = true;

      # On 64-bit systems, whether to also install 32-bit drivers for
      # 32-bit applications (such as Wine)
      enable32Bit = true;
    };
  };

  # Whether to enable the RealtimeKit system service, which hands out
  # realtime scheduling priority to user processes on demand. For example, the
  # PulseAudio server uses this to acquire realtime priority
  security.rtkit.enable = true;

  networking = {
    # Additional verbatim entries to be appended to /etc/hosts.
    extraHosts = ''
      192.168.0.214 godrick
      192.168.0.110 ranni
      192.168.0.181 snugglehub
    '';
  };

  services = {
    # Whether to enable printing support through the CUPS daemon
    printing.enable = true;

    libinput = {
      # Whether to enable libinput
      enable = true;

      touchpad = {
        # Enables or disables natural scrolling behavior
        naturalScrolling = true;
      };
    };

    xserver = {
      # Whether to enable the X server
      enable = true;

      # X keyboard layout, or multiple keyboard layouts separated by commas
      xkb.layout = "gb";
    };

    # Whether to enable power-profiles-daemon, a DBus daemon that allows
    # changing system behavior based upon user-selected power profiles
    power-profiles-daemon.enable = true;

    pipewire = {
      # Whether to enable PipeWire service
      enable = true;

      # Whether to enable ALSA support
      alsa.enable = true;

      # Whether to enable 32-bit ALSA support on 64-bit systems
      alsa.support32Bit = true;

      # Whether to enable PulseAudio server emulation
      pulse.enable = true;

      # Whether to enable JACK audio emulation
      jack.enable = true;
    };
  };
}
