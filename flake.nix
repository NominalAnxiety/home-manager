{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      catppuccin,
      home-manager,
      nix-darwin,
      ...
    }@inputs:
    let
      linuxSystem = "x86_64-linux";
      linuxPkgs = import nixpkgs {
        system = linuxSystem;
        config.allowUnfree = true;
      };
      macSystem = "aarch64-darwin";
      macPkgs = import nixpkgs {
        system = macSystem;
        config.allowUnfree = true;
      };
    in
    {

      homeConfigurations.PC = home-manager.lib.homeManagerConfiguration {
        inherit linuxPkgs;
        extraSpecialArgs = {
	  inherit inputs;
	  username = "austinb";
	  homeDirectory = "/home/austinb";
	};
        modules = [
          ./home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
      darwinConfigurations.mactop = nix-darwin.lib.darwinSystem {
	    inherit macPkgs;
        system = macSystem;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/mac/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
	      extraSpecialArgs = {
		inherit inputs;
		username = "austinbowman";
		homeDirectory = "/Users/austinbowman";
	      };
              users.austinbowman = {
                imports = [
                  ./hosts/mac/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
            };
          }
        ];
      };
    };
}
