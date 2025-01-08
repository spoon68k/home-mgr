{
    description = "Flake to setup home packages and dotfiles";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        sops-nix.url = "github:Mic92/sops-nix";
    };

    outputs = { self, nixpkgs, home-manager, sops-nix,... }: {

        homeModule = { username, system, promptColour, 
                       gitProfile, gfxPackages, openingNote, ... }:

            home-manager.lib.homeManagerConfiguration {

                pkgs = import nixpkgs {
                    inherit system;
                    config.allowUnfree = true;
                };

                extraSpecialArgs = {
                    root = self;
                    inherit username promptColour gitProfile gfxPackages openingNote;
                };

                modules = [
                    { programs.home-manager.enable = true; }
                    sops-nix.homeManagerModules.sops
                    ./lib/packages.nix
                    ./lib/sops.nix
                    ./lib/dotfiles.nix
                    ./lib/home.nix
                ];
            };
    };
}
