{ self, inputs, ... }: {

  flake.nixosModules.hyprland = { pkgs, lib, ... }: {
    programs.hyprland = {
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHypr;
    };
  };


  perSystem = { pkgs, lib, self', ... }: {
    packages.myHypr = inputs.wrapper-modules.wrappers.hyprland.wrap {
      inherit pkgs;
      settings = {

      };
    };
  };
}
