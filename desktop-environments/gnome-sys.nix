{ config, pkgs, ... }:

{

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

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

}
