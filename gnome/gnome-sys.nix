{ lib, config, pkgs, ... }:

{

  #imports = [ ./wallpaper.nix ];


  options = {


  };


  config = {

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

};


}

