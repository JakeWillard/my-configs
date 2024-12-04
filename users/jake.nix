{ lib, config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "jake";
  home.homeDirectory = "/home/jake";

  imports = [
    ./../desktop-environments/gnome/gnome-hm.nix
  ];

  # enable colloid icons
  gnome-hm.colloid = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    nnn
    git
    vscode
    vivaldi
    julia

  ];

  # make vivaldi default browser
  home.sessionVariables.BROWSER = "vivaldi";

  # choose kitty as main terminal
  gnome-hm.terminal = "kitty";

  # configure kitty
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      background_opacity = "0.5";
    };
  };

  # configure git
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