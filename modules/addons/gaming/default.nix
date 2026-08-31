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
    environment.systemPackages = with pkgs; [
      prismlauncher
      olympus
      r2modman
    ]; 
  });
}