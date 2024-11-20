{ lib, config, pkgs, ... }:

{

  options = {

    colors.gruvbox-one = lib.mkEnableOption "Gruvbox Theme #1";
    colors.catppuccin-one = lib.mkEnableOption "Catppuccin Theme #1";
    colors.woodland = lib.mkEnableOption "Woodland Theme";

  };


  config = {

    stylix = lib.optionalAttrs config.colors.gruvbox-one {

        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        image = ./wallpapers/night-lake.jpg;


    } // lib.optionalAttrs config.colors.catppuccin-one {

        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
        image = ./wallpapers/minimal-mountain.jpg;

    } // lib.optionalAttrs config.colors.woodland {

        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/woodland.yaml";
        image = ./wallpapers/darkwoods.jpg;

    };


  };

}