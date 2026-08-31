{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.systemTheme = {
    config,
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      catppuccinGtk
    ];
  in {
    imports = modules;
  };
}
