{ lib,  config, pkgs, ... }:

{

  options = {

    gnome-hm.colloid = lib.mkEnableOption "Colloid Icons";
    gnome-hm.papirus = lib.mkEnableOption "Papirus Icons";
    gnome-hm.terminal = lib.mkOption {
      type = lib.types.str;
      default = "xterm";

    };
    
  };


  config = {

    # help: https://determinate.systems/posts/declarative-gnome-configuration-with-nixos/

    gtk.enable = true;
    gtk.iconTheme = lib.optionalAttrs config.gnome-hm.colloid {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    } // lib.optionalAttrs config.gnome-hm.papirus {
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
        command = "${config.gnome-hm.terminal}";
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
        favorite-apps = [
          "vivaldi-stable.desktop"
          "org.gnome.Nautilus.desktop"
          "kitty.desktop"
          "codium.desktop"
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

  # set default programs
  home.sessionVariables = {
    EDITOR = "gnome-text-editor";
    TERMINAL = "${config.gnome-hm.terminal}";
  };




  };


  



}