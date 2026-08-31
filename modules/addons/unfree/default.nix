{
    self,
    moduleWithSystem,
    ...
}: {
    flake.nixosModules.unfree = moduleWithSystem ({ 
      pkgs,
      unfreePkgs, 
      ... 
    }: {
    programs.localsend.enable = true;

    environment.systemPackages = with unfreePkgs; [
      obsidian
      discord
    ]; 
  });
}