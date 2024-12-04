{ lib,  config, pkgs, ... }:

{

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


    dconf.settings = {

      # hot edges
      "org/gnome/mutter" = {
        edge-tiling = true;
      };

      # terminal shortcut
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control><Alt>t";
        command = "xterm";
        name = "open-terminal";
      };

      # wallpaper shortcut
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Control><Alt>w";
        command = "bash -i -c 'draw'";
        name = "generate-new-wallpaper";
      };

      # apply keyboard shortcuts
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          ];
      };

      # enable gnome extensions
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
            "caffeine@patapon.info"
            "pop-shell@system76.com"
            "blur-my-shell@aunetx"
        ];
      };

  };


  home.packages = with pkgs; [
      
      # gnome extensions
      gnomeExtensions.burn-my-windows
      gnomeExtensions.blur-my-shell
      gnomeExtensions.caffeine
      gnomeExtensions.pop-shell

  ];



  };


  



}