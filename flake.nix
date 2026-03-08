{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    awww.url   = "git+https://codeberg.org/LGFae/awww";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, awww, ... }:
  let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix

        # Import the Home Manager NixOS module
        home-manager.nixosModules.home-manager

        # Then configure Home Manager
        {
          home-manager.useGlobalPkgs  = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          # Point to your home.nix
          home-manager.users.nexus = import ./home.nix;
        }
      ];

      specialArgs = { inherit awww; };
    };
  };
}
