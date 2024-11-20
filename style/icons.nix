{ lib, config, pkgs, ... }:

{
 # # imports = [
 # #   ./colloid-icons.nix
 # #   ./papirus-icons.nix
 # # ];

  options = {
    icons.colloid = lib.mkEnableOption "Colloid Icons";
    icons.papirus = lib.mkEnableOption "Papirus Icons";
  };


  config = {

    gtk.enable = true;
    gtk.iconTheme = lib.optionalAttrs config.icons.colloid {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    } // lib.optionalAttrs config.icons.papirus {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

  };



}