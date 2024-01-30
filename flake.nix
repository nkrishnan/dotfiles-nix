{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...}:
    let
      system = "x86_64-linux";
      username = "nkrishnan";
    in {
      defaultPackage.${system} = home-manager.defaultPackage.${system};
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
	      pkgs = import nixpkgs { system = "${system}"; };
        modules = [ ./home.nix ];
      };
    };
} 
