{	self, inputs, ... }: {

  flake.nixosModules.prismlauncher = { pkgs, self',	inputs', ... }: {
    imports = modules;
    programs.prismlauncher = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myPACKAGE;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myPACKAGE = inputs.wrapper-modules.wrappers.prismlauncher.wrap {
      inherit pkgs;
      settings = {

      };
    };
  };
}
