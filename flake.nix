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
 
        # Manager for dotfiles
        home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        # Work flag
        work-flag.url = "github:boolean-option/false";
 
        # Graphical support flag
        grfx-flag.url = "github:boolean-option/false";
    };

    outputs = { flake-utils, nixpkgs, nurpkgs, nixneovim, home-manager,
                nix-colors, sops-nix, work-flag, grfx-flag, ... }: 

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

            mkHome = settings: home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {
                    inherit settings nix-colors work-flag grfx-flag;
                };
                modules = [{inherit imports;}];
            };

            systems = builtins.fromJSON (builtins.readFile "/etc/systems.json");

            configs = builtins.mapAttrs (host: settings: mkHome settings) systems;

        in {
            homeConfigurations = configs;
        });

}
