{ lib, config, pkgs, ... }:

{

  #imports = [ ./wallpaper.nix ];


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

  # # stylix theme
  # stylix = {

  #   enable = true;
  #   base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.gnome-sys.scheme}.yaml";
  #   image = config.lib.stylix.pixel "base01";


  # };

  # environment.systemPackages = [

  #   (import ./draw-wallpaper.nix {inherit pkgs; colors=config.lib.stylix.colors.withHashtag;})

  # ];

  # programs.bash.shellAliases.draw = "draw-wallpaper; gsettings set org.gnome.desktop.background picture-uri 'file:///home/jake/.wallpaper.png'; gsettings set org.gnome.desktop.background picture-uri-dark 'file:///home/jake/.wallpaper.png'";

};


}

