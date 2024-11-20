{ lib, config, pkgs, ... }:

{

  options = {

    colloid-icons.enable = lib.mkEnableOption "Enables Colloid Icons";

  };

  config = lib.mkIf config.colloid-icons.enable {

    # icons
    gtk.enable = true;
    gtk.iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

  };


}
