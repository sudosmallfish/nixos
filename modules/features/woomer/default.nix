{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.woomer = moduleWithSystem ({self', ...}: {
    environment.systemPackages = with self'.packages; [
      woomer
    ];
  });
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages.woomer = inputs.wrappers.lib.wrapPackage ({...}: {
      inherit pkgs;
      package = inputs'.woomer.packages.default;
      flags = {
        "--monitor" = "DP-3";
        "--output" = "DP-3";
        "--radius" = "2";
      };
    });
  };
}
