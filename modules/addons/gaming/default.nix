{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.gaming = moduleWithSystem ({ 
    pkgs, 
    ... 
  }: {...}: let
    modules = with self.nixosModules; [
      steam
    ];
  in {
    imports = modules;

    environment.systemPackages = with pkgs; [
      prismlauncher
      everest
      r2modman      
    ]; 
  });
}