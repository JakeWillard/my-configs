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
    ubuntu-run = "distrobox enter ubuntu";
    zoom-install = ''
      curl https://zoom.us/client/latest/zoom_amd64.deb -o ~/zoom.deb
      distrobox-enter --name ubuntu -- sudo dpkg -i ~/zoom.deb
      distrobox-enter --name ubuntu -- sudo apt install -f
      distrobox-enter --name ubuntu -- sudo apt update
      distrobox-enter --name ubuntu -- sudo apt upgrade
      distrobox-enter --name ubuntu -- distrobox-export --app zoom
    '';
    install-julia = "distrobox-enter --name ubuntu -- sudo curl -fsSL https://install.julialang.org | sh";
    julia = "distrobox-enter --name ubuntu -- /home/jake/.juliaup/bin/julia";
  };






}