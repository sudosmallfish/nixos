{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.office = moduleWithSystem ({pkgs, unfreePkgs, ...}: {
    environment.systemPackages = [
      pkgs.libreoffice
      pkgs.thunderbird
      unfreePkgs.obsidian
     ]; 

    
  });
}