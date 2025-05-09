
{ config, pkgs, ... }:

{

  imports = [
    ./gnome/gnome-sys.nix
    # ./distrobox/distrobox-sys.nix
   ];

  # find base16 schemes here: https://tinted-theming.github.io/base16-gallery/
  gnome-sys.scheme = "da-one-paper";


  # alias for updating the flake
  programs.bash.shellAliases.update = "sudo nix flake update --flake ~/my-configs";


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jake = {
    isNormalUser = true;
    description = "jake";
    extraGroups = [ "networkmanager" "wheel" ];
    # initialPassword = "boop";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes
  nix.settings.experimental-features= [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # misc
    neofetch
    zip
    xz
    unzip
    p7zip
    vim 
    wget
    curl
    xdg-utils
    pass
    popsicle
    protonvpn-gui
    
  ];

  # invidious youtube frontend
  # services.invidious = {
  #   enable = true;
  #   nginx.enable = false;
  #   port = 12345;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
