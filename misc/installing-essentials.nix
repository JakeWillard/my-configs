
{ config, pkgs, ... }:

{


  # Enable networking
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jake = {
    isNormalUser = true;
    description = "jake";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "boop";
  };


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes
  nix.settings.experimental-features= [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # hostname stuff
  networking.hostName = "desktop";
  programs.bash.shellAliases.rebuild = "sudo nixos-rebuild switch --flake ~/my-configs/#desktop";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = false;
  services.desktopManager.gnome.enable = true;

  # Remove some default GNOME packages.
  environment.gnome.excludePackages = with pkgs; [
      cheese      # photo booth
      geary
      epiphany    # web browser
      simple-scan # document scanner
      gnome-calculator 
      gnome-calendar 
      gnome-characters
      gnome-contacts
      gnome-font-viewer 
      gnome-logs 
      gnome-maps 
      pkgs.gnome-connections
  ];

  environment.systemPackages = with pkgs; [

    vim 
    wget
    curl
    xdg-utils
    pass
    git
    
  ];

  # NEEDED FOR NVIDIA

  # # Enable OpenGL
  # hardware.graphics.enable = true;

  # # Load nvidia driver for Xorg and Wayland
  # services.xserver.videoDrivers = ["nvidia"];

  # hardware.nvidia = {
    
  #   modesetting.enable = false;
  #   powerManagement.enable = false;
  #   powerManagement.finegrained = false;
  #   open = false;
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

}

