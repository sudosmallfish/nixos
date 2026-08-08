{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.gaming = moduleWithSystem ({ 
    pkgs,
    unfreePkgs,
    ... 
  }: {...}: let
    modules = with self.nixosModules; [
      steam
    ];
  in {
    imports = modules;
    environment.systemPackages = [
      pkgs.prismlauncher
      pkgs.olympus
      pkgs.r2modman
      unfreePkgs.discord
    ]; 
  });
}