{ config, lib, pkgs, modulesPath, ... }:

{
  # hostname specific bits
  networking.hostName = "laptop";
  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/my-configs/#laptop";
    update = "sudo nix flake update --flake ~/my-configs";
  };


  # The following is generated by running nixos-generate-config on my laptop.
}