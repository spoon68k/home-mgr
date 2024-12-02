{
  description = "Flake to setup home packages and dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, home-manager, sops-nix,... }:
    let
      system = "x86_64-linux";
    in {
      homeModule = { username, git-profile, gui-packages, obsidian-landing, ... }:
         home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          # Pass the root path to your Home Manager configuration
          extraSpecialArgs = {
            root = self;
            inherit username git-profile gui-packages;
          };

          # Include your Home Manager modules
          modules = [
            { programs.home-manager.enable = true; }
            sops-nix.homeManagerModules.sops
            ./lib/packages.nix
            ./lib/sops.nix
            ./lib/dotfiles.nix
            ./lib/shell.nix
            ./lib/home.nix
          ];
        };
      };
}
