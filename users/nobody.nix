{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "nobody";
  home.homeDirectory = "/home/nobody";

  imports = [
    ./../style/icons.nix
    ./../desktop-environments/gnome-hm.nix
  ];

  # enable papirus icons
  icons.papirus = true;
  #colloid-icons.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    vivaldi

  ];
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