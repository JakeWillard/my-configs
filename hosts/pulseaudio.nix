{ config, lib, pkgs, modulesPath, ... }:

{
  hardware.pulseaudio.configFile = pkgs.runCommand "default.pa" {} ''
  sed 's/module-udev-detect$/module-udev-detect tsched=0/' \
    ${pkgs.pulseaudio}/etc/pulse/default.pa > $out
  '';
}