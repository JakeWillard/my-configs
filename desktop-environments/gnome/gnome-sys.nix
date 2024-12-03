{ lib, config, pkgs, ... }:

{

  options = {


    gnome-sys.scheme = lib.mkOption {
        type = lib.types.str;
        default = "gruvbox-dark-hard";
    };



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

  # stylix theme
  stylix = {

    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.gnome-sys.scheme}.yaml";
    image = config.lib.stylix.pixel "base01";


  };


};


}

