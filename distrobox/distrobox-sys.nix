{ config, pkgs, ... }:

{

  # enable podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # install distrobox
  environment.systemPackages = [ pkgs.distrobox ];

  # distrobox specific aliases
  programs.bash.shellAliases = {
    build-container = "distrobox-assemble create --file /home/jake/my-configs/distrobox/manifest.ini";
    install-julia = "distrobox-enter --name ubuntu -- curl -fsSL https://install.julialang.org | sh";
    julia = "distrobox-enter --name ubuntu -- /home/jake/.juliaup/bin/julia";
  };






}