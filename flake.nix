{
  inputs = {
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixunst.url = "github:nixos/nixpkgs/nixos-unstable";

    otter-launcher = {
      url = "github:kuokuo123/otter-launcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    woomer = {
      url = "github:coffeeispower/woomer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spotx-nix = {
      url = "github:SpotX-Official/SpotX-Nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";

  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
