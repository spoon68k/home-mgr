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

    # Runtime decrypted age secrets for home manager
    homeage = {
      url = "github:jordanisaacs/homeage?ref=323037e";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { flake-utils, nixpkgs, nurpkgs, homeage, nixneovim, home-manager, nix-colors, ... }: 

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
        homeage.homeManagerModules.homeage
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
