{ config, lib, pkgs, modulesPath, ... }:

{
  # hostname specific bits
  networking.hostName = "desktop";
  programs.bash.shellAliases.rebuild = "sudo nixos-rebuild switch --flake ~/my-configs/#desktop";

  # hardware fixes
  # imports = [ ./nvidia.nix ];#./pulseaudio.nix ];

  # The following is generated by running nixos-generate-config on my desktop computer. 

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./nvidia.nix
    ./pulseaudio.nix
  ];

  # try this to fix audio popping
  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0 power_save_controller=N
  '';

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ebdbdb6a-91c2-424b-86da-b19139ec7e23";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3A85-860C";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f0u5.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
