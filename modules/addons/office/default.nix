{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.office = moduleWithSystem ({pkgs, unfreePkgs, ...}: {
    environment.systemPackages = with pkgs; [
      libreoffice
     ]; 
    programs.thunderbird.enable = true;

    
  });
}