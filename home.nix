{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "jake";
  home.homeDirectory = "/home/jake";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  gtk.enable = true;
  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  dconf.settings = {

    # hot edges
    "/org/gnome/mutter" = {
      edge-tiling = true;
    };

    # terminal shortcut
    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "xterm";
      name = "open-terminal";
    };

    # apply keyboard shortcuts
    "/org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    # gnome extensions
    "/org/gnome/shell" = {

      disable-user-extensions = false;
      enabled-extensions = [
        "burn-my-windows@schneegans.github.com"
        "caffeine@patapon.info"
        "pop-shell@system76.com"
        "blur-my-shell@aunetx"
      ];
    };

  };

  # set cursor size and dpi for 4k monitor
#   xresources.properties = {
#     "Xcursor.size" = 16;
#     "Xft.dpi" = 172;
#   };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    
    # gnome extensions
    gnomeExtensions.burn-my-windows
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.pop-shell

    nnn
    git
    vscode
    vivaldi
    # zoom-us
    julia

  ];

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "JakeWillard";
    userEmail = "jacob.willard.gr@dartmouth.edu";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}