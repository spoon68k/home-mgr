{
    description = "Home Manager (dotfiles) configuration";

    inputs = {

        # Unstable channel corresponding to the main dev branch with tested updates
        nixpkgs.url = "nixpkgs/nixos-unstable";

        # Nix community repository
        nurpkgs.url = "github:nix-community/NUR";

        # Flake utilities
        flake-utils.url = "github:numtide/flake-utils";

        # Modules and schemes to make theming with Nix awesome
        nix-colors.url = "github:misterio77/nix-colors";

        # Neovim Nix support
        nixneovim.url = "github:nixneovim/nixneovim";

        # Secrets management using SOPS
        sops-nix.url = "github:Mic92/sops-nix";

        # Tool for reproducible dev environments
        devenv.url = "github:cachix/devenv/latest";

        # Manager for dotfiles
        home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { flake-utils, nixpkgs, nurpkgs, nixneovim,
                devenv, home-manager, nix-colors, sops-nix, ... }: 

        flake-utils.lib.eachDefaultSystem (system: let

            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                overlays = [
                    nurpkgs.overlay
                    nixneovim.overlays.default
                ];
            };

            imports = [
                nix-colors.homeManagerModule
                nixneovim.nixosModules.default
                sops-nix.homeManagerModules.sops
                ./home.nix
            ];

            config = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {
                    inherit nix-colors;
                };
                modules = [{inherit imports;}];
            };

        in {
            homeConfigurations = config;
        });

}
