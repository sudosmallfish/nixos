{inputs, ...}: {
  perSystem = {system, ...}: {
    _module.args.unfreePkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
  flake.nixosModules.nix = {...}: {
    nix = {
      registry = {
        sudosmallfish = {
          from = {
            id = "sudosmallfish";
            type = "indirect";
          };
          to = {
            type = "git";
            url = "https://github.com/sudosmallfish/nixos.git";
          };
        };
      };
      settings = {
        trusted-users = ["root" "user"];
        download-buffer-size = 524288000;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 5d";
      };
    };
    nixpkgs = {
      config = {
        allowUnfree = true;
        packageOverrides = pkgs: {
          unstable = import inputs.nixpkgs-unstable {
            config = {
              allowUnfree = true;
            };
          };
        };
      };
    };
  };
}
