{
    description = "Flake to setup home packages and dotfiles";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        sops-nix.url = "github:Mic92/sops-nix";
    };

    outputs = { self, nixpkgs, home-manager, sops-nix,... }: {

        homeModule = { home, username, system, promptColour, 
                       gitProfile, gfxPackages, copilotEnabled, obsidianVaults, ... }:

            home-manager.lib.homeManagerConfiguration {

                pkgs = import nixpkgs {
                    inherit system;
                    config.allowUnfree = true;
                };

                extraSpecialArgs = {
                    root = self;
                    inherit home username promptColour gitProfile gfxPackages copilotEnabled obsidianVaults;
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
