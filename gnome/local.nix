{ config, pkgs, ... }:

{

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

    # apply keyboard shortcuts
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    # enable gnome extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "burn-my-windows@schneegans.github.com"
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



}