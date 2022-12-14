{pkgs, ...}: {
  imports = [./common.nix];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  boot.initrd.availableKernelModules = ["ata_piix" "mptspi" "uhci_hcd" "ehci_pci" "sd_mod" "sr_mod"];
  boot.loader.limine = {
    enable = true;
    enableEditor = false;
    maxGenerations = 5;
  };

  networking = {
    hostName = "nixos-vm";
    useDHCP = true;
    firewall.enable = false;
  };

  users.users.czapek = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPbpO66odTW2RCoXWhti61+V5KbRB7yFx6GUBQuQ6oiF"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICpw9jZUKutw4Gmy9qqy7dt7E5YcKKgb5CRhqG/2E5Ir"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEIZaaxIh9CAOZcL60JXHQybFeMSOJz/eHQBBN39OK8S"
    ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
    execWheelOnly = true;
  };

  services.vscode-server.enable = true;
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  system.stateVersion = "22.11";
}
