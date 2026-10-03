{ 
  moduleWithSystem,
  ... 
  }: {
  flake.nixosModules.steam = moduleWithSystem ({ 
    pkgs, 
    unstPkgs,
    unfreePkgs,
    lib, 
    ... 
    }: {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = [
        unstPkgs.proton-ge-bin
      ];
    };
    hardware.steam-hardware.enable = true;
  });
}
