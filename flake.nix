{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    limine.url = "github:czapek1337/limine-nix";
    vscode-server.url = "github:msteen/nixos-vscode-server";
  };

  outputs = {
    self,
    nixpkgs,
    limine,
    vscode-server,
  }:
    with nixpkgs; {
      nixosConfigurations = {
        nixos-vm = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            limine.nixosModule
            vscode-server.nixosModule
            ./hosts/vm.nix
          ];
        };
      };
    };
}
