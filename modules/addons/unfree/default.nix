{
    self,
    moduleWithSystem,
    ...
}: {
    flake.nixosModules.unfree = moduleWithSystem ({ 
      pkgs,
      unfreePkgs, 
      unstPkgs,
      ... 
    }: {
    programs.localsend.enable = true;

    environment.systemPackages = [
      unfreePkgs.obsidian
      unfreePkgs.discord
    ]; 
  });
}
