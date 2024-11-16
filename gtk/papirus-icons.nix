{ config, pkgs, ... }:

{

  # icons
  gtk.enable = true;
  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };


}
