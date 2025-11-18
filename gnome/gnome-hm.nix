{ lib,  config, pkgs, ... }:

{

  options = {
    
  };


  config = {

    # help: https://determinate.systems/posts/declarative-gnome-configuration-with-nixos/

    gtk.enable = true;
    gtk.iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };


    dconf.settings = {

      # hot edges
      "org/gnome/mutter" = {
        edge-tiling = true;
      };

      # terminal shortcut
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control><Alt>t";
        command = "kitty";
        #command = "kgx";
        name = "open-terminal";
      };

      # apply keyboard shortcuts
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            # "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          ];
      };

      # task bar
      "org/gnome/shell" = {
        favorite-apps = [
          "vivaldi-stable.desktop"
          "org.gnome.Nautilus.desktop"
          "kitty.desktop"
          #"org.gnome.Console.desktop"
          "codium.desktop"
        ];
      };

  };


  # set default programs
  home.sessionVariables = {
    EDITOR = "gnome-text-editor";
    TERMINAL = "kitty";
    #TERMINAL = "kgx";
  };




  };


  



}
