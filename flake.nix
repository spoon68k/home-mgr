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

        # Manager for dotfiles
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { flake-utils, nixpkgs, nurpkgs, nixneovim, home-manager, nix-colors, ... }: 

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
                ./home.nix
            ];

            mkHome = settings:

            home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {
                    inherit settings nix-colors;
                };
                modules = [{inherit imports;}];
            };

            systems = builtins.fromJSON (builtins.readFile "/etc/systems.json");

            configs = builtins.mapAttrs (host: settings: mkHome settings) systems;

        in {
            homeConfigurations = configs;
        });

}
