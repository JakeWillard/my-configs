{ lib, config, pkgs, ... }:

{

  options = {

      colors.gruvbox-one = lib.mkEnableOption "Gruvbox Theme #1";
      colors.catppuccin-one = lib.mkEnableOption "Catppuccin Theme #1";
      colors.woodland = lib.mkEnableOption "Woodland Theme";

  };


  config = {

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
  stylix = lib.optionalAttrs config.colors.gruvbox-one {

          enable = true;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
          image = ./../wallpapers/night-lake.jpg;


      } // lib.optionalAttrs config.colors.catppuccin-one {

          enable = true;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
          image = ./../wallpapers/minimal-mountain.jpg;

      } // lib.optionalAttrs config.colors.woodland {

          enable = true;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/woodland.yaml";
          image = ./../wallpapers/darkwoods.jpg;

      };


};


}

