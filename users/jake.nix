{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "jake";
  home.homeDirectory = "/home/jake";

  imports = [
    ./../desktop-environments/deepin/deepin-hm.nix
  ];

  # enable colloid icons
  # icons.colloid = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    nnn
    git
    vscode
    vivaldi
    julia

  ];

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