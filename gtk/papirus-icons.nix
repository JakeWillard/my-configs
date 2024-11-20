{ lib, config, pkgs, ... }:

{

  options = {

    papirus-icons.enable = lib.mkEnableOption "Enables Papirus Icons";

  };

  config = lib.mkIf config.papirus-icons.enable {

    # icons
    gtk.enable = true;
    gtk.iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

  };


}
